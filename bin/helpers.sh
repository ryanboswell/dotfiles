#!/usr/bin/env bash

# ------------------------------------------------------------------------------
# Helper functions
# ------------------------------------------------------------------------------

function _source_bash_profile_components() {
  local DIR=${1}
  CWD="$( pwd )"
  cd "$DOTFILES_DIR/$DIR"
  for file in .* *.sh; do
    [ -f "$file" ] && . "$DOTFILES_DIR/$DIR/$file"
  done
  cd $CWD
}

function _update_ps1() {
   export PS1="$($DOTFILES_DIR/external/powerline-js/powerline.js $? --shell bash --depth 2)"
}
