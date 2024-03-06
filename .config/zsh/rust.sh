check_rust() {
    command -v rustc >/dev/null 2>&1
}

if check_rust; then
    source "$HOME/.cargo/env"
fi
