#!/usr/bin/env bash

# Close any open System Preferences panes to prevent them from overriding settings
osascript -e 'Tell Application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` timestamp until this script finishes
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Detect architecture and add Homebrew to PATH
if [ -d /opt/homebrew/bin ]; then
    export PATH="/opt/homebrew/bin:$PATH"
    echo '[INFO] Added /opt/homebrew/bin to PATH (Apple Silicon).'
elif [ -d /usr/local/bin ]; then
    export PATH="/usr/local/bin:$PATH"
    echo '[INFO] Added /usr/local/bin to PATH (Intel).'
else
    echo '[ERROR] Homebrew not found in standard locations.'
    exit 1
fi

# Check if Homebrew is available
if ! command -v brew >/dev/null 2>&1; then
    echo '[ERROR] brew not found in PATH.'
    exit 1
fi

echo "[INFO] Using Homebrew at: $(which brew)"
brew --version

# Set Homebrew shellenv line
BREW_ENV_LINE='eval "$(/opt/homebrew/bin/brew shellenv)"'
USER_HOME=$(eval echo ~"$SUDO_USER")

for file in ".zshrc" ".zprofile" ".zshenv"; do
    full_path="$USER_HOME/$file"
    if [ ! -f "$full_path" ]; then
        touch "$full_path" || { echo "[ERROR] Could not create $full_path"; continue; }
        echo "[INFO] Created $full_path"
    fi

    if ! grep -Fxq "$BREW_ENV_LINE" "$full_path"; then
        echo "$BREW_ENV_LINE" >> "$full_path" || echo "[ERROR] Failed to write to $full_path"
        echo "[INFO] Added Homebrew setup line to $full_path"
    fi
done

# Try to source user's zshrc if it exists
if [ -f "$USER_HOME/.zshrc" ]; then
    # shellcheck disable=SC1090
    source "$USER_HOME/.zshrc"
    echo "[INFO] Sourced $USER_HOME/.zshrc"
fi

# Install ipython and ipykernel using pip3
if command -v pip3 >/dev/null 2>&1; then
    echo '[INFO] Installing ipython and ipykernel using pip3...'
    pip3 install --user ipython ipykernel
else
    echo '[ERROR] pip3 not found. Please install Python 3 first.'
    exit 1
fi

echo '[SUCCESS] macos.sh completed.'
