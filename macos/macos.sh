#!/usr/bin/env bash

# Ensure Homebrew is in PATH for Apple Silicon or Intel Macs
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

# Install ipython and ipykernel using pip3
if command -v pip3 >/dev/null 2>&1; then
    echo '[INFO] Installing ipython and ipykernel using pip3...'
    pip3 install --user ipython ipykernel
else
    echo '[ERROR] pip3 not found. Please install Python 3 first.'
    exit 1
fi

echo '[SUCCESS] macos.sh completed.'
