# ------------------------------------------------------
# Title: Ethernet LAN with Multiple Traffic Sources & Congestion Window Analysis
# ------------------------------------------------------

# -------------------------------
# Aim:
# -------------------------------
# To implement an Ethernet LAN using multiple nodes, assign multiple traffic flows,
# and analyze the congestion window variations for different TCP sources and destinations.

# -------------------------------
# Tool Used:
# -------------------------------
# TCL (Tool Command Language)
# Software: NS2 (Network Simulator 2)

# -------------------------------
# Theory:
# -------------------------------
# In Ethernet LAN simulations, TCP connections dynamically adjust their congestion window (cwnd)
# size based on network load, available bandwidth, and competing flows.
# Using NS2, multiple FTP applications are configured over TCP to generate traffic.
# Congestion window data is collected using trace files and later visualized using **xgraph**
# to understand how cwnd evolves for different TCP flows under varying load conditions.

# -------------------------------
# Procedure:
# -------------------------------
# Step 1: Open VMware Workstation.
# Step 2: Open the terminal window.
# Step 3: Navigate to your project folder:
#         $ cd Desktop
#         $ cd USN
# Step 4: Create/Edit the TCL program:
#         $ gedit p4.tcl
# Step 5: Paste the TCL code below and save.
# Step 6: Run the TCL program:
#         $ ns p4.tcl
# Step 7: Visualize the simulation animation (optional):
#         $ nam p4.nam
# Step 8: Create and open the AWK file:
#         $ gedit p4.awk
# Step 9: Paste the AWK code (given below) and save.
# Step 10: Extract congestion window data for each TCP flow:
#         $ awk -f p4.awk file0.tr > file0
#         $ awk -f p4.awk file1.tr > file1
# Step 11: Plot the cwnd graph using xgraph:
#         $ xgraph -x "time" -y "congestion_window" file0 file1

# -------------------------------
# Main TCL Program:
# -------------------------------

set ns [new Simulator]
set tf [open p4.tr w]
$ns trace-all $tf
set nf [open p4.nam w]
$ns namtrace-all $nf

# Create four LAN nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

# Create LAN segment with 4 nodes (Ethernet)
$ns make-lan "$n0 $n1 $n2 $n3" 10Mb 10ms LL Queue/DropTail Mac/802_3

# TCP Agents, FTP Applications, and Sinks
set tcp0 [new Agent/TCP]
set ftp0 [new Application/FTP]
set sink0 [new Agent/TCPSink]

set tcp1 [new Agent/TCP]
set ftp1 [new Application/FTP]
set sink1 [new Agent/TCPSink]

# Attach first TCP-FTP flow
$ns attach-agent $n0 $tcp0
$ftp0 attach-agent $tcp0
$ns attach-agent $n3 $sink0
$ns connect $tcp0 $sink0

# Attach second TCP-FTP flow
$ns attach-agent $n2 $tcp1
$ftp1 attach-agent $tcp1
$ns attach-agent $n1 $sink1
$ns connect $tcp1 $sink1

# Congestion Window Tracing for TCP0
set file0 [open file0.tr w]
$tcp0 attach $file0
$tcp0 trace cwnd_
$tcp0 set maxcwnd_ 10

# Congestion Window Tracing for TCP1
set file1 [open file1.tr w]
$tcp1 attach $file1
$tcp1 trace cwnd_
$tcp1 set maxcwnd_ 5

# Set flow colors in NAM
$ns color 0 "red"
$ns color 1 "blue"
$tcp0 set class_ 0
$tcp1 set class_ 1

# Finish procedure
proc finish { } {
    global nf tf ns
    $ns flush-trace
    exec nam p4.nam &
    close $nf
    close $tf
    exit 0
}

# Schedule FTP start and stop times
$ns at 0.1 "$ftp0 start"
$ns at 1.5 "$ftp0 stop"
$ns at 2 "$ftp0 start"
$ns at 3 "$ftp0 stop"

$ns at 0.2 "$ftp1 start"
$ns at 2 "$ftp1 stop"
$ns at 2.5 "$ftp1 start"
$ns at 4 "$ftp1 stop"

# End simulation
$ns at 5.0 "finish"
$ns run

# -------------------------------
# AWK Program:
# -------------------------------
# File: p4.awk
# Purpose: Extract congestion window values over time

BEGIN {
}
{
    if ($6=="cwnd_")
        printf("%f\t%f\n", $1, $7);
}
END {
}

# -------------------------------
# Output Commands:
# -------------------------------
# Extract cwnd data for TCP0:
#   $ awk -f p4.awk file0.tr > file0
# Extract cwnd data for TCP1:
#   $ awk -f p4.awk file1.tr > file1
# Plot the congestion window variations using xgraph:
#   $ xgraph -x "time" -y "congestion_window" file0 file1

# -------------------------------
# Terminal Window (Command Flow):
# -------------------------------
# user@ubuntu:~$ cd Desktop
# user@ubuntu:~/Desktop$ cd USN
# user@ubuntu:~/Desktop/USN$ gedit p4.tcl
# user@ubuntu:~/Desktop/USN$ ns p4.tcl
# user@ubuntu:~/Desktop/USN$ nam p4.nam
# user@ubuntu:~/Desktop/USN$ gedit p4.awk
# user@ubuntu:~/Desktop/USN$ awk -f p4.awk file0.tr > file0
# user@ubuntu:~/Desktop/USN$ awk -f p4.awk file1.tr > file1
# user@ubuntu:~/Desktop/USN$ xgraph -x "time" -y "congestion_window" file0 file1

# -------------------------------
# Observation:
# -------------------------------
# • TCP0 vs TCP1: TCP0 had a higher maximum cwnd (10) than TCP1 (5), giving it an advantage.
# • Multiple Flows: Competing FTP flows lead to congestion in the shared Ethernet LAN.
# • cwnd Dynamics: During periods of simultaneous traffic, congestion windows fluctuated rapidly.
# • Staggered Starts: Starting/stopping FTP flows at different times helped visualize cwnd recovery.
# • Visualization: xgraph clearly shows how TCP congestion control affects throughput and fairness.

# -------------------------------
# Result:
# -------------------------------
# The Ethernet LAN simulation successfully implemented multiple TCP flows.
# Congestion window variations were extracted and visualized using **xgraph**,
# enabling performance comparison between TCP sources.

# ======================================================
# End of File
# ======================================================
