#!/bin/bash

# Introduce a delay
sleep 3

# Add this at the beginning of your script
#echo "Script executed at $(date)" >> ~/.config/polybar/scripts/script.log

# Constants
quiet_profile='Quiet'
balan_profile='Balanced'
perfo_profile='Performance'

# Check if asusctl command is available
if ! command -v asusctl &> /dev/null; then
    echo "Error: asusctl command not found. Make sure it is installed." >&2
    exit 1
fi

# File to store the last active profile
last_active_profile_file="/tmp/last_active_profile"

# Error handling for reading the last active profile
if [ -f "$last_active_profile_file" ]; then
    last_active_profile=$(cat "$last_active_profile_file" 2>/dev/null)
    if [ -z "$last_active_profile" ]; then
        echo "Error: Failed to read last active profile from $last_active_profile_file" >&2
        exit 1
    fi
fi

# Get the current profile
cur_profile=$(asusctl profile -p | awk '{print $4}')

# Check if the profile has changed
if [ "$cur_profile" != "$last_active_profile" ]; then
    # Update the last active profile file
    echo "$cur_profile" > "$last_active_profile_file"

    # Main logic
    if [ "$cur_profile" = "$quiet_profile" ]; then
        echo "󰡳"
        dunstify "Switched to Quiet profile" -t 2000
        # Add your commands or actions for the 'Quiet' profile here
    elif [ "$cur_profile" = "$balan_profile" ]; then
        echo "󰊚"
        dunstify "Switched to Balanced profile" -t 2000
        # Add your commands or actions for the 'Balanced' profile here
    elif [ "$cur_profile" = "$perfo_profile" ]; then
        echo "󰡴"
        dunstify "Switched to Performance profile" -t 2000
        # Add your commands or actions for the 'Performance' profile here
    else
        echo "Unknown profile: $cur_profile"
        dunstify "Unknown profile: $cur_profile" -u critical
        # Add handling for unknown profiles here if needed
    fi
fi

