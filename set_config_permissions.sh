#!/bin/bash

# Define config folder
CONFIG_DIR="./configs"

# Check if permission is provided
if [ -z "$1" ]; then
    echo "Error: No permission specified! Please provide a 3-digit octal (e.g., 444)."
    exit 1
fi

# Set permission from argument
PERMISSION="$1"

# Validate permission format (3-digit octal)
if ! [[ "$PERMISSION" =~ ^[0-7]{3}$ ]]; then
    echo "Error: Invalid permission format! Please provide a 3-digit octal (e.g., 444)."
    exit 1
fi

# Check if config folder exists
if [ ! -d "$CONFIG_DIR" ]; then
    echo "Error: $CONFIG_DIR folder does not exist!"
    exit 1
fi

# Flag to track if any files were processed
PROCESSED=0

# Find files that do not have the specified permission and process them
while IFS= read -r file; do
    # Set the file to the specified permission
    chmod "$PERMISSION" "$file"
    if [ $? -eq 0 ]; then
        echo "Set permission $PERMISSION: $file"
    else
        echo "Error: Failed to set permission $PERMISSION for $file!"
        exit 1
    fi

    PROCESSED=1
done < <(find "$CONFIG_DIR" -type f ! -perm "$PERMISSION")

# Check if any files were processed
if [ $PROCESSED -eq 0 ]; then
    echo "No files needed to be set to permission $PERMISSION."
else
    echo "Success: Completed permission changes to $PERMISSION."
fi

# List file permissions with aligned output
echo "Current file permissions:"
find "$CONFIG_DIR" -type f -exec ls -l {} \; | awk '{printf "%-12s %s\n", $1, $9}'