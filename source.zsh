# If not running interactively, don't do anything
[ -z "$PS1" ] && return

DOTFILES_DIR="$HOME/dotfiles"

source "$DOTFILES_DIR/bin/printers.zsh"

source "$DOTFILES_DIR/profile/theme.zsh"
source "$DOTFILES_DIR/profile/alias.zsh"
source "$DOTFILES_DIR/profile/function.zsh"

# Export
export DOTFILES_DIR
