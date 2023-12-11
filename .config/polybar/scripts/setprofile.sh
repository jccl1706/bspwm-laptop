#!/bin/bash

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

# Check if the file exists and is not empty
if [ -s "$last_active_profile_file" ]; then
    last_active_profile=$(cat "$last_active_profile_file")
else
    # Set a default profile if the file doesn't exist or is empty
    last_active_profile="$quiet_profile"
fi

cur_profile=$(asusctl profile -p | awk '{print $4}')

if [ "$cur_profile" != "$last_active_profile" ]; then
    if [ "$cur_profile" = "$quiet_profile" ]; then
        echo "󰡳"
        dunstify "Switched to Quiet profile" -t 2000
        # Add your commands or actions for the 'Quiet' profile here
    elif [ "$cur_profile" = "$balan_profile" ]; then
        echo "󰊚"
        # Add your commands or actions for the 'Balanced' profile here
        dunstify "Switched to Balanced profile" -t 2000
    elif [ "$cur_profile" = "$perfo_profile" ]; then
        echo "󰡴"
        dunstify "Switched to Performance profile" -t 2000
        # Add your commands or actions for the 'Performance' profile here
    else
        echo "Unknown profile: $cur_profile"
        # Add handling for unknown profiles here if needed
    fi

    # Update the last_active_profile
    echo "$cur_profile" > "$last_active_profile_file"
fi
