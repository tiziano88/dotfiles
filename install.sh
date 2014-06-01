#!/bin/sh

set -x
stow -v -d ~/dotfiles -t ~ common
touch ~/.Xdefaults_local
