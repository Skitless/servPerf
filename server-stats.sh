#!/bin/bash

echo "---SERVER STATS---"
uptime

echo "---CPU USAGE--"
top -bn1 | grep "%Cpu(s):" | cut -d ',' -f 4 | awk '{print "Usage: " 100-$1 "%"}'

echo "---MEMORY USAGE(RAM)--"
free -h | awk 'NR==2{printf "Used: %s / Total: %s (%.2f%%)\n", $3, $2, $3/$2*100}'

echo "---DISK USAGE---"
df -h | grep "/" -w | awk '{printf "Total: %sG\nUsed: %s (%.2f%%)\nFree: %s (%.2f%%)\n",$3 + $4, $3, $3/($3+$4) * 100, $4, $4/($3+$4) * 100}'

echo "---Top 5 Processes by CPU Usage---"
ps aux --sort=-%cpu --no-headers | head -5 | awk '{printf "%-8s %-8s %-10s %5s %5s %s\n", $2, $3, $1, $3, $4, $11}'
