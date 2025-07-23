#!/bin/bash

echo "Uninstalling UAD Apollo Monitor..."

# Unload the agent
launchctl unload ~/Library/LaunchAgents/com.apollo.monitor.plist 2>/dev/null

# Remove the plist
rm -f ~/Library/LaunchAgents/com.apollo.monitor.plist

# Remove log rotation config
if [ -f "/etc/newsyslog.d/apollo-monitor.conf" ]; then
    echo "Removing log rotation configuration..."
    sudo rm -f /etc/newsyslog.d/apollo-monitor.conf
    echo "✓ Log rotation configuration removed"
fi

echo "✓ UAD Apollo Monitor uninstalled"
echo "  - Script files remain in ~/.config/apollo-monitor/"
echo "  - To remove everything: rm -rf ~/.config/apollo-monitor/"