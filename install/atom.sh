ATOM_DIR="$HOME/.atom"
DOTFILES_DIR="$HOME/dotfiles"

# Install Atom application
brew install Caskroom/cask/atom

# Checkout and setup Atom config directory, or update if it already exists
if [[ -d "$DOTFILES_DIR/external/.atom" ]]; then
    git --work-tree="$DOTFILES_DIR/external/.atom" --git-dir="$DOTFILES_DIR/external/.atom/.git" pull origin master
else
    git clone https://github.com/ryanboswell/.atom.git $DOTFILES_DIR/external/.atom
fi

# Alias Atom config directory, if it's there
if [[ -d "$DOTFILES_DIR/external/.atom" ]]; then
    for file in "init.coffee keymap.cson snippets.cson styles.less";
        do ln -s $ATOM_DIR/$file $DOTFILES_DIR/external/.atom;
    done
fi


# Install with apm

packages=(
  autocomplete-emojis
  autocomplete-wordpress-hooks
  editorconfig
  emmet
  gist-it
  greti-syntax
  pretty-json
  seti-syntax
  seti-ui
)

apm install "${packages[@]}"
