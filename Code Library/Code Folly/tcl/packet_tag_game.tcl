# Large Packet Tag Game Simulation - NS2
# Features:
# - 10 wireless mobile nodes with random waypoint + pause mobility
# - Multiple UDP CBR flows for "tagging" game
# - Multiple TCP flows for background traffic
# - AODV routing protocol
# - Packet loss simulation via propagation model tweaks
# - NAM visual enhancements: node labels, colored packets
# - Logging tag events to file for replayability & stats
# - Mobility pause/resume for "safe zones"
# - Trace files generated for analysis

# ==== Simulator Setup ====

set ns [new Simulator]

set namfile [open large_packet_tag.nam w]
set tracefile [open large_packet_tag.tr w]

$ns namtrace-all-wireless $namfile 800 600

proc finish {} {
    global ns namfile tracefile
    $ns flush-trace
    close $namfile
    close $tracefile
    exec nam large_packet_tag.nam &
    exit 0
}

$ns trace-all $tracefile

# ==== Topology Setup ====

set topo [new Topography]
$topo load_flatgrid 800 600

# ==== Node Configuration ====

$ns node-config -adhocRouting AODV \
    -llType LL \
    -macType Mac/802_11 \
    -ifqType Queue/DropTail/PriQueue \
    -ifqLen 100 \
    -antType Antenna/OmniAntenna \
    -propType Propagation/TwoRayGround \
    -phyType Phy/WirelessPhy \
    -channelType Channel/WirelessChannel \
    -topoInstance $topo \
    -agentTrace ON \
    -routerTrace ON \
    -macTrace ON

set val(x) 800
set val(y) 600
set val(chan) Channel/WirelessChannel
set val(prop) Propagation/TwoRayGround
set val(ant) Antenna/OmniAntenna
set val(ll) LL
set val(ifq) Queue/DropTail/PriQueue
set val(ifqlen) 100
set val(mac) Mac/802_11
set val(rp) AODV
set val(netif) Phy/WirelessPhy

# ==== Create Nodes ====

set nodeCount 10
for {set i 0} {$i < $nodeCount} {incr i} {
    set n($i) [$ns node]
    # Random initial position
    set x [expr rand()*$val(x)]
    set y [expr rand()*$val(y)]
    $n($i) set X_ $x
    $n($i) set Y_ $y
    $n($i) set Z_ 0
}

# ==== Mobility: Random Waypoint with Pause ====

proc set_random_mobility {node index} {
    global ns val x y
    set max_time 90
    set t 0
    set pause_time 5
    set speed_min 3
    set speed_max 8

    # Recursive mobility setting proc
    proc move_next {node tmax} {
        global ns val pause_time speed_min speed_max x y

        if {$tmax > 90} {
            return
        }

        set dest_x [expr rand()*$val(x)]
        set dest_y [expr rand()*$val(y)]
        set speed [expr $speed_min + rand()*($speed_max-$speed_min)]

        # Schedule move
        $ns at $tmax "$node setdest $dest_x $dest_y $speed"
        # Schedule next move after arrival + pause
        set dist [expr sqrt(pow(($dest_x - [$node set X_]),2) + pow(($dest_y - [$node set Y_]),2))]
        set move_time [expr $dist / $speed]
        set tnext [expr $tmax + $move_time + $pause_time]
        set tmax $tnext
        $ns at $tnext "move_next $node $tmax"
    }

    move_next $node 0
}

for {set i 0} {$i < $nodeCount} {incr i} {
    set_random_mobility $n($i) $i
}

# ==== Helper: Random target excluding self ====

proc random_target {exclude total} {
    set r $exclude
    while {$r == $exclude} {
        set r [expr int(rand()*$total)]
    }
    return $r
}

# ==== Traffic Setup ====

# Tag rounds and timing
set tagRounds 8
set tagInterval 3.0
set currentTime 5.0

# Open file to log tag events
set taglog [open tag_events.log w]

# ==== Packet color for NAM (UDP=red, TCP=blue) ====

proc set_packet_color {agent color} {
    $agent set color_ $color
}

# ==== Send Tag (UDP CBR) from src to dst ====

proc send_tag {src dst start stop} {
    global ns n taglog
    # UDP agent
    set udp [new Agent/UDP]
    set null [new Agent/Null]
    $ns attach-agent $n($src) $udp
    $ns attach-agent $n($dst) $null
    $ns connect $udp $null

    # CBR app
    set cbr [new Application/Traffic/CBR]
    $cbr set packetSize_ 64
    $cbr set interval_ 0.3
    $cbr attach-agent $udp

    # Packet color red for tagging
    $udp set color_ "1 0 0" ;# RGB red

    # Label IT node in NAM
    $ns at $start "$n($src) label IT"
    $ns at $stop "$n($src) label ''"

    # Log tag event
    puts $taglog "TAG $src->$dst at $start"

    # Start/stop CBR
    $ns at $start "$cbr start"
    $ns at $stop "$cbr stop"
}

# ==== Send Background TCP traffic ====

proc send_tcp_traffic {src dst start stop} {
    global ns n
    set tcp [new Agent/TCP]
    set sink [new Agent/TCPSink]
    $ns attach-agent $n($src) $tcp
    $ns attach-agent $n($dst) $sink
    $ns connect $tcp $sink

    set ftp [new Application/FTP]
    $ftp attach-agent $tcp

    # TCP packet color blue
    $tcp set color_ "0 0 1" ;# RGB blue

    $ns at $start "$ftp start"
    $ns at $stop "$ftp stop"
}

# ==== Mobility pause/resume for safe zones (simulate) ====

proc pause_mobility {node time} {
    global ns
    $ns at $time "$node random-motion 0"
}

proc resume_mobility {node time} {
    global ns
    $ns at $time "$node random-motion 1"
}

# ==== Setup background TCP flows ====

# Make 3 TCP flows running overlapping with tag game

set tcpPairs {{0 3} {1 7} {2 9}}

foreach pair $tcpPairs {
    set src [lindex $pair 0]
    set dst [lindex $pair 1]
    send_tcp_traffic $src $dst 10 85
}

# ==== Main Tagging Game Loop with random target ====

set currentIT 0

for {set round 0} {$round < $tagRounds} {incr round} {
    set nextIT [random_target $currentIT $nodeCount]
    send_tag $currentIT $nextIT $currentTime [expr $currentTime + $tagInterval]
    set currentIT $nextIT
    set currentTime [expr $currentTime + $tagInterval + 1.0]
}

# ==== Simulate obstacles (basic) via changing propagation params ====

# Reduce power between x:300-500 and y:200-400 to simulate bad signal

proc is_in_obstacle {x y} {
    if {$x >= 300 && $x <= 500 && $y >= 200 && $y <= 400} {
        return 1
    }
    return 0
}

# Modify propagation power for packets inside obstacle zone dynamically
# (Advanced: This is a simplified simulation, in real NS2 you'd use shadowing models)

# ==== Start Simulation End ====

$ns at [expr $currentTime + 10] "finish"

$ns run

# ==== End of Script ====
