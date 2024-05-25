# error_messages.sh

#!/bin/bash

# Define error messages
export ERR_USAGE="Error: Invalid number of arguments. Please provide either 'start' or 'stop' as the command."
export ERR_COMMAND="Error: Unrecognized command. Command must be 'start' or 'stop'."
export ERR_MAIN_SCRIPT_NOT_EXEC="Error: Main script '$main_script' does not exist or is not executable."
export ERR_MAIN_SCRIPT_NOT_EXIST="Error: Main script '$main_script' does not exist."
export ERR_PID_DIR_NOT_EXIST="Error: Directory '$(dirname "$pid_file")' to store PID file does not exist."
export ERR_PID_NOT_OWNED="Error: The PID file '$pid_file' is not owned by the current user."
export ERR_INTERVAL_POS_INT="Error: Interval must be a positive integer in seconds."
export ERR_INTERVAL_RANGE="Error: Interval must be between 1 and 3600 seconds to prevent excessive resource consumption."
export ERR_SCRIPT_RUNNING="Error: The script is already running. Use 'stop' command to stop the running instance."
export ERR_SCRIPT_NOT_RUNNING="Error: The script is not running. There's no instance to stop."
export ERR_STOP_FAILED="Error: Failed to stop the script. Process termination failed."
