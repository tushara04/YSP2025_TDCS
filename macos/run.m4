#!/usr/bin/env bash

# ARG_OPTIONAL_BOOLEAN([install], [i], [Perform a fresh installation. This is the default behavior.], [on])
# ARG_OPTIONAL_BOOLEAN([update], [u], [Update the installed tools and applications.])
# ARG_OPTIONAL_BOOLEAN([configure-os], [c], [Reconfigure the operating system settings.])
# ARG_HELP([This script automates the setup of a MacOS environment. It installs core dependencies, tools, and system configurations.])
# ARGBASH_GO

# [ <-- needed because of Argbash

declare _arg_install
declare _arg_update
declare _arg_configure_os

flag_install=$_arg_install
flag_update=$_arg_update
flag_config=$_arg_configure_os

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info() {
    echo -e "${YELLOW}[INFO] $1${NC}"
}

log_success() {
    echo -e "${GREEN}[SUCCESS] $1${NC}"
}

install_core_dependencies() {
    log_info "Setting up core dependencies..."

    if ! type -a xcode-select > /dev/null 2>&1; then
        log_info "Installing Xcode Command Line Tools..."
        xcode-select --install &>/dev/null
        until xcode-select -p &>/dev/null; do sleep 5; done
        log_success "Xcode installed."
    fi

    if ! type -a brew > /dev/null 2>&1; then
        log_info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv)"
        log_success "Homebrew installed."
    fi

    log_info "Updating and upgrading Homebrew..."
    brew update && brew upgrade

    log_info "Installing and starting Docker..."
    brew install --cask docker
    open /Applications/Docker.app
    until docker stats --no-stream &> /dev/null; do
        echo -e "${YELLOW}[INFO] Waiting for Docker to launch...${NC}"
        sleep 5
    done
    log_success "Docker is running."

    log_info "Creating working directory and config folders..."
    mkdir -p "$HOME/Documents/wd"
    ln -sfn "$HOME/Documents/wd" "$HOME/wd"
    mkdir -p "$HOME/.gnupg" "$HOME/.config/spicetify"
    log_success "Directories ready."
}

setup_environment_and_shell() {
    echo -e "${YELLOW}[INFO] Installing packages from Brewfile...${NC}"
    brew tap homebrew/bundle
    brew bundle --file ./Brewfile
    log_success "Brew packages installed."

    # Restart launchd services for tools like sketchybar/yabai/skhd if needed
    yabai --restart-service
    skhd --restart-service
    log_success "Shell environment ready."
}

apply_macos_configurations() {
    echo -e "${YELLOW}[INFO] Applying macOS configurations...${NC}"
    source "$DIR/macos.sh"
    log_success "macOS configuration applied."
}

if [ "$flag_update" = on ]; then
    setup_environment_and_shell
elif [ "$flag_config" = on ]; then
    apply_macos_configurations
elif [ "$flag_install" = on ]; then
    install_core_dependencies
    setup_environment_and_shell
    apply_macos_configurations
else
    install_core_dependencies
    setup_environment_and_shell
    apply_macos_configurations
fi

# ] <-- needed because of Argbash
