#!/bin/bash

# Import error messages
source error_messages.sh

# Import validation functions
source validation_functions.sh

# Import signal handlers
source signal_handlers.sh

# Source the script functions
source main_script_functions.sh

# Controller Script for Managing the Main Script

# Usage Instructions:
# Start the Main Script: Run ./controller.sh start [interval] where [interval] is optional and specifies the interval in seconds.
# Stop the Main Script: Run ./controller.sh stop to stop the running main script.

# Path to the main script
main_script="./say_random_phrases.sh"

# PID file to store the process ID of the main script
pid_file="/tmp/say_random_phrases.pid"

# Function to print usage instructions
print_usage() {
    echo "$ERR_USAGE"
    echo "   start: Start the main script."
    echo "   stop: Stop the main script if it's running."
    echo "   interval: Optional. Specify the interval in seconds. Default is 10."
}



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
