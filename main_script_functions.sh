# Function to check if the main script is already running
is_running() {
    if [ -f "$pid_file" ]; then
        return 0  # Script is running
    else
        return 1  # Script is not running
    fi
}

# Function to start the main script
start_script() {
    validate_interval_range "$1"  # Validate the provided interval range
    local interval=${1:-10}
    validate_interval "$interval"  # Validate the provided interval

    if is_running; then
        echo "$ERR_SCRIPT_RUNNING"
        exit 1
    fi

    # Start the main script in the background
    bash "$main_script" "$interval" &
    
    # Save the PID
    echo $! > "$pid_file"
    echo "Script started with PID $(cat $pid_file)."
}

# Function to stop the main script
stop_script() {
    if ! is_running; then
        echo "$ERR_SCRIPT_NOT_RUNNING"
        exit 1
    fi

    if ! kill -TERM "$(cat "$pid_file")"; then
        echo "$ERR_STOP_FAILED"
        exit 1
    fi

    rm -f "$pid_file"
    echo "Script stopped successfully."
}