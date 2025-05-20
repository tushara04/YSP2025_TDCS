#!/usr/bin/env bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

log_info() {
    echo -e "${YELLOW}[INFO] $1${NC}"
}

log_success() {
    echo -e "${GREEN}[SUCCESS] $1${NC}"
}

log_error() {
    echo -e "${RED}[ERROR] $1${NC}"
}

# Credits: Mathias Bynens (https://mths.be/macos)

osascript -e 'Tell Application "System Preferences" to quit'
sudo -v

# Keep sudo session alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Detect Homebrew location and export to PATH
if [ -d /opt/homebrew/bin ]; then
    export PATH="/opt/homebrew/bin:$PATH"
    log_success "Added /opt/homebrew/bin to PATH (Apple Silicon)."
elif [ -d /usr/local/bin ]; then
    export PATH="/usr/local/bin:$PATH"
    log_success "Added /usr/local/bin to PATH (Intel)."
else
    log_error "Homebrew not found in standard locations."
    exit 1
fi

# Confirm brew is available
if ! command -v brew >/dev/null 2>&1; then
    log_error "brew not found in PATH."
    exit 1
fi

log_info "Using Homebrew at: $(which brew)"
brew --version

# Add brew shellenv to zsh config
BREW_ENV_LINE='eval "$(/opt/homebrew/bin/brew shellenv)"'
for file in "./.zshrc" "./.zshenv"; do
    if [ ! -f "$file" ]; then
        touch "$file"
        log_success "Created $file"
    fi

    if ! grep -Fxq "$BREW_ENV_LINE" "$file"; then
        echo "$BREW_ENV_LINE" >> "$file"
        log_success "Added Homebrew setup line to $file"
    fi
done

# Source zshrc
if [ -f "./.zshrc" ]; then
    # shellcheck disable=SC1090
    source "./.zshrc"
    log_success "Sourced ./.zshrc"
fi

# Install Python + IPython via Homebrew and ipykernel via pip
log_info "Installing Python and Jupyter kernel tools..."
brew install python ipython
if command -v pip3 >/dev/null 2>&1; then
    pip3 install ipykernel
    log_success "Installed ipykernel via pip3."
else
    log_error "pip3 not found. Python installation may have failed."
fi

log_success "macos.sh completed."
