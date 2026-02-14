#!/bin/bash

# Get the directory from the user
LOG_DIR=$1

# If user user provide a directory
if [ -z "$LOG_DIR" ]; then
    echo "Please provide a log directory."
    echo "i.e: ./log-archive.sh /var/log"
    exit 1
fi

# Create a folder called archived_logs (if it doesn't exist)
mkdir -p archived_logs

# Get current date and time
CURRENT_TIME=$(date +%Y%m%d_%H%M%S)

# Create archive file name
ARCHIVE_NAME="archived_logs/logs_$CURRENT_TIME.tar.gz"

# Compress the log directory
tar -czf $ARCHIVE_NAME $LOG_DIR

# Save archive activity to a file
echo "Logs from $LOG_DIR archived at $CURRENT_TIME" >> archive_history.txt

# Show archive created success message
echo "Archive created: $ARCHIVE_NAME"

