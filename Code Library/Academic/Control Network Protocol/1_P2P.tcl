# ------------------------------------------------------
# Title: Point-to-Point Network Performance Analysis
# ------------------------------------------------------

# ------------------------------------------------------
# Aim:
# ------------------------------------------------------
# To implement a point-to-point network with four nodes 
# and duplex links between them, and analyze the network 
# performance by setting the queue size and varying the 
# bandwidth.

# ------------------------------------------------------
# Tool Used    :: TCL (Tool Command Language)
# Software     :: NS2 (Network Simulator 2)
# ------------------------------------------------------

# ------------------------------------------------------
# Theory:
# ------------------------------------------------------
# Network performance is analyzed by creating a four-node topology using NS2.  
# Duplex links are set with different bandwidths and queue limits.  
# UDP agents and CBR traffic generators are used to simulate packet transmission.  
# NAM (Network Animator) is used for visualization,  
# and an AWK script calculates the number of packets dropped.

# ------------------------------------------------------
# Procedure:
# ------------------------------------------------------
# Step 1: Open VMware Workstation.
# Step 2: Open the terminal window.
# Step 3: Enter the following commands in sequence:
#         $ cd Desktop
#         $ cd USN
#         $ gedit p1.tcl          # To open the TCL program for editing
# Step 4: Type the below TCL program and save it.
# Step 5: Run the TCL program using:
#         $ ns p1.tcl
# Step 6: To visualize network animation:
#         $ nam p1.nam
# Step 7: Type the AWK program in a new file:
#         $ gedit p1.awk
# Step 8: Save and execute the AWK program:
#         $ awk -f p1.awk p1.tr

# ------------------------------------------------------
# Main TCL Program Starts Here
# ------------------------------------------------------

# Create simulator instance
set ns [new Simulator]

# Create trace and NAM files
set tf [open p1.tr w]
$ns trace-all $tf
set nf [open p1.nam w]
$ns namtrace-all $nf

# Create four nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

# Duplex links with different bandwidths and queue sizes
$ns duplex-link $n0 $n2 20Mb 10Ms DropTail
$ns duplex-link $n1 $n2 10Mb 10Ms DropTail
$ns duplex-link $n2 $n3 0.7Mb 10Ms DropTail

# Setting queue limits for each link
$ns set queue-limit $n0 $n2 10
$ns set queue-limit $n1 $n2 10
$ns set queue-limit $n2 $n3 5

# Attach UDP agents and Null sinks
set udp0 [new Agent/UDP]
set udp1 [new Agent/UDP]
set null [new Agent/Null]
set cbr0 [new Application/Traffic/CBR]
set cbr1 [new Application/Traffic/CBR]

# Attach UDP agents to nodes
$ns attach-agent $n0 $udp0
$ns attach-agent $n1 $udp1
$cbr0 attach-agent $udp0
$cbr1 attach-agent $udp1
$ns attach-agent $n2 $null
$ns attach-agent $n3 $null

# Connect UDP agents to Null sinks
$ns connect $udp0 $null
$ns connect $udp1 $null

# Configure CBR traffic for each application
$cbr0 set packetsize_ 512
$cbr0 set interval_ 0.001
$cbr1 set packetsize_ 400
$cbr1 set interval_ 0.005

# Procedure to finish simulation and open NAM
proc finish {} {
    global ns nf tf
    $ns flush-trace
    close $tf
    close $nf
    exec nam p1.nam &
    exit 0
}

# Schedule CBR traffic start and stop times
$ns at 0.0 "$cbr0 start"
$ns at 10.0 "$cbr0 stop"
$ns at 2.0 "$cbr1 start"
$ns at 12.0 "$cbr1 stop"

# Schedule finish procedure
$ns at 13.0 "finish"

# Run the simulation
$ns run

# ------------------------------------------------------
# AWK Program (p1.awk)
# ------------------------------------------------------
# Purpose: To calculate the number of dropped packets
# Type the following code into p1.awk:

# BEGIN {
#     count=0;
# }
# {
#     if ($1=="d")    # Checks if the event is packet drop
#         count++;
# }
# END {
#     printf("Number of packets dropped: %d\n", count);
# }

# ------------------------------------------------------
# Execute the AWK program with:
# $ awk -f p1.awk p1.tr
# ------------------------------------------------------

# ------------------------------------------------------
# Terminal Window Example:
# ------------------------------------------------------
# nicks@ubuntu:~$ cd Desktop
# nicks@ubuntu:~/Desktop$ cd USN
# nicks@ubuntu:~/Desktop/USN$ gedit p1.tcl
# [Type & Save Program]
# nicks@ubuntu:~/Desktop/USN$ ns p1.tcl
# nicks@ubuntu:~/Desktop/USN$ nam p1.nam
# nicks@ubuntu:~/Desktop/USN$ gedit p1.awk
# [Type & Save AWK Code]
# nicks@ubuntu:~/Desktop/USN$ awk -f p1.awk p1.tr
# Number of packets dropped: 33553

# ------------------------------------------------------
# Observation:
# ------------------------------------------------------
# The number of packets dropped depends on:
#  - Link bandwidth
#  - Queue size
#  - Traffic load
# Packet drops are successfully calculated using the AWK program.

# ------------------------------------------------------
# Result:
# ------------------------------------------------------
# The simulation successfully analyzed network performance using NS2.  
# Packet drops are calculated using the AWK program and displayed as output.

# ------------------------------------------------------
# End of File
# ------------------------------------------------------
