DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Checkout and setup Fonts directory, or update if it already exists
if [[ -d "$DOTFILES_DIR/external/fonts" ]]; then
    git --work-tree="$DOTFILES_DIR/external/fonts" --git-dir="$DOTFILES_DIR/external/fonts/.git" pull origin master
else
    git clone https://github.com/powerline/fonts.git $DOTFILES_DIR/external/fonts
fi

# Run fonts included install routine
. "$DOTFILES_DIR/external/fonts/install.sh"
