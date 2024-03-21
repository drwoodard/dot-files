#!/bin/zsh

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Aliases
if command_exists lsd; then
    alias ls='lsd'
fi

if command_exists nvim; then
    alias vi="nvim"
    alias vim="nvim"
fi

if command_exists bat; then
    alias cat='bat'
fi

# Google Cloud
alias gssh="clear&gcloud cloud-shell ssh"

alias ll='ls -l'
alias la='ls -al'
alias lt='ls --tree'

alias s='source ~/.zshrc'

if command_exists python3; then
    alias serve='python3 -m http.server'
fi

