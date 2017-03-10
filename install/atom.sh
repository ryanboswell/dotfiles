brew install atom

# Alias Atom config directory, if it's there
[ -d "$DOTFILES_DIR/runcom/.atom" ] && ln -sfv "$DOTFILES_DIR/runcom/.atom" ~
