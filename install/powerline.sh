DOTFILES_DIR="$HOME/dotfiles"

# Checkout and setup Powerline JS, or update if it already exists
if [[ -d "$DOTFILES_DIR/external/powerline-js" ]]; then
    git --work-tree="$DOTFILES_DIR/external/powerline-js" --git-dir="$DOTFILES_DIR/external/powerline-js/.git" pull origin master
else
    git clone https://github.com/ryanboswell/powerline-js.git $DOTFILES_DIR/external/powerline-js
fi
