#!/bin/bash
# Week 4 Lab - tcpdump commands
# Run this script on your Linux machine
# Based on: https://www.tecmint.com/12-tcpdump-commands-a-network-sniffer-tool/

echo "=========================================="
echo "Week 4 Lab - tcpdump Exercises"
echo "=========================================="

# Check if tcpdump is installed
if ! command -v tcpdump &> /dev/null; then
    echo "tcpdump not found. Installing..."
    sudo apt-get update
    sudo apt-get install -y tcpdump
else
    echo "tcpdump is already installed"
fi

# Get the primary network interface
INTERFACE=$(ip route | grep default | awk '{print $5}' | head -n 1)
echo "Using network interface: $INTERFACE"
echo ""

# Create output directory if it doesn't exist
mkdir -p tcpdump_outputs

echo "Starting tcpdump exercises..."
echo "Press Ctrl+C to skip any step if it takes too long"
echo ""

# Step 1: Capture packets from specific interface
echo "Step 1: Capture packets from specific interface"
echo "Command: sudo tcpdump -i $INTERFACE -c 10" > tcpdump_step_1.txt
echo "" >> tcpdump_step_1.txt
echo "Output:" >> tcpdump_step_1.txt
sudo timeout 10s tcpdump -i $INTERFACE -c 10 >> tcpdump_step_1.txt 2>&1
echo "✓ Step 1 complete"
echo ""

# Step 2: Capture only N number of packets
echo "Step 2: Capture only 5 packets"
echo "Command: sudo tcpdump -c 5 -i $INTERFACE" > tcpdump_step_2.txt
echo "" >> tcpdump_step_2.txt
echo "Output:" >> tcpdump_step_2.txt
sudo tcpdump -c 5 -i $INTERFACE >> tcpdump_step_2.txt 2>&1
echo "✓ Step 2 complete"
echo ""

# Step 3: Print captured packets in ASCII
echo "Step 3: Print captured packets in ASCII"
echo "Command: sudo tcpdump -A -i $INTERFACE -c 5" > tcpdump_step_3.txt
echo "" >> tcpdump_step_3.txt
echo "Output:" >> tcpdump_step_3.txt
sudo tcpdump -A -i $INTERFACE -c 5 >> tcpdump_step_3.txt 2>&1
echo "✓ Step 3 complete"
echo ""

# Step 4: Display available interfaces
echo "Step 4: Display available interfaces"
echo "Command: sudo tcpdump -D" > tcpdump_step_4.txt
echo "" >> tcpdump_step_4.txt
echo "Output:" >> tcpdump_step_4.txt
sudo tcpdump -D >> tcpdump_step_4.txt 2>&1
echo "✓ Step 4 complete"
echo ""

# Step 5: Display captured packets in HEX and ASCII
echo "Step 5: Display captured packets in HEX and ASCII"
echo "Command: sudo tcpdump -XX -i $INTERFACE -c 5" > tcpdump_step_5.txt
echo "" >> tcpdump_step_5.txt
echo "Output:" >> tcpdump_step_5.txt
sudo tcpdump -XX -i $INTERFACE -c 5 >> tcpdump_step_5.txt 2>&1
echo "✓ Step 5 complete"
echo ""

# Step 6: Capture and save packets to a file
echo "Step 6: Capture and save packets to a file"
echo "Command: sudo tcpdump -w capture.pcap -i $INTERFACE -c 10" > tcpdump_step_6.txt
echo "" >> tcpdump_step_6.txt
echo "Output:" >> tcpdump_step_6.txt
sudo tcpdump -w capture.pcap -i $INTERFACE -c 10 >> tcpdump_step_6.txt 2>&1
echo "Packets saved to capture.pcap" >> tcpdump_step_6.txt
echo "✓ Step 6 complete"
echo ""

# Step 7: Read captured packets file
echo "Step 7: Read captured packets file"
echo "Command: sudo tcpdump -r capture.pcap" > tcpdump_step_7.txt
echo "" >> tcpdump_step_7.txt
echo "Output:" >> tcpdump_step_7.txt
sudo tcpdump -r capture.pcap >> tcpdump_step_7.txt 2>&1
echo "✓ Step 7 complete"
echo ""

# Step 8: Capture IP address packets (without resolving hostnames)
echo "Step 8: Capture IP address packets"
echo "Command: sudo tcpdump -n -i $INTERFACE -c 5" > tcpdump_step_8.txt
echo "" >> tcpdump_step_8.txt
echo "Output:" >> tcpdump_step_8.txt
sudo tcpdump -n -i $INTERFACE -c 5 >> tcpdump_step_8.txt 2>&1
echo "✓ Step 8 complete"
echo ""

# Step 9: Capture only TCP packets
echo "Step 9: Capture only TCP packets"
echo "Command: sudo tcpdump -i $INTERFACE tcp -c 5" > tcpdump_step_9.txt
echo "" >> tcpdump_step_9.txt
echo "Output:" >> tcpdump_step_9.txt
sudo tcpdump -i $INTERFACE tcp -c 5 >> tcpdump_step_9.txt 2>&1
echo "✓ Step 9 complete"
echo ""

# Step 10: Capture packets from specific port
echo "Step 10: Capture packets from specific port (22)"
echo "Command: sudo tcpdump -i $INTERFACE port 22 -c 5" > tcpdump_step_10.txt
echo "" >> tcpdump_step_10.txt
echo "Output:" >> tcpdump_step_10.txt
sudo timeout 10s tcpdump -i $INTERFACE port 22 -c 5 >> tcpdump_step_10.txt 2>&1
echo "✓ Step 10 complete"
echo ""

# Step 11: Capture packets from source IP
LOCAL_IP=$(hostname -I | awk '{print $1}')
echo "Step 11: Capture packets from source IP"
echo "Command: sudo tcpdump -i $INTERFACE src $LOCAL_IP -c 5" > tcpdump_step_11.txt
echo "" >> tcpdump_step_11.txt
echo "Output:" >> tcpdump_step_11.txt
sudo tcpdump -i $INTERFACE src $LOCAL_IP -c 5 >> tcpdump_step_11.txt 2>&1
echo "✓ Step 11 complete"
echo ""

# Step 12: Capture packets to destination IP (using gateway)
GATEWAY_IP=$(ip route | grep default | awk '{print $3}' | head -n 1)
echo "Step 12: Capture packets to destination IP"
echo "Command: sudo tcpdump -i $INTERFACE dst $GATEWAY_IP -c 5" > tcpdump_step_12.txt
echo "" >> tcpdump_step_12.txt
echo "Output:" >> tcpdump_step_12.txt
sudo timeout 10s tcpdump -i $INTERFACE dst $GATEWAY_IP -c 5 >> tcpdump_step_12.txt 2>&1
echo "✓ Step 12 complete"
echo ""

echo "=========================================="
echo "All tcpdump exercises complete!"
echo "=========================================="
echo "Files created:"
ls -lh tcpdump_step_*.txt
echo ""
echo "Please copy all tcpdump_step_*.txt files to your wk4 folder"

# Clean up
rm -f capture.pcap
