# tcpdump Commands Reference

Based on: https://www.tecmint.com/12-tcpdump-commands-a-network-sniffer-tool/

For each command below, run it on your Linux system and save the output to `tcpdump_step_N.txt`

## Step 1: Capture packets from specific interface
```bash
sudo tcpdump -i eth0
# Save output to tcpdump_step_1.txt
```

## Step 2: Capture only N number of packets
```bash
sudo tcpdump -c 5 -i eth0
# Save output to tcpdump_step_2.txt
```

## Step 3: Print captured packets in ASCII
```bash
sudo tcpdump -A -i eth0
# Save output to tcpdump_step_3.txt
```

## Step 4: Display available interfaces
```bash
sudo tcpdump -D
# Save output to tcpdump_step_4.txt
```

## Step 5: Display captured packets in HEX and ASCII
```bash
sudo tcpdump -XX -i eth0
# Save output to tcpdump_step_5.txt
```

## Step 6: Capture and save packets to a file
```bash
sudo tcpdump -w capture.pcap -i eth0
# Save command and description to tcpdump_step_6.txt
```

## Step 7: Read captured packets file
```bash
sudo tcpdump -r capture.pcap
# Save output to tcpdump_step_7.txt
```

## Step 8: Capture IP address packets
```bash
sudo tcpdump -n -i eth0
# Save output to tcpdump_step_8.txt
```

## Step 9: Capture only TCP packets
```bash
sudo tcpdump -i eth0 tcp
# Save output to tcpdump_step_9.txt
```

## Step 10: Capture packets from specific port
```bash
sudo tcpdump -i eth0 port 22
# Save output to tcpdump_step_10.txt
```

## Step 11: Capture packets from source IP
```bash
sudo tcpdump -i eth0 src <your-ip>
# Save output to tcpdump_step_11.txt
```

## Step 12: Capture packets from destination IP
```bash
sudo tcpdump -i eth0 dst <destination-ip>
# Save output to tcpdump_step_12.txt
```

## Tips:
- Replace `eth0` with your actual network interface (use `tcpdump -D` to list interfaces)
- Use Ctrl+C to stop capturing
- For each step, copy both the command and its output to the respective txt file
- Add a description of what the command does
