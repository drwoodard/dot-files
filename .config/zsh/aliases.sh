#!/bin/zsh

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

#Standard aliases
alias ll='ls -l'
alias la='ls -al'
alias lt='ls --tree'
alias s='source ~/.zshrc'

# Environment dependant aliases
if command_exists lsd; then
    alias ls='lsd'
fi

if command_exists python3; then
    alias serve='python3 -m http.server'
fi

if command_exists nvim; then
    alias vi="nvim"
    alias vim="nvim"
fi

if command_exists bat; then
  alias cat='bat'
fi


if command_exists wl-copy; then
  alias pbcopy='wl-copy'
fi

if command_exists wl-paste; then
  alias pbpaste='wl-paste'
fi

#Google Cloud
alias gssh="clear&gcloud cloud-shell ssh"

#snowsql
if command_exists snowsql; then
 alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql
fi
