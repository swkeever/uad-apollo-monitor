#!/bin/bash

# Apollo Twin X Monitor Script
# Closes UAD apps when Apollo Twin X is not connected

# Check if Apollo Twin X is connected via Thunderbolt
check_apollo_connected() {
    system_profiler SPThunderboltDataType 2>/dev/null | grep -q "Apollo Twin X"
    return $?
}

# Close UAD apps (but keep UA Mixer Engine running)
close_uad_apps() {
    echo "Apollo Twin X not detected. Closing UAD apps..."
    
    # Close UAD Console
    if killall "UAD Console" 2>/dev/null; then
        echo "✓ UAD Console closed"
    fi
    
    # Close UAD Meter & Control Panel
    if killall "UAD Meter & Control Panel" 2>/dev/null; then
        echo "✓ UAD Meter & Control Panel closed"
    fi
}

# Main logic
if check_apollo_connected; then
    echo "Apollo Twin X is connected. No action taken."
else
    close_uad_apps
fi