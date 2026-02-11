# Week 4 Lab Exercise - WireShark & Network Sniffing

## Overview
This lab requires you to use Linux tools (iptables, tcpdump) and WireShark. You'll need to run these on:
- Your lab machine (recommended for WireShark GUI)
- OR your DigitalOcean droplet for command-line tools

## Part B: Server Firewall (iptables)

### Commands to run on Linux:

```bash
# 1. Check if iptables is installed
man iptables

# 2. If not installed, install it
sudo apt-get update
sudo apt-get install iptables

# 3. View all defined rules and save to file
sudo iptables -L -v > iptables_rules_1.txt
```

**Action Required:** Copy `iptables_rules_1.txt` to this wk4 folder

## Part C & D: Getting Started with WireShark

### On your local machine or lab machine:

1. Download and install WireShark from: https://www.wireshark.org/download.html
2. Launch WireShark
3. Click **Capture => Options**
4. Select either **Ethernet** or **Wi-Fi** (based on your connection)
5. Double-click to start capturing

**Screenshot Required:** `wireshark_1.png` - Capture window showing packets

### Switch Captures:
1. Stop current capture: **Capture => Stop**
2. Start new capture: **Capture => Start**
3. Select different interface
4. Start new capture

**Screenshot Required:** `wireshark_2.png` - New capture window

## Part E: Using WireShark - 9 Filter Exercises

For each exercise below, apply the filter and take a screenshot named `using_wireshark_N.png`:

### 1. ARP or DNS traffic only
**Filter:** `arp or dns`

### 2. UDP or TCP traffic only
**Filter:** `udp or tcp`

### 3. TCP traffic on port > 3000
**Filter:** `tcp.port > 3000`

### 4. HTTP traffic only
**Filter:** `http`

### 5. HTTP POST method requests
**Filter:** `http.request.method == "POST"`
**Note:** Visit a website with a form and submit it to generate POST traffic

### 6. UDP traffic containing "google"
**Filter:** `udp contains "google"`

### 7. HTTP traffic where page was not found
**Filter:** `http.response.code == 404`

### 8. TCP traffic with ACK flag set
**Filter:** `tcp.flags.ack == 1`

### 9. Flow Graph showing 3-way handshake
1. Select any two IP addresses having TCP communication
2. Go to **Statistics => Flow Graph**
3. Select the TCP 3-way handshake packets (SYN, SYN-ACK, ACK)
4. Take screenshot

**Screenshot Required:** `using_wireshark_9.png`

## Part F: Install and Use tcpdump

### Commands to run on Linux:

```bash
# Install tcpdump
sudo apt-get install tcpdump

# Now follow the 12 examples from:
# https://www.tecmint.com/12-tcpdump-commands-a-network-sniffer-tool/
```

### Create files for each step: `tcpdump_step_N.txt`

I'll create command templates for each step in separate files.

## Part G: Commit and Push to GitHub

```bash
cd /path/to/comp3134
git add wk4/
git status
git commit -m "Complete Week 4 lab - WireShark and network sniffing"
git push origin main
```

## Checklist

- [ ] iptables_rules_1.txt
- [ ] wireshark_1.png
- [ ] wireshark_2.png
- [ ] using_wireshark_1.png (ARP or DNS)
- [ ] using_wireshark_2.png (UDP or TCP)
- [ ] using_wireshark_3.png (TCP port > 3000)
- [ ] using_wireshark_4.png (HTTP)
- [ ] using_wireshark_5.png (HTTP POST)
- [ ] using_wireshark_6.png (UDP with "google")
- [ ] using_wireshark_7.png (HTTP 404)
- [ ] using_wireshark_8.png (TCP ACK flag)
- [ ] using_wireshark_9.png (Flow Graph 3-way handshake)
- [ ] tcpdump_step_1.txt through tcpdump_step_12.txt
- [ ] Pushed to GitHub
