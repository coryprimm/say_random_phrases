#!/bin/bash

# Function to validate the interval value
validate_interval() {
    local interval="$1"
    if ! [[ "$interval" =~ ^[0-9]+$ ]]; then
        echo "$ERR_INTERVAL_POS_INT"
        exit 1
    fi
}

# Function to validate command-line arguments
validate_arguments() {
    if [ $# -lt 1 ] || [ $# -gt 2 ]; then
        echo "$ERR_USAGE"
        print_usage
        exit 1
    fi

    if [ "$1" != "start" ] && [ "$1" != "stop" ]; then
        echo "$ERR_COMMAND"
        print_usage
        exit 1
    fi
}

# Function to validate path existence and accessibility
validate_path() {
    if [ ! -x "$main_script" ]; then
        echo "$ERR_MAIN_SCRIPT_NOT_EXEC"
        exit 1
    fi

    if [ ! -f "$main_script" ]; then
        echo "$ERR_MAIN_SCRIPT_NOT_EXIST"
        exit 1
    fi

    if [ ! -d "$(dirname "$pid_file")" ]; then
        echo "$ERR_PID_DIR_NOT_EXIST"
        exit 1
    fi
}

# Function to validate PID file ownership
validate_pid_ownership() {
    if [ -f "$pid_file" ] && [ "$(stat -f %Su "$pid_file")" != "$(whoami)" ]; then
        echo "$ERR_PID_NOT_OWNED"
        exit 1
    fi
}

# Function to validate interval range
validate_interval_range() {
    local interval="$1"
    if [ "$interval" -lt 1 ] || [ "$interval" -gt 3600 ]; then
        echo "$ERR_INTERVAL_RANGE"
        exit 1
    fi
}
