#!/bin/sh

set -x

# to install:
SOFTWARE=(
  atool
  build-essential
  cmake
  git
  golang
  vim
  htop
  keychain
  mutt
  ntfs-3g
  parcellite
  parted
  python
  python-dev
  rlwrap
  rxvt-unicode
  stow
  sudo
  tmux
  xfonts-terminus
  xfonts-terminus-oblique
  zsh
)

sudo apt-get install "${SOFTWARE[@]}"

# git clone git@bitbucket.org:tiziano88/dotfiles.git
# git clone git@github.com:zsh-users/zsh-syntax-highlighting.git
# git clone git@github.com:nojhan/liquidprompt.git
# git clone git@github.com:gmarik/Vundle.vim.git ~/.vim/bundle/vundle

# wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

# cat ~/.ssh/id_rsa.pub | ssh user@123.45.56.78 "cat >> ~/.ssh/authorized_keys"
