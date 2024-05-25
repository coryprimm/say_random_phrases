# signal_handlers.sh

#!/bin/bash

# Function to handle SIGINT signal (Ctrl+C)
handle_sigint() {
    echo "Received SIGINT. Stopping script..."
    stop_script
    exit 0
}

# Function to handle SIGTERM signal
handle_sigterm() {
    echo "Received SIGTERM. Stopping script..."
    stop_script
    exit 0
}

# Register signal handlers
trap handle_sigint SIGINT
trap handle_sigterm SIGTERM
