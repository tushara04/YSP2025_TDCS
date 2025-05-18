#!/usr/bin/env bash

# Credits: Mathias Bynens (https://mths.be/macos)

# Close any open System Preferences panes to prevent them from overriding settings
osascript -e 'Tell Application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` timestamp until this script finishes
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

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

# Ensure zsh config files have Homebrew env setup
BREW_ENV_LINE='eval "$(/opt/homebrew/bin/brew shellenv)"'

for file in "./.zshrc" "./.zshenv"; do
  if [ ! -f "$file" ]; then
    touch "$file"
    echo "[INFO] Created $file"
  fi

  if ! grep -Fxq "$BREW_ENV_LINE" "$file"; then
    echo "$BREW_ENV_LINE" >> "$file"
    echo "[INFO] Added Homebrew setup line to $file"
  fi
done

# Source ~/.zshrc to make brew immediately available in this shell
if [ -f "./.zshrc" ]; then
  # shellcheck disable=SC1090
  source "./.zshrc"
  echo "[INFO] Sourced ./.zshrc"
fi

# Install ipython and ipykernel using brew
echo '[INFO] Installing ipython and ipykernel using brew...'
brew install ipython ipykernel

echo '[SUCCESS] macos.sh completed.'
