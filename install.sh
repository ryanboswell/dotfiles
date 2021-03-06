#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$DOTFILES_DIR/bin/printers.sh"
source "$DOTFILES_DIR/bin/install-helpers.sh"

print_fancy_message "Installing dotfiles"

# Update dotfiles itself first
_update_dotfiles
_source_bash_profile
_symlink_dotfiles

# External Dependencies
_install_external fonts https://github.com/powerline/fonts
