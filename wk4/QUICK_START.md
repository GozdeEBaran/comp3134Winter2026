# Week 4 Lab - Quick Start Guide

## 🚀 FASTEST WAY TO COMPLETE THIS LAB

### Step 1: Transfer Scripts to Your Linux Server

Based on your previous weeks (wk1, wk2), you have a DigitalOcean droplet. Transfer the scripts there:

```bash
# From your Mac terminal, in this directory:
cd /Users/gozdeeski/Desktop/GBC/WINTER2026-GB-T177/COMP3134-CYBERSECURITY/comp3134/wk4

# Copy scripts to your droplet (replace with your droplet IP):
scp run_iptables.sh run_tcpdump.sh root@<YOUR_DROPLET_IP>:~/
```

### Step 2: Run Scripts on Linux Server

SSH into your droplet and run the scripts:

```bash
# SSH into your droplet
ssh root@<YOUR_DROPLET_IP>

# Make scripts executable (if needed)
chmod +x run_iptables.sh run_tcpdump.sh

# Run iptables script (takes ~5 seconds)
./run_iptables.sh

# Run tcpdump script (takes ~2-3 minutes)
./run_tcpdump.sh

# This will create 13 files:
# - iptables_rules_1.txt
# - tcpdump_step_1.txt through tcpdump_step_12.txt
```

### Step 3: Copy Files Back to Mac

From your Mac terminal:

```bash
# Copy all generated files back
cd /Users/gozdeeski/Desktop/GBC/WINTER2026-GB-T177/COMP3134-CYBERSECURITY/comp3134/wk4

scp root@<YOUR_DROPLET_IP>:~/iptables_rules_1.txt .
scp root@<YOUR_DROPLET_IP>:~/tcpdump_step_*.txt .

# Verify files were copied
ls -lh *.txt
```

### Step 4: WireShark Screenshots (11 screenshots needed)

**On your Mac (or lab machine):**

1. **Install WireShark** (if not already installed):
   - Download from: https://www.wireshark.org/download.html
   - Or use Homebrew: `brew install --cask wireshark`

2. **Take Initial Screenshots** (2 screenshots):
   ```
   - Launch WireShark
   - Capture → Options → Select Wi-Fi → Start
   - Browse some websites to generate traffic
   - Take screenshot: wireshark_1.png
   
   - Capture → Stop
   - Capture → Start (select different interface or same)
   - Take screenshot: wireshark_2.png
   ```

3. **Take Filter Exercise Screenshots** (9 screenshots):

   Use this workflow for each filter:
   - Start capturing (Capture → Start)
   - Apply the filter in the filter toolbar
   - Browse/generate relevant traffic
   - Take screenshot
   - Name it: using_wireshark_N.png

   | Screenshot | Filter | How to Generate Traffic |
   |------------|--------|------------------------|
   | using_wireshark_1.png | `arp or dns` | Just browse any website |
   | using_wireshark_2.png | `udp or tcp` | Browse any website |
   | using_wireshark_3.png | `tcp.port > 3000` | Visit http://localhost:8080 or any high-port service |
   | using_wireshark_4.png | `http` | Visit http://example.com (not https) |
   | using_wireshark_5.png | `http.request.method == "POST"` | Submit a form on any website |
   | using_wireshark_6.png | `udp contains "google"` | Search on Google or visit google.com |
   | using_wireshark_7.png | `http.response.code == 404` | Visit http://example.com/fake-page |
   | using_wireshark_8.png | `tcp.flags.ack == 1` | Browse any website (most TCP has ACK) |
   | using_wireshark_9.png | See Flow Graph instructions below | Visit any website |

4. **Flow Graph (using_wireshark_9.png)**:
   ```
   - Start capturing
   - Visit a new website (like http://example.com)
   - Stop capturing
   - Select a few packets with same IP pair
   - Statistics → Flow Graph
   - Look for SYN → SYN-ACK → ACK sequence
   - Take screenshot
   ```

### Step 5: Check Progress

```bash
cd /Users/gozdeeski/Desktop/GBC/WINTER2026-GB-T177/COMP3134-CYBERSECURITY/comp3134/wk4
./check_progress.sh
```

### Step 6: Commit and Push

```bash
cd /Users/gozdeeski/Desktop/GBC/WINTER2026-GB-T177/COMP3134-CYBERSECURITY/comp3134

git status
git add wk4/
git commit -m "Complete Week 4 lab - WireShark and network sniffing"
git push origin main
```

---

## 📝 Files You Need (24 total)

### ✅ Automated (13 files) - Run scripts on Linux
- iptables_rules_1.txt
- tcpdump_step_1.txt through tcpdump_step_12.txt

### 📸 Manual (11 files) - Take screenshots
- wireshark_1.png
- wireshark_2.png
- using_wireshark_1.png through using_wireshark_9.png

---

## ⏱️ Time Estimate

- Linux scripts: 5 minutes
- WireShark screenshots: 20-30 minutes
- Total: ~30-35 minutes

---

## 🆘 Need Help?

- See `README.md` for detailed instructions
- See `wireshark_filters_reference.md` for filter examples
- See `tcpdump_commands.md` for manual tcpdump commands

---

## 🎯 Your Droplet Info (from LAB1)

Check `/Users/gozdeeski/Desktop/GBC/WINTER2026-GB-T177/COMP3134-CYBERSECURITY/LAB1/` for your droplet IP address.
