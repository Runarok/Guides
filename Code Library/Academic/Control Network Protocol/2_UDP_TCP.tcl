# ------------------------------------------------------
# Title: TCP & UDP Packet Transmission Analysis in NS2
# ------------------------------------------------------

# -------------------------------
# Aim:
# -------------------------------
# To implement a four-node point-to-point network and analyze the number of 
# packets sent by TCP and UDP by applying TCP between n0-n3 and UDP between n1-n3.

# -------------------------------
# Software Tool:
# -------------------------------
# NS2 (Network Simulator 2)

# -------------------------------
# Theory:
# -------------------------------
# A four-node topology is created using NS2 with duplex links. TCP and UDP agents 
# are attached to simulate two different types of traffic: FTP over TCP and CBR 
# over UDP. The simulation collects trace data to calculate the number of TCP and 
# UDP packets sent using an AWK script.

# -------------------------------
# Procedure:
# -------------------------------
# 1. Create four nodes and connect them with duplex links.
# 2. Configure queue limits and link bandwidths.
# 3. Attach TCP, UDP agents, sinks, and null agents.
# 4. Attach FTP application over TCP and CBR over UDP.
# 5. Set packet sizes and intervals.
# 6. Run simulation and generate NAM visualization.
# 7. Use AWK script to calculate total packets sent by TCP and UDP.

# -------------------------------
# Main Program:
# -------------------------------

set ns [new Simulator]
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

# -------------------------------
# AWK Program:
# -------------------------------
# File: p2.awk
# Purpose: To calculate the number of TCP and UDP packets sent

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

# Output Command:
# awk -f p2.awk p2.tr

# -------------------------------
# Result:
# -------------------------------
# The simulation successfully analyzed TCP and UDP packet transmission. 
# The AWK script outputs the total number of TCP and UDP packets sent.
