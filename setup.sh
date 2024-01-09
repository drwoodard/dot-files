#!/bin/bash

# Link the appropriate config directories 
# Get the current directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create symbolic links for every directory within .config
for config_dir in "$SCRIPT_DIR/.config"/*; do
    [ -d "$config_dir" ] || continue  # Check if it's a directory
    ln -s "$config_dir" ~/.config/$(basename "$config_dir")
done

