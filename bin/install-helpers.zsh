#!/usr/bin/env bash

# ------------------------------------------------------------------------------
# Helper functions
# ------------------------------------------------------------------------------

function _update_dotfiles() {
  if [ -d ".git" ]; then
    print_fancy_message "Updating Dotfiles"
    git --git-dir=".git" pull origin master
  fi
}

function _symlink_dotfiles() {
  print_fancy_message "Symlinking system .dotfiles"
  cd ./runcom
  for file in .* *;
  do
    [ -f "$file" ] && print_success_message "symlinked [./runcom/$file]" && ln -sf "$file" ~
  done
  cd ..
}

function _source_bash_profile() {
  print_fancy_message "Sourcing bash_profile"

  if [ ! -f "$HOME/.bash_profile" ]; then
    print_notice_message "creating empty [~/.bash_profile]"
    touch $HOME/.bash_profile
  fi

  grep -qi "dotfiles/.bash_profile" ~/.bash_profile
  if [ $? -gt 0 ]; then
    echo "source $DOTFILES_DIR/.bash_profile" >> ~/.bash_profile
    print_success_message "[./bash_profile] sourced"
  else
    print_notice_message "[./bash_profile] already sourced"
  fi
}
