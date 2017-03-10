# If not running interactively, don't do anything

[ -z "$PS1" ] && return

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)

READLINK=$(which greadlink || which readlink)
CURRENT_SCRIPT=$BASH_SOURCE

if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
  SCRIPT_PATH=$($READLINK -f "$CURRENT_SCRIPT")
  DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")
elif [ -d "$HOME/.dotfiles" ]; then
  DOTFILES_DIR="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return # `exit 1` would quit the shell itself
fi


# Powerline JS

function _update_ps1() {
   export PS1="$($DOTFILES_DIR/external/powerline-js/powerline.js $? --shell bash --depth 2)"
}
export PROMPT_COMMAND="_update_ps1"


# Finally we can source the dotfiles (order matters)

for DOTFILE in "$DOTFILES_DIR"/{system/.function,system/.alias,sm/.function,sm/.alias}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

# Clean up

unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE

# Export

export DOTFILES_DIR EXTRA_DIR
