#!/bin/zsh

# Get the directory containing the script
SCRIPT_DIR="$HOME/.config/zsh"
# Source all files in the same directory
for file in "${SCRIPT_DIR}"/*.sh; do
    # Exclude the init.sh file itself
    if [[ "${file}" != "${SCRIPT_DIR}/init.sh" ]]; then
        source "${file}"
    fi
done

