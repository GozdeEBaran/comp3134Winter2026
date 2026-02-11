# Week 4 Lab Exercise - Network Sniffing with WireShark

## Quick Start Guide

This lab has 3 main parts:
1. **Linux Commands** (iptables & tcpdump) - Run on Linux machine
2. **WireShark** (Screenshots) - Run on machine with GUI
3. **Git Submission** - Push to GitHub

---

## Part 1: Linux Commands (iptables & tcpdump)

### Option A: Using Automated Scripts (RECOMMENDED)

I've created two shell scripts to automate the Linux commands:

#### On your Linux machine (lab computer or DigitalOcean droplet):

```bash
# 1. Copy the scripts to your Linux machine
# 2. Make them executable (already done on Mac)
chmod +x run_iptables.sh run_tcpdump.sh

# 3. Run iptables script
./run_iptables.sh

# 4. Run tcpdump script (this will take a few minutes)
./run_tcpdump.sh

# 5. Copy all generated .txt files back to this wk4 folder
```

### Option B: Manual Commands

Follow the instructions in:
- `INSTRUCTIONS.md` for detailed step-by-step guide
- `tcpdump_commands.md` for all tcpdump commands

---

## Part 2: WireShark Screenshots

You need to take **11 screenshots** total:

### Initial Setup Screenshots:
1. **wireshark_1.png** - First capture window showing packets
2. **wireshark_2.png** - Second capture window (different interface)

### Filter Exercise Screenshots (9 total):
3. **using_wireshark_1.png** - Filter: `arp or dns`
4. **using_wireshark_2.png** - Filter: `udp or tcp`
5. **using_wireshark_3.png** - Filter: `tcp.port > 3000`
6. **using_wireshark_4.png** - Filter: `http`
7. **using_wireshark_5.png** - Filter: `http.request.method == "POST"`
8. **using_wireshark_6.png** - Filter: `udp contains "google"`
9. **using_wireshark_7.png** - Filter: `http.response.code == 404`
10. **using_wireshark_8.png** - Filter: `tcp.flags.ack == 1`
11. **using_wireshark_9.png** - Flow Graph showing TCP 3-way handshake

**Reference:** See `wireshark_filters_reference.md` for detailed instructions on each filter

### How to Take WireShark Screenshots:

1. Install WireShark: https://www.wireshark.org/download.html
2. Launch WireShark
3. Start capturing (Capture → Options → Select interface → Start)
4. Apply filters as needed (use Filter Toolbar)
5. Take screenshots:
   - **macOS:** Cmd+Shift+4 (select area)
   - **Windows:** Win+Shift+S or Snipping Tool
   - **Linux:** Shift+PrtSc or gnome-screenshot
6. Save screenshots with exact filenames to this wk4 folder

---

## Part 3: Required Files Checklist

Make sure you have all these files in the wk4 folder before committing:

### iptables (1 file):
- [ ] iptables_rules_1.txt

### WireShark Screenshots (11 files):
- [ ] wireshark_1.png
- [ ] wireshark_2.png
- [ ] using_wireshark_1.png
- [ ] using_wireshark_2.png
- [ ] using_wireshark_3.png
- [ ] using_wireshark_4.png
- [ ] using_wireshark_5.png
- [ ] using_wireshark_6.png
- [ ] using_wireshark_7.png
- [ ] using_wireshark_8.png
- [ ] using_wireshark_9.png

### tcpdump (12 files):
- [ ] tcpdump_step_1.txt
- [ ] tcpdump_step_2.txt
- [ ] tcpdump_step_3.txt
- [ ] tcpdump_step_4.txt
- [ ] tcpdump_step_5.txt
- [ ] tcpdump_step_6.txt
- [ ] tcpdump_step_7.txt
- [ ] tcpdump_step_8.txt
- [ ] tcpdump_step_9.txt
- [ ] tcpdump_step_10.txt
- [ ] tcpdump_step_11.txt
- [ ] tcpdump_step_12.txt

---

## Part 4: Submit to GitHub

Once all files are in the wk4 folder:

```bash
cd /Users/gozdeeski/Desktop/GBC/WINTER2026-GB-T177/COMP3134-CYBERSECURITY/comp3134

# Check status
git status

# Add all wk4 files
git add wk4/

# Check what will be committed
git status

# Commit
git commit -m "Complete Week 4 lab - WireShark and network sniffing exercises"

# Push to GitHub
git push origin main
```

---

## Troubleshooting

### WireShark Issues:
- **No packets captured:** Make sure you selected the right network interface (Ethernet or Wi-Fi)
- **Can't see HTTP traffic:** Many sites use HTTPS now, which is encrypted. Try visiting http://example.com
- **Filter not working:** Check syntax in `wireshark_filters_reference.md`

### tcpdump Issues:
- **Permission denied:** Use `sudo` before tcpdump commands
- **No interface found:** Run `tcpdump -D` to list available interfaces
- **Hangs/too long:** Press Ctrl+C to stop, or use `-c N` to capture only N packets

### iptables Issues:
- **Not installed:** Run `sudo apt-get update && sudo apt-get install iptables`
- **No rules shown:** That's normal for a default installation, the output will show empty chains

---

## Additional Resources

- WireShark User Guide: https://www.wireshark.org/docs/wsug_html_chunked/
- Display Filters: https://wiki.wireshark.org/DisplayFilters
- Capture Filters: https://wiki.wireshark.org/CaptureFilters
- tcpdump Tutorial: https://www.tecmint.com/12-tcpdump-commands-a-network-sniffer-tool/
- iptables Manual: https://linux.die.net/man/8/iptables

---

## Files in this folder:

- **README.md** (this file) - Main instructions
- **INSTRUCTIONS.md** - Detailed step-by-step guide
- **wireshark_filters_reference.md** - WireShark filter examples
- **tcpdump_commands.md** - All tcpdump commands
- **run_iptables.sh** - Automated script for iptables
- **run_tcpdump.sh** - Automated script for tcpdump
- **PLACEHOLDER_FILES.txt** - List of files you need to create
