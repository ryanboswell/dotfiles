# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on systems without readlink and/or $BASH_SOURCE/$0)
READLINK=$(which greadlink || which readlink)
CURRENT_SCRIPT=$BASH_SOURCE

if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
  SCRIPT_PATH=$($READLINK -f "$CURRENT_SCRIPT")
  DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")
elif [ -d "$HOME/.dotfiles" ]; then
  DOTFILES_DIR="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return
fi

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
