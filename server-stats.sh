#!/bin/bash

echo "=== SERVER PERFORMANCE STATS ==="

uptime

top -bn1 | grep "%Cpu(s):" | cut -d ',' -f 4 | awk '{print "Usage: " 100-$1 "%"}'

echo
