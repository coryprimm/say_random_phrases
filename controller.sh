#!/bin/bash

# Controller Script for Managing the Main Script

source functions/error_messages.sh
source functions/validation_functions.sh
source functions/signal_handlers.sh
source functions/main_script_functions.sh

# Path to the main script
main_script="./say_random_phrases.sh"

# PID file to store the process ID of the main script
pid_file="/tmp/say_random_phrases.pid"


# Main function to handle command-line arguments
main() {
    validate_arguments "$@"  # Validate command-line arguments
    validate_path  # Validate paths
    validate_pid_ownership  # Validate PID file ownership

    case "$1" in
        start)
            start_script "$2"  # Start the main script with an optional interval
            ;;
        stop)
            stop_script  # Stop the main script
            ;;
    esac

    exit 0
}

# Call the main function with command-line arguments
main "$@"
