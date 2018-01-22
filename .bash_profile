# If not running interactively, don't do anything
[ -z "$PS1" ] && return

DOTFILES_DIR="$HOME/dotfiles"

source "$DOTFILES_DIR/bin/printers.sh"
source "$DOTFILES_DIR/bin/helpers.sh"

# Powerline JS
export PROMPT_COMMAND="_update_ps1"

# Finally we can source the dotfiles
_source_bash_profile_components bash_profile
_source_bash_profile_components sm

# Clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE

# Export
export DOTFILES_DIR EXTRA_DIR
