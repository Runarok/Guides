# ------------------------------------------------------
# Title: Ethernet LAN Throughput Analysis in NS2
# ------------------------------------------------------

# -------------------------------
# Aim:
# -------------------------------
# To implement an Ethernet LAN using 10 nodes and compare throughput 
# by changing the error rate and data rate.

# -------------------------------
# Software Tool:
# -------------------------------
# NS2 (Network Simulator 2)
# Tool Used :: TCL (Tool Command Language)

# -------------------------------
# Theory:
# -------------------------------
# Ethernet LANs are simulated in NS2 using the "make-lan" feature.
# Ten nodes are divided into two LAN segments connected via a duplex link.
# TCP and UDP traffic are generated over the LAN, and throughput is analyzed
# by varying error rates and data rates. An AWK script calculates throughput
# for both TCP and UDP.

# -------------------------------
# Procedure:
# -------------------------------
# Step 1: Open VMware Workstation.
# Step 2: Open the terminal window.
# Step 3: Enter the following commands in sequence:
#         $ cd Desktop
#         $ cd USN
#         $ gedit p3.tcl            # Create/Edit the TCL program
# Step 4: Paste the below TCL program into p3.tcl and save.
# Step 5: Run the TCL program:
#         $ ns p3.tcl
# Step 6: Visualize the animation (optional):
#         $ nam p3.nam
# Step 7: Create the AWK file:
#         $ gedit p3.awk
# Step 8: Execute the AWK program to compute throughput:
#         $ awk -f p3.awk p3.tr

# -------------------------------
# Main Program:
# -------------------------------

set ns [new Simulator]
set tf [open p3.tr w]
$ns trace-all $tf
set nf [open p3.nam w]
$ns namtrace-all $nf

# Number of nodes
set nNodes 10
for {set i 0} {$i<$nNodes} {incr i} {
    set n($i) [$ns node]
}

# Create two Ethernet LANs
$ns make-lan "$n(0) $n(1) $n(2) $n(3) $n(4)" 10Mb 10ms LL Queue/DropTail Mac/802_3 Channel Phy/WiredPhy
$ns make-lan "$n(5) $n(6) $n(7) $n(8) $n(9)" 10Mb 10ms LL Queue/DropTail Mac/802_3 Channel Phy/WiredPhy

# Connect the LANs via duplex link
$ns duplex-link $n(4) $n(5) 1Mb 3ms DropTail
$ns queue-limit $n(4) $n(5) 100

# Agents and applications
set tcp [new Agent/TCP]
set udp [new Agent/UDP]
set tcpsink [new Agent/TCPSink]
set null [new Agent/Null]
set cbr [new Application/Traffic/CBR]
set ftp [new Application/FTP]

# Attach agents to nodes
$ns attach-agent $n(0) $tcp
$ns attach-agent $n(3) $udp
$ns attach-agent $n(9) $tcpsink
$ns attach-agent $n(6) $null

# Attach applications to agents
$ftp attach-agent $tcp
$cbr attach-agent $udp

# Connect agents
$ns connect $udp $null
$ns connect $tcp $tcpsink

# Configure packet sizes and intervals
$cbr set packetSize_ 512
$cbr set interval_ 0.001
$ftp set packetSize_ 512
$ftp set interval_ 0.04

# Error model to simulate packet loss
set err [new ErrorModel]
$ns lossmodel $err $n(4) $n(5)
$err set rate_ 0.01

# Define finish procedure
proc finish {} {
    global ns nf tf
    $ns flush-trace
    close $tf
    close $nf
    exec nam p3.nam &
    exit 0
}

# Start/stop FTP and CBR traffic
$ns at 0.0 "$ftp start"
$ns at 10.0 "$ftp stop"
$ns at 2.0 "$cbr start"
$ns at 12.0 "$cbr stop"
$ns at 13.0 "finish"

# Run simulation
$ns run

# -------------------------------
# AWK Program:
# -------------------------------
# File: p3.awk
# Purpose: To calculate throughput for TCP and UDP flows

BEGIN {
    rpacketsize_tcp=0;
    rtimeinterval_tcp=0;
    rpacketsize_udp=0;
    rtimeinterval_udp=0;
}
{
    # TCP throughput calculation for packets received at node 9
    if ($1=="r" && $5=="tcp" && $4=="6") {
        rpacketsize_tcp += $6;
        rtimeinterval_tcp = $2;
    }
    # UDP throughput calculation for packets received at node 6
    if ($1=="r" && $5=="cbr" && $4=="6") {
        rpacketsize_udp += $6;
        rtimeinterval_udp = $2;
    }
}
END {
    printf("\nThroughput for UDP = %f Mbps\n",
        rpacketsize_udp / rtimeinterval_udp * 8 * 512 / 1000000);
    printf("\nThroughput for TCP = %f Mbps\n",
        rpacketsize_tcp / rtimeinterval_tcp * 8 * 512 / 1000000);
}

# Output Command:
# awk -f p3.awk p3.tr

# -------------------------------
# Terminal Window (Command Flow):
# -------------------------------
# user@ubuntu:~$ cd Desktop
# user@ubuntu:~/Desktop$ cd USN
# user@ubuntu:~/Desktop/USN$ gedit p3.tcl
# user@ubuntu:~/Desktop/USN$ ns p3.tcl
# user@ubuntu:~/Desktop/USN$ nam p3.nam
# user@ubuntu:~/Desktop/USN$ gedit p3.awk
# user@ubuntu:~/Desktop/USN$ awk -f p3.awk p3.tr
# Output appears as:
# Throughput for UDP = <value> Mbps
# Throughput for TCP = <value> Mbps

# -------------------------------
# Observation:
# -------------------------------
# • Bottleneck: The 1Mb link between n(4)-n(5) limits end-to-end throughput; both flows contend here.
# • Error Rate: Increasing $err rate_ reduces effective throughput for both flows.
#   - TCP backs off due to congestion control/ACK loss; measured TCP throughput at sink drops.
#   - UDP keeps sending (no control), but received throughput falls because more packets are lost.
# • Data Rate: Raising LAN/data rates helps only until the 1Mb bottleneck saturates; after that, queues build and loss increases.
# • Measurement Points (per AWK): UDP throughput is computed at node 6; TCP throughput is computed at its respective sink node.
# • Practical note: Lower error rate and/or higher bottleneck capacity → higher measured throughput; aggressive CBR intervals on a narrow link → more loss.

# -------------------------------
# Result:
# -------------------------------
# The simulation successfully implemented an Ethernet LAN topology and
# calculated TCP and UDP throughput using AWK.

# ======================================================
# End of File
# ======================================================
