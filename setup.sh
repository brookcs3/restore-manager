#!/bin/bash

# This script sets up the restore-manager command using pip.

# Navigate to the project root directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Installing restore-manager..."

# Install the package using pip
# Use sudo for global installation, or remove sudo if installing in a virtual environment
sudo pip install .

# Check if the installation was successful
if [ $? -eq 0 ]; then
    echo -e "\nSetup complete!"
    echo "You can now run the 'restore-manager' command from any directory."
    echo "Remember to run 'pip install xattr' if you haven't already."
else
    echo -e "\nError: Failed to install restore-manager. Please check the output above for details."
fi