# ===============================================================
# TITLE : Implementation of Link State Routing Algorithm
# ===============================================================

# ===============================================================
# 1. AIM:
# To implement and analyze the Link State Routing Algorithm using NS2.
# ===============================================================

# ===============================================================
# 2. SOFTWARE TOOL:
# Network Simulator 2 (NS2)
# ===============================================================

# ===============================================================
# 3. THEORY:
# Link State Routing is a dynamic routing protocol in which each node
# maintains a full topology of the network. Nodes periodically flood
# link-state information to all other nodes, and each router uses
# Dijkstra's algorithm to compute the shortest path tree.
# ===============================================================

# ===============================================================
# 4. PROCEDURE:
# 1. Create a simulator instance.
# 2. Define nodes and links.
# 3. Attach UDP, NULL, and CBR agents.
# 4. Enable Link State routing protocol.
# 5. Schedule events and run simulation.
# 6. Analyze NAM and AWK outputs.
# ===============================================================

# ===============================================================
# 5. PROGRAM:
# (a) MAIN TCL PROGRAM
# ===============================================================

# Create simulator instance
set ns [new Simulator]

# Open trace files
set tr [open p5.tr w]
$ns trace-all $nr
set nf [open p5.nam w]
$ns namtrace-all $nf

# Enable Link State Routing Protocol
$ns rtproto LS

# Create 12 nodes
for {set i 0} {$i< 12} {incr i} {
    set n($i) [$ns node]
}

# Define duplex links between nodes
$ns duplex-link $n(0) $n(1) 1Mb 10ms DropTail
$ns duplex-link $n(1) $n(2) 1Mb 10ms DropTail
$ns duplex-link $n(2) $n(3) 1Mb 10ms DropTail
$ns duplex-link $n(3) $n(4) 1Mb 10ms DropTail
$ns duplex-link $n(4) $n(5) 1Mb 10ms DropTail
$ns duplex-link $n(5) $n(6) 1Mb 10ms DropTail
$ns duplex-link $n(6) $n(7) 1Mb 10ms DropTail
$ns duplex-link $n(7) $n(8) 1Mb 10ms DropTail
$ns duplex-link $n(8) $n(0) 1Mb 10ms DropTail
$ns duplex-link $n(0) $n(9) 1Mb 10ms DropTail
$ns duplex-link $n(1) $n(10) 1Mb 10ms DropTail
$ns duplex-link $n(9) $n(11) 1Mb 10ms DropTail
$ns duplex-link $n(10) $n(11) 1Mb 10ms DropTail
$ns duplex-link $n(11) $n(5) 1Mb 10ms DropTail

# Attach UDP agents and CBR traffic
set udp0 [new Agent/UDP]
set null0 [new Agent/Null]
set cbr0 [new Application/Traffic/CBR]

set udp1 [new Agent/UDP]
set null1 [new Agent/Null]
set cbr1 [new Application/Traffic/CBR]

# Connect UDP0 -> Null0
$ns attach-agent $n(0) $udp0
$ns attach-agent $n(5) $null0
$ns connect $udp0 $null0
$cbr0 attach-agent $udp0

# Connect UDP1 -> Null1
$ns attach-agent $n(1) $udp1
$ns attach-agent $n(5) $null1
$ns connect $udp1 $null1
$cbr1 attach-agent $udp1

# Configure CBR parameters
$cbr0 set packetSize_ 500
$cbr0 set interval_ 0.005
$cbr1 set packetSize_ 500
$cbr1 set interval_ 0.005

# Introduce link failure and recovery events
$ns rtmodel-at 10.0 down $n(11) $n(5)
$ns rtmodel-at 30.0 up $n(11) $n(5)
$ns rtmodel-at 15.0 down $n(7) $n(6)
$ns rtmodel-at 20.0 up $n(7) $n(6)

# Define finish procedure
proc finish { } {
    global ns tr nf
    $ns flush-trace
    close $nf
    close $nr
    exec nam p5.nam
    exit 0
}

# Schedule traffic events
$ns at 5.0 "$cbr0 start"
$ns at 5.0 "$cbr1 start"
$ns at 45.0 "$cbr0 stop"
$ns at 45.0 "$cbr1 stop"
$ns at 50.0 "finish"

# Run simulation
$ns run

# ===============================================================
# (b) AWK PROGRAM
# ===============================================================
# Save this as p5.awk

BEGIN {
    pksend = 0
    pkreceive = 0
    pkdrop = 0
    pkrouting = 0
}
{
    if ( $1=="-" && ($3=="0" || $3=="1") && $5=="cbr" )
    {
        pksend += 1
    }
    if ( $1=="r" && $4=="5" && $5=="cbr" )
    {
        pkreceive += 1
    }
    if ( $1=="d" )
    {
        pkdrop += 1
    }
    if ( $1=="r" && ($5=="rtProtoDV" || $5=="rtProtoLS") )
    {
        pkrouting += 1
    }
}
END {
    print "No of send packets = " pksend
    print "No of received packets = " pkreceive
    print "No of dropped packets = " pkdrop
    print "No of routing packets = " pkrouting
    print "Normalized Overhead (routing/received), NOH = " pkrouting/pkreceive
    print "Packet Delivery Ratio (received/send), PDR = " pkreceive/pksend
}

# ===============================================================
# 6. RESULT:
# The implementation of Link State Routing Protocol was successfully
# simulated, and packet delivery ratio, drops, and routing overhead
# were analyzed using AWK script.
# ===============================================================

# ===============================================================
# 7. NAM OUTPUT:
# (Attach the NAM screenshot here in printed form)
# ===============================================================

# ===============================================================
# 8. AWK OUTPUT:
# (Attach AWK result output here in written form)
# ===============================================================

# ===============================================================
# 9. OBSERVATION:
# Link State Routing provides efficient path selection and adapts to
# network changes by recalculating routes dynamically.
# ===============================================================
