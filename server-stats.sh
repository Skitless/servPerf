#!/bin/bash

idle_percentage=$(mpstat 1 1 | awk '$12 ~ /[0-9.]+/ { print 100 - $13 }')

echo "Total CPU Usage: $idle_percentage%"