#!/usr/bin/env bash

# ------------------------------------------------------------------------------
# Printer Functions
# ------------------------------------------------------------------------------
function print_fancy_message() {

  echo "$(tput setaf 6)" # Green
  echo "------------------------------------------------------------------------------"
  while [ "$1" != "" ]; do
    local MESSAGE=${1}
    echo "****** ${MESSAGE} ******"
    shift
  done
  echo "------------------------------------------------------------------------------$(tput sgr0)"
}

function print_notice_message() {
  local MESSAGE=${1}
  print_message 4 "☑️  ${MESSAGE}"
}

function print_error_message() {
  local MESSAGE=${1}
  print_message 1 "❌  ${MESSAGE}"
}

function print_success_message() {
  local MESSAGE=${1}
  print_message 2 "✅  ${MESSAGE}"
}

function print_message() {
  local COLOR=${1}
  local MESSAGE=${2}

  echo "$(tput setaf ${COLOR}) ${MESSAGE} $(tput sgr0)"
}
