#!/bin/bash

set -x

# to install:
SOFTWARE=(
  ack-grep
  atool
  automake
  build-essential
  cabal-install
  cmake
  git
  golang
  htop
  keychain
  moreutils
  mosh
  mutt
  pandoc
  pass
  python
  python-dev
  rlwrap
  silversearcher-ag
  stow
  sudo
  task
  tig
  tmux
  tree
  urlview
  vim
  zsh
)

sudo apt-get install "${SOFTWARE[@]}"

mkdir ~/src

# git clone git@bitbucket.org:tiziano88/dotfiles.git
# git clone git@github.com:zsh-users/zsh-syntax-highlighting.git
# git clone git@github.com:nojhan/liquidprompt.git
git clone git@github.com:gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone git@github.com:tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone git@github.com:Anthony25/gnome-terminal-colors-solarized.git ~/gnome-terminal-colors-solarized

git clone git@github.com:junegunn/fzf.git ~/fzf

git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting

git clone git@github.com:tarruda/zsh-autosuggestions.git ~/.zsh-autosuggestions

git clone git@github.com:ingydotnet/git-hub.git ~/git-hub

# wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

# cat ~/.ssh/id_rsa.pub | ssh user@123.45.56.78 "cat >> ~/.ssh/authorized_keys"

# Edit /usr/sbin/lightdm-session and remove '-nocpp'.
# setxkbmap -v gb

GO_PACKAGES=(
  code.google.com/p/go.tools/cmd/goimports
  code.google.com/p/go.tools/cmd/oracle
  github.com/golang/lint/golint
  github.com/jstemmer/gotags
  github.com/nsf/gocode
  github.com/peco/peco/cmd/peco
)

go get "${GO_PACKAGES[@]}"
