#!/bin/bash
# Progress checker for Week 4 Lab

echo "=========================================="
echo "Week 4 Lab - Progress Checker"
echo "=========================================="
echo ""

TOTAL=24
COMPLETED=0

echo "Checking for required files..."
echo ""

# Check iptables
echo "IPTABLES (1 file):"
if [ -f "iptables_rules_1.txt" ]; then
    echo "  ✓ iptables_rules_1.txt"
    ((COMPLETED++))
else
    echo "  ✗ iptables_rules_1.txt (MISSING)"
fi
echo ""

# Check WireShark screenshots
echo "WIRESHARK SCREENSHOTS (11 files):"
wireshark_files=("wireshark_1.png" "wireshark_2.png" "using_wireshark_1.png" "using_wireshark_2.png" "using_wireshark_3.png" "using_wireshark_4.png" "using_wireshark_5.png" "using_wireshark_6.png" "using_wireshark_7.png" "using_wireshark_8.png" "using_wireshark_9.png")

for file in "${wireshark_files[@]}"; do
    if [ -f "$file" ]; then
        echo "  ✓ $file"
        ((COMPLETED++))
    else
        echo "  ✗ $file (MISSING)"
    fi
done
echo ""

# Check tcpdump outputs
echo "TCPDUMP OUTPUTS (12 files):"
for i in {1..12}; do
    file="tcpdump_step_$i.txt"
    if [ -f "$file" ]; then
        echo "  ✓ $file"
        ((COMPLETED++))
    else
        echo "  ✗ $file (MISSING)"
    fi
done
echo ""

# Summary
echo "=========================================="
echo "PROGRESS: $COMPLETED / $TOTAL files complete"
PERCENT=$((COMPLETED * 100 / TOTAL))
echo "          $PERCENT%"
echo "=========================================="
echo ""

if [ $COMPLETED -eq $TOTAL ]; then
    echo "🎉 All files complete! Ready to commit and push to GitHub."
    echo ""
    echo "Run these commands to submit:"
    echo "  git add wk4/"
    echo "  git commit -m \"Complete Week 4 lab - WireShark and network sniffing\""
    echo "  git push origin main"
else
    MISSING=$((TOTAL - COMPLETED))
    echo "⚠️  Still need $MISSING more file(s)"
    echo ""
    echo "Next steps:"
    if [ ! -f "iptables_rules_1.txt" ]; then
        echo "  1. Run ./run_iptables.sh on Linux machine"
    fi
    tcpdump_missing=0
    for i in {1..12}; do
        if [ ! -f "tcpdump_step_$i.txt" ]; then
            ((tcpdump_missing++))
        fi
    done
    if [ $tcpdump_missing -gt 0 ]; then
        echo "  2. Run ./run_tcpdump.sh on Linux machine"
    fi
    
    wireshark_missing=0
    for file in "${wireshark_files[@]}"; do
        if [ ! -f "$file" ]; then
            ((wireshark_missing++))
        fi
    done
    if [ $wireshark_missing -gt 0 ]; then
        echo "  3. Take $wireshark_missing WireShark screenshot(s)"
        echo "     See wireshark_filters_reference.md for filter examples"
    fi
fi
echo ""
