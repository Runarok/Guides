# ------------------------------------------------------
# Title: TCP & UDP Packet Transmission Analysis in NS2
# ------------------------------------------------------
# Aim:
# To implement a four-node point-to-point network and analyze the number of 
# packets sent by TCP and UDP by applying TCP between n0-n3 and UDP between n1-n3.
# ------------------------------------------------------
# Tool Used    :: TCL (Tool Command Language)
# Software     :: NS2 (Network Simulator 2)
# ------------------------------------------------------
# Theory:
# A four-node topology is created using NS2 with duplex links.
# TCP and UDP agents are attached to simulate two different types of traffic:
#   • FTP over TCP
#   • CBR over UDP
# The simulation collects trace data and an AWK script is used to calculate 
# the number of TCP and UDP packets sent.
# ------------------------------------------------------
# Procedure:
# Step 1: Open VMware Workstation.
# Step 2: Open the terminal window.
# Step 3: Enter the following commands in sequence:
#         $ cd Desktop
#         $ cd USN
#         $ gedit p2.tcl      # Open the TCL program for editing
# Step 4: Type the below TCL program and save it.
# Step 5: Run the TCL program using:
#         $ ns p2.tcl
# Step 6: To visualize network animation:
#         $ nam p2.nam
# Step 7: Type the AWK program in a new file:
#         $ gedit p2.awk
# Step 8: Save and execute the AWK program:
#         $ awk -f p2.awk p2.tr
# ------------------------------------------------------
# Main TCL Program Starts Here
# ------------------------------------------------------

# Create simulator instance
set ns [new Simulator]

# Create trace and NAM files
set tf [open p2.tr w]
$ns trace-all $tf
set nf [open p2.nam w]
$ns namtrace-all $nf

# Create four nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

# Duplex links with bandwidth and queue sizes
$ns duplex-link $n0 $n2 20Mb 10Ms DropTail
$ns duplex-link $n1 $n2 10Mb 10Ms DropTail
$ns duplex-link $n2 $n3 0.7Mb 10Ms DropTail
$ns set queue-limit $n0 $n2 10
$ns set queue-limit $n1 $n2 10
$ns set queue-limit $n2 $n3 5

# Agents and applications
set tcp [new Agent/TCP]
set udp [new Agent/UDP]
set tcpsink [new Agent/TCPSink]
set null [new Agent/Null]
set cbr [new Application/Traffic/CBR]
set ftp [new Application/FTP]

# Attach agents to nodes
$ns attach-agent $n0 $tcp
$ns attach-agent $n1 $udp
$ns attach-agent $n3 $tcpsink
$ns attach-agent $n3 $null

# Attach applications to agents
$ftp attach-agent $tcp
$cbr attach-agent $udp

# Connect agents
$ns connect $udp $null
$ns connect $tcp $tcpsink

# Set packet sizes and intervals
$cbr set packetsize_ 512
$cbr set interval_ 0.005
$ftp set packetsize_ 512
$ftp set interval_ 0.005

# Define finish procedure
proc finish {} {
    global ns nf tf
    $ns flush-trace
    close $tf
    close $nf
    exec nam p2.nam &
    exit 0
}

# Start/stop FTP and CBR traffic
$ns at 0.0 "$ftp start"
$ns at 10.0 "$ftp stop"
$ns at 2.0 "$cbr start"
$ns at 12.0 "$cbr stop"
$ns at 13.0 "finish"

# Run the simulation
$ns run

# ------------------------------------------------------
# AWK Program File: p2.awk
# ------------------------------------------------------
# Purpose: To calculate the number of TCP and UDP packets sent
# ------------------------------------------------------
BEGIN {
    tcp=0;
    cbr=0;
}
{
    # Count TCP packets
    if ($1=="-" && $5=="tcp")
        tcp++;

    # Count UDP packets
    if ($1=="-" && $5=="cbr")
        cbr++;
}
END {
    printf("Number of TCP packets sent: %d\n", tcp);
    printf("Number of UDP packets sent: %d\n", cbr);
}
# ------------------------------------------------------
# Execute the AWK program with:
# $ awk -f p2.awk p2.tr
# ------------------------------------------------------

# ------------------------------------------------------
# Terminal Window Commands
# ------------------------------------------------------
# nicks@ubuntu:~$ cd Desktop
# nicks@ubuntu:~/Desktop$ cd USN
# nicks@ubuntu:~/Desktop/USN$ gedit p2.tcl
# nicks@ubuntu:~/Desktop/USN$ ns p2.tcl
# nicks@ubuntu:~/Desktop/USN$ nam p2.nam
# nicks@ubuntu:~/Desktop/USN$ gedit p2.awk
# nicks@ubuntu:~/Desktop/USN$ awk -f p2.awk p2.tr
#
# Output Example:
# Number of TCP packets sent: 20589
# Number of UDP packets sent: 16842

# ------------------------------------------------------
# Observation:
# ------------------------------------------------------
# TCP Traffic:
# • TCP packets were transmitted reliably.
# • Fewer packet losses due to acknowledgments and congestion control.
#
# UDP Traffic:
# • UDP sent packets continuously without flow control.
# • Higher packet loss observed on congested, low-bandwidth links.
#
# Bandwidth Impact:
# • Higher bandwidth links had fewer drops and better throughput.
# • Low bandwidth on the n2-n3 link caused higher UDP losses.
#
# Queue Size Effect:
# • Smaller queues increased packet loss on high-load paths.

# ------------------------------------------------------
# Result:
# ------------------------------------------------------
# The simulation successfully analyzed TCP and UDP packet transmission.
# The AWK script outputs the total number of TCP and UDP packets sent.

# ======================================================
# End of File
# ======================================================
