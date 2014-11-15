#!/bin/bash

set -x

# to install:
SOFTWARE=(
  ack-grep
  atool
  build-essential
  cmake
  fonts-ubuntu-font-family-console
  git
  golang
  vim
  htop
  keychain
  mercurial
  mutt
  ntfs-3g
  pandoc
  parcellite
  parted
  python
  python-dev
  rlwrap
  rxvt-unicode
  sgt-puzzles
  stow
  sudo
  task
  tig
  tree
  tmux
  xdotool
  xfonts-terminus
  xfonts-terminus-oblique
  xmobar
  xmonad
  zsh
)

sudo apt-get install "${SOFTWARE[@]}"

# git clone git@bitbucket.org:tiziano88/dotfiles.git
# git clone git@github.com:zsh-users/zsh-syntax-highlighting.git
# git clone git@github.com:nojhan/liquidprompt.git
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

# cat ~/.ssh/id_rsa.pub | ssh user@123.45.56.78 "cat >> ~/.ssh/authorized_keys"

# Edit /usr/sbin/lightdm-session and remove '-nocpp'.
# setxkbmap -v gb

GO_PACKAGES=(
  code.google.com/p/go.tools/cmd/goimports
  code.google.com/p/go.tools/cmd/oracle
  github.com/golang/lint/golint
  github.com/nsf/gocode
)

# go get -u "${GO_PACKAGES[@]}"
