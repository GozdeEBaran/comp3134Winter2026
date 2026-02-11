#!/bin/bash
# Automated script to upload and run lab scripts on your droplet
# Your droplet IP: 178.128.236.255

DROPLET_IP="178.128.236.255"
DROPLET_USER="root"

echo "=========================================="
echo "Week 4 Lab - Automated Setup"
echo "=========================================="
echo "This script will:"
echo "1. Upload scripts to your droplet"
echo "2. Run them remotely"
echo "3. Download the results back to this folder"
echo ""
echo "Droplet: $DROPLET_USER@$DROPLET_IP"
echo "=========================================="
echo ""

# Check if we can reach the droplet
echo "Testing connection to droplet..."
if ! ssh -o ConnectTimeout=5 -o StrictHostKeyChecking=no $DROPLET_USER@$DROPLET_IP "echo 'Connection successful'" 2>/dev/null; then
    echo "❌ Cannot connect to droplet at $DROPLET_IP"
    echo ""
    echo "Please check:"
    echo "1. Is the droplet running?"
    echo "2. Is the IP address correct?"
    echo "3. Do you have SSH access?"
    echo ""
    echo "Try manually: ssh $DROPLET_USER@$DROPLET_IP"
    exit 1
fi

echo "✓ Connection successful"
echo ""

# Upload scripts
echo "Uploading scripts to droplet..."
scp -o StrictHostKeyChecking=no run_iptables.sh run_tcpdump.sh $DROPLET_USER@$DROPLET_IP:~/ || {
    echo "❌ Failed to upload scripts"
    exit 1
}
echo "✓ Scripts uploaded"
echo ""

# Make scripts executable and run them
echo "Running iptables script..."
ssh $DROPLET_USER@$DROPLET_IP "chmod +x run_iptables.sh && ./run_iptables.sh" || {
    echo "❌ iptables script failed"
    exit 1
}
echo "✓ iptables complete"
echo ""

echo "Running tcpdump script (this will take 2-3 minutes)..."
ssh $DROPLET_USER@$DROPLET_IP "chmod +x run_tcpdump.sh && ./run_tcpdump.sh" || {
    echo "⚠️  tcpdump script had some errors, but may have generated files"
}
echo "✓ tcpdump complete"
echo ""

# Download results
echo "Downloading results..."
scp $DROPLET_USER@$DROPLET_IP:~/iptables_rules_1.txt . 2>/dev/null && echo "  ✓ iptables_rules_1.txt"
scp $DROPLET_USER@$DROPLET_IP:~/tcpdump_step_*.txt . 2>/dev/null && echo "  ✓ tcpdump files"

echo ""
echo "=========================================="
echo "Scripts completed!"
echo "=========================================="
echo ""

# Check progress
if [ -f "check_progress.sh" ]; then
    echo "Checking progress..."
    ./check_progress.sh
else
    echo "Files downloaded:"
    ls -lh iptables_rules_1.txt tcpdump_step_*.txt 2>/dev/null
fi

echo ""
echo "=========================================="
echo "NEXT STEPS:"
echo "=========================================="
echo "1. Take 11 WireShark screenshots (see QUICK_START.md)"
echo "2. Run: ./check_progress.sh to verify"
echo "3. Commit and push to GitHub"
echo ""
