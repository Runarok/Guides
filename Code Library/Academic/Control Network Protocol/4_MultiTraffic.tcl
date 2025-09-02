# ------------------------------------------------------
# Title: Ethernet LAN with Multiple Traffic Sources & Congestion Window Analysis
# ------------------------------------------------------

# -------------------------------
# Aim:
# -------------------------------
# To implement an Ethernet LAN using multiple nodes, assign multiple traffic flows,
# and analyze the congestion window variations for different TCP sources and destinations.

# -------------------------------
# Software Tool:
# -------------------------------
# NS2 (Network Simulator 2)

# -------------------------------
# Theory:
# -------------------------------
# In Ethernet LAN simulations, TCP connections experience dynamic congestion windows (cwnd)
# based on network load, data rate, and competing flows. Multiple FTP applications over TCP
# are configured to generate traffic, and congestion window data is collected from trace files.
# These cwnd variations are later plotted using **xgraph** for visualization.

# -------------------------------
# Procedure:
# -------------------------------
# 1. Create 4 LAN nodes using the `make-lan` command.
# 2. Configure TCP agents, FTP applications, and TCP sinks.
# 3. Attach FTP applications to TCP agents and connect sources to sinks.
# 4. Enable congestion window tracing for each TCP source.
# 5. Run FTP traffic with different start/stop times to simulate congestion.
# 6. Extract congestion window data using AWK and visualize using xgraph.

# -------------------------------
# Main Program:
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

# Output Commands:
# awk -f p4.awk file0.tr > file0
# awk -f p4.awk file1.tr > file1
# xgraph -x "time" -y "congestion_window" file0 file1

# -------------------------------
# Result:
# -------------------------------
# The Ethernet LAN simulation successfully generated multiple TCP flows.
# The congestion window variations for different sources were traced and visualized
# using xgraph for performance comparison.
