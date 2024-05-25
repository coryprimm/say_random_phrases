#!/bin/bash

#Start the Main Script: Run ./controller.sh start [interval] where [interval] is optional and specifies the interval in seconds.
#Stop the Main Script: Run ./controller.sh stop to stop the running main script.

# Path to the main script
main_script="./say_random_phrases.sh"

# PID file to store the process ID of the main script
pid_file="/tmp/say_random_phrases.pid"

# Function to print usage instructions
usage() {
    echo "Usage: $0 [start|stop] [interval]"
    echo "   start: Start the main script."
    echo "   stop: Stop the main script if it's running."
    echo "   interval: Optional. Specify the interval in seconds. Default is 10."
}

# Check if the main script is already running
is_running() {
    if [ -f "$pid_file" ]; then
        return 0
    else
        return 1
    fi
}

# Start the main script
start_script() {
    if is_running; then
        echo "Script is already running."
        exit 1
    fi

    interval=${1:-10}

    # Start the main script in the background
    bash "$main_script" "$interval" &
    
    # Save the PID
    echo $! > "$pid_file"
    echo "Script started with PID $(cat $pid_file)."
}

# Stop the main script
stop_script() {
    if is_running; then
        kill -TERM "$(cat "$pid_file")" && rm -f "$pid_file"
        echo "Script stopped."
    else
        echo "Script is not running."
    fi
}

# Handle command-line arguments
case "$1" in
    start)
        start_script "$2"
        ;;
    stop)
        stop_script
        ;;
    *)
        usage
        ;;
esac

exit 0
