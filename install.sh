#!/bin/bash

echo "Installing UAD Apollo Monitor..."

# Generate plist from template
APOLLO_MONITOR_PATH="$HOME/.config/apollo-monitor"
sed "s|{{APOLLO_MONITOR_PATH}}|$APOLLO_MONITOR_PATH|g" \
    "$APOLLO_MONITOR_PATH/com.apollo.monitor.plist.template" \
    > "$APOLLO_MONITOR_PATH/com.apollo.monitor.plist"

# Copy plist to LaunchAgents
cp ~/.config/apollo-monitor/com.apollo.monitor.plist ~/Library/LaunchAgents/

# Load the agent
launchctl load ~/Library/LaunchAgents/com.apollo.monitor.plist

echo "✓ UAD Apollo Monitor installed and started"
echo "  - Checks every 5 minutes"
echo ""
echo "To check status: launchctl list | grep apollo"
echo "To uninstall: ~/.config/apollo-monitor/uninstall.sh"