#!/bin/bash

# Check for required dependencies
command -v jq >/dev/null 2>&1 || { echo >&2 "jq is required but it's not installed. Aborting."; exit 1; }
command -v say >/dev/null 2>&1 || { echo >&2 "say command is required but it's not available. Aborting."; exit 1; }

# Read phrases from JSON file into an array
IFS=$'\n' read -d '' -r -a phrases < <(jq -r '.phrases[]' phrases.json)

# Define the default interval (10 seconds)
interval=${1:-10}
speaking_rate=225

# Start the main loop
while true; do
    random_index=$((RANDOM % ${#phrases[@]}))
    say -v Alex -r "$speaking_rate" "${phrases[$random_index]}"
    sleep "$interval"
done
