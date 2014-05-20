#!/bin/sh

# to install:
SOFTWARE=(
  atool
  cmake
  git
  go
  gvim
  htop
  keychain
  mutt
  ntfs-3g
  parcellite
  parted
  python
  rxvt-unicode
  stow
  sudo
  tmux
  xfonts-terminus
  xfonts-terminus-oblique
  zsh
)

for i in "${SOFTWARE[@]}"
do
  sudo apt-get install $i
done

# git clone git@bitbucket.org:tiziano88/dotfiles.git
# git clone git@github.com:zsh-users/zsh-syntax-highlighting.git
# git clone git@github.com:nojhan/liquidprompt.git
# git clone git@github.com:gmarik/Vundle.vim.git ~/.vim/bundle/vundle

# wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

# cat ~/.ssh/id_rsa.pub | ssh user@123.45.56.78 "cat >> ~/.ssh/authorized_keys"
