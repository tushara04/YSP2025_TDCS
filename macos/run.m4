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
}

setup_environment_and_shell() {
    echo -e "${YELLOW}[INFO] Installing packages from Brewfile...${NC}"
    brew bundle --file ./Brewfile
    log_success "Brew packages installed."
}
# Applies user-preferred configurations and settings to MacOS.
function apply_macos_configurations() {
    # Set macOS preferences - we will run this last because this will reload the shell
    echo -e "\\n${YELLOW}[INFO] Applying MacOS configurations...${NC}"

    source "$DIR/macos.sh"
    log_success "MacOS configurations applied."
}

# Check the provided options and perform the corresponding actions
if [ "$flag_update" = on ]; then
    setup_environment_and_shell
elif [ "$flag_config" = on ]; then
    apply_macos_configurations
elif [ "$flag_install" = on ]; then
    install_core_dependencies
    setup_environment_and_shell
    apply_macos_configurations
else
    # Same behaviour as `$flag_install` now; can be extended later
    install_core_dependencies
    setup_environment_and_shell
    apply_macos_configurations
fi

# ] <-- needed because of Argbash
