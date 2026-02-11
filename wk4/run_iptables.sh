#!/bin/bash
# Week 4 Lab - iptables commands
# Run this script on your Linux machine

echo "=========================================="
echo "Week 4 Lab - iptables Setup"
echo "=========================================="

# Check if iptables is installed
if ! command -v iptables &> /dev/null; then
    echo "iptables not found. Installing..."
    sudo apt-get update
    sudo apt-get install -y iptables
else
    echo "iptables is already installed"
fi

echo ""
echo "Viewing all iptables rules..."
echo ""

# View all defined rules
sudo iptables -L -v > iptables_rules_1.txt

echo "Rules saved to iptables_rules_1.txt"
echo ""
echo "Contents of iptables_rules_1.txt:"
echo "=========================================="
cat iptables_rules_1.txt
echo "=========================================="

echo ""
echo "iptables setup complete!"
echo "Please copy iptables_rules_1.txt to your wk4 folder"
