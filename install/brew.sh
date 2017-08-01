# Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/versions
brew tap homebrew/dupes
brew tap Goles/battery
brew tap caskroom/cask
brew update
brew upgrade

# Install packages

apps=(
  bash-completion2
  bats
  battery
  composer
  coreutils
  dockutil
  ffmpeg
  fasd
  findutils
  gawk
  gifsicle
  git
  git-extras
  gnutls
  gnu-indent
  gnu-getopt
  gnu-sed --with-default-names
  gnu-tar
  grep --with-default-names
  hub
  httpie
  hyper
  imagemagick
  jq
  mackup
  peco
  psgrep
  python
  shellcheck
  ssh-copy-id
  tree
  vim
  wget
  wifi-password
)

brew install "${apps[@]}"


# Install macOS applications

cask_apps=(
  atom
  docker
  docker-toolbox
  firefox
  google-chrome
  istat-menus
  iterm2
  keepingyouawake
  postman
  slack
  sourcetree
  spotify
  transmit
  vlc
)

brew cask install "${cask_apps[@]}"
