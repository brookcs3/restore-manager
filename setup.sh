#!/bin/bash

# This script sets up the restore-manager command.

# Find the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_FILE="$SCRIPT_DIR/restore-manager.py"
DEST_FILE="/usr/local/bin/restore-manager"

# Check if the source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: restore-manager.py not found in the same directory as the setup script."
    exit 1
fi

# Make the python script executable
echo "Making the script executable..."
chmod +x "$SOURCE_FILE"

# Move the script to /usr/local/bin to make it a global command.
# This requires sudo.
echo "Moving the script to /usr/local/bin. You may be asked for your password."
sudo mv "$SOURCE_FILE" "$DEST_FILE"

# Check if the move was successful
if [ $? -eq 0 ]; then
    echo -e "\nSetup complete!"
    echo "You can now run the 'restore-manager' command from any directory."
else
    echo -e "\nError: Failed to move the script. Please check permissions and try again."
fi
