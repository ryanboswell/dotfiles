#!/usr/bin/env bash

# ------------------------------------------------------------------------------
# Helper functions
# ------------------------------------------------------------------------------

function _source_bash_profile_components() {
  CWD="$( pwd )"
  cd "$DOTFILES_DIR/bash_profile"
  for file in .* *; do
    [ -f "$file" ] && . "$file"
  done
  cd $CWD
}

function _update_ps1() {
   export PS1="$($DOTFILES_DIR/external/powerline-js/powerline.js $? --shell bash --depth 2)"
}
