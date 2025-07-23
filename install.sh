#!/bin/bash

echo "Installing UAD Apollo Monitor..."

# Copy plist to LaunchAgents
cp ~/.config/apollo-monitor/com.apollo.monitor.plist ~/Library/LaunchAgents/

# Load the agent
launchctl load ~/Library/LaunchAgents/com.apollo.monitor.plist

echo "✓ UAD Apollo Monitor installed and started"
echo "  - Checks every 5 minutes"
echo ""
echo "To check status: launchctl list | grep apollo"
echo "To uninstall: ~/.config/apollo-monitor/uninstall.sh"