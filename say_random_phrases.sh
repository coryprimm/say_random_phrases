#say_random_phrases.sh

#!/bin/bash

# Check for required dependencies
check_dependencies() {
    command -v jq >/dev/null 2>&1 || { echo >&2 "jq is required but it's not installed. Please install it using 'apt-get install jq' or 'brew install jq'. Aborting."; exit 1; }
    command -v say >/dev/null 2>&1 || { echo >&2 "say command is required but it's not available. Aborting."; exit 1; }
}

# Read phrases from JSON file into an array
read_phrases() {
    IFS=$'\n' read -d '' -r -a phrases < <(jq -r '.phrases[]' phrases.json)
}

# Start the main loop
main() {
    check_dependencies

    read_phrases

    # Define the default interval (10 seconds)
    local interval=${1:-10}
    local speaking_rate=225  # Default speaking rate

    while true; do
        random_index=$((RANDOM % ${#phrases[@]}))
        say -v Alex -r "$speaking_rate" "${phrases[$random_index]}"
        sleep "$interval"
    done
}

main "$@"
