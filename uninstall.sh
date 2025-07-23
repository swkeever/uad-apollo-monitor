#!/bin/bash

echo "Uninstalling Apollo Monitor..."

# Unload the agent
launchctl unload ~/Library/LaunchAgents/com.apollo.monitor.plist 2>/dev/null

# Remove the plist
rm -f ~/Library/LaunchAgents/com.apollo.monitor.plist

echo "✓ Apollo Monitor uninstalled"
echo "  - Script files remain in ~/.config/apollo-monitor/"
echo "  - To remove everything: rm -rf ~/.config/apollo-monitor/"