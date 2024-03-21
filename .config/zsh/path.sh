# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

if command_exists go; then
  export PATH=$PATH:/Users/$USERNAME/go/bin
fi
export PATH=$PATH:/Users/$USERNAME/.local/bin

