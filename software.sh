#!/bin/bash

set -x

# to install:
SOFTWARE=(
  ack-grep
  atool
  build-essential
  cabal-install
  cmake
  colortest
  fonts-mplus
  fonts-ubuntu-font-family-console
  git
  golang
  vim
  htop
  keychain
  mercurial
  moreutils
  mosh
  mutt
  ntfs-3g
  pandoc
  parcellite
  parted
  pass
  pwgen
  python
  python-dev
  rlwrap
  ruby-sass
  rxvt-unicode
  silversearcher-ag
  sgt-puzzles
  stow
  sudo
  task
  tig
  tree
  tmux
  urlview
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
git clone git@github.com:gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone git@github.com:tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone git@github.com:clvv/fasd ~/fasd

git clone git@github.com:rupa/z.git ~/z

git clone git@github.com:Anthony25/gnome-terminal-colors-solarized.git ~/gnome-terminal-colors-solarized

git clone git@github.com:mooz/percol.git ~/percol

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
