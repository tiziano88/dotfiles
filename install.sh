#!/bin/sh

# to install:
# atool
# git
# go
# gvim
# htop
# keychain
# mutt
# ntfs-3g
# parcellite
# parted
# python
# stow
# sudo
# tmux
# zsh

# git clone git@bitbucket.org:tiziano88/dotfiles.git
# git clone git@github.com:zsh-users/zsh-syntax-highlighting.git
# git clone git@github.com:nojhan/liquidprompt.git
# git clone git@github.com:gmarik/Vundle.vim.git ~/.vim/bundle/vundle

set -x
stow -v -d ~/dotfiles common
