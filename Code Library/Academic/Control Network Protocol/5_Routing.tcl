# ===============================================================
# TITLE: Implementation of Link State Routing Algorithm
# ===============================================================

# -------------------------------
# AIM:
# -------------------------------
# To implement and analyze the Link State Routing Algorithm using NS2.

# -------------------------------
# TOOL USED:
# -------------------------------
# TCL (Tool Command Language)
# Simulator: NS2 (Network Simulator 2)

# -------------------------------
# THEORY:
# -------------------------------
# Link State Routing (LSR) is a dynamic routing protocol where each router
# maintains a complete topology map of the network.  
# Each node periodically floods link-state information to all other nodes.
# Using this data, every router independently computes the shortest path
# tree using **Dijkstra’s algorithm**.  
#
# Advantages:
# • Faster convergence than Distance Vector routing  
# • Lower chances of routing loops  
# • Dynamically adapts to link failures and recoveries

# -------------------------------
# PROCEDURE:
# -------------------------------
# Step 1: Open VMware / Ubuntu terminal.
# Step 2: Navigate to your NS2 working directory:
#         $ cd Desktop
#         $ cd USN
# Step 3: Create/Edit the TCL program:
#         $ gedit p5.tcl
# Step 4: Paste the TCL code (given below) and save.
# Step 5: Run the TCL simulation:
#         $ ns p5.tcl
# Step 6: Open the NAM animation to visualize routing behavior:
#         $ nam p5.nam
# Step 7: Create/Edit the AWK program:
#         $ gedit p5.awk
# Step 8: Paste the AWK code (given below) and save.
# Step 9: Run the AWK program to analyze simulation results:
#         $ awk -f p5.awk p5.tr
# Step 10: Observe Packet Delivery Ratio (PDR), Dropped Packets,
#          Routing Overhead, and Normalized Overhead.

# -------------------------------
# MAIN TCL PROGRAM: p5.tcl
# -------------------------------

# Create simulator instance
set ns [new Simulator]

# Open trace files
set tr [open p5.tr w]
$ns trace-all $tr
set nf [open p5.nam w]
$ns namtrace-all $nf

# Enable Link State Routing Protocol
$ns rtproto LS

# Create 12 nodes
for {set i 0} {$i<12} {incr i} {
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
    close $tr
    close $nf
    exec nam p5.nam &
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

# -------------------------------
# AWK PROGRAM: p5.awk
# -------------------------------

BEGIN {
    pksend = 0
    pkreceive = 0
    pkdrop = 0
    pkrouting = 0
}
{
    if ( $1=="-" && ($3=="0" || $3=="1") && $5=="cbr" ) {
        pksend += 1
    }
    if ( $1=="r" && $4=="5" && $5=="cbr" ) {
        pkreceive += 1
    }
    if ( $1=="d" ) {
        pkdrop += 1
    }
    if ( $1=="r" && ($5=="rtProtoDV" || $5=="rtProtoLS") ) {
        pkrouting += 1
    }
}
END {
    print "No of send packets = " pksend
    print "No of received packets = " pkreceive
    print "No of dropped packets = " pkdrop
    print "No of routing packets = " pkrouting
    print "Normalized Overhead (routing/received) = " pkrouting/pkreceive
    print "Packet Delivery Ratio (received/sent) = " pkreceive/pksend
}

# -------------------------------
# OUTPUT COMMANDS:
# -------------------------------
# To run the TCL simulation:
#   $ ns p5.tcl
#
# To view NAM animation:
#   $ nam p5.nam
#
# To analyze trace file using AWK:
#   $ awk -f p5.awk p5.tr

# -------------------------------
# TERMINAL COMMAND FLOW:
# -------------------------------
# user@ubuntu:~$ cd Desktop
# user@ubuntu:~/Desktop$ cd USN
# user@ubuntu:~/Desktop/USN$ gedit p5.tcl
# user@ubuntu:~/Desktop/USN$ ns p5.tcl
# user@ubuntu:~/Desktop/USN$ nam p5.nam
# user@ubuntu:~/Desktop/USN$ gedit p5.awk
# user@ubuntu:~/Desktop/USN$ awk -f p5.awk p5.tr

# -------------------------------
# OBSERVATION:
# -------------------------------
# • Link State Routing dynamically adapts to network topology changes.  
# • When link failures occur, routers recalculate shortest paths using Dijkstra’s algorithm.  
# • Packet delivery improves after the affected links recover.  
# • Routing overhead temporarily spikes during topology changes due to flooding of LSAs.  
# • The AWK script calculates PDR, dropped packets, and routing efficiency.

# -------------------------------
# RESULT:
# -------------------------------
# The implementation of the Link State Routing Protocol was successfully
# simulated. Packet Delivery Ratio (PDR), dropped packets, and routing
# overhead were analyzed using an AWK script.

# ===============================================================
# END OF FILE
# ===============================================================
