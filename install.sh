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
    # Create newsyslog config with current user
    cat > /tmp/apollo-monitor-newsyslog.conf <<EOF
# Logfile rotation for UAD Apollo Monitor
# Format: logfile_name [owner:group] mode count size when flags [/pid_file] [sig_num]
$HOME/.config/apollo-monitor/apollo-monitor.log    $USER:staff    644    5    1024    *    Z
$HOME/.config/apollo-monitor/apollo-monitor.error.log    $USER:staff    644    5    1024    *    Z
EOF
    sudo cp /tmp/apollo-monitor-newsyslog.conf /etc/newsyslog.d/apollo-monitor.conf
    rm /tmp/apollo-monitor-newsyslog.conf
    echo "✓ Log rotation configured"
else
    echo "⚠ Note: /etc/newsyslog.d not found. Log rotation not configured."
    echo "  To set up manually, create a newsyslog configuration for the log files."
fi

echo "✓ UAD Apollo Monitor installed and started"
echo "  - Checks every 5 minutes"
echo "  - Logs: ~/.config/apollo-monitor/apollo-monitor.log"
echo ""
echo "To check status: launchctl list | grep apollo"
echo "To uninstall: ~/.config/apollo-monitor/uninstall.sh"