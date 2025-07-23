#!/bin/bash

echo "Installing UAD Apollo Monitor..."

# Copy plist to LaunchAgents
cp ~/.config/apollo-monitor/com.apollo.monitor.plist ~/Library/LaunchAgents/

# Load the agent
launchctl load ~/Library/LaunchAgents/com.apollo.monitor.plist

# Setup log rotation
NEWSYSLOG_DIR="/etc/newsyslog.d"
if [ -d "$NEWSYSLOG_DIR" ]; then
    echo "Setting up log rotation..."
    sudo cp ~/.config/apollo-monitor/apollo-monitor.newsyslog.conf /etc/newsyslog.d/apollo-monitor.conf
    echo "✓ Log rotation configured"
else
    echo "⚠ Note: /etc/newsyslog.d not found. Log rotation not configured."
    echo "  To set up manually, add apollo-monitor.newsyslog.conf to /etc/newsyslog.conf"
fi

echo "✓ UAD Apollo Monitor installed and started"
echo "  - Checks every 5 minutes"
echo "  - Logs: ~/.config/apollo-monitor/apollo-monitor.log"
echo ""
echo "To check status: launchctl list | grep apollo"
echo "To uninstall: ~/.config/apollo-monitor/uninstall.sh"