#!/bin/bash

set -x

mkdir ~/src

git clone git@bitbucket.org:tiziano88/dotfiles.git ~/dotfiles

# git clone git@github.com:zsh-users/zsh-syntax-highlighting.git
# git clone git@github.com:nojhan/liquidprompt.git

git clone git@github.com:gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#git clone git@github.com:tmux-plugins/tpm ~/.tmux/plugins/tpm

#git clone git@github.com:Anthony25/gnome-terminal-colors-solarized.git ~/gnome-terminal-colors-solarized

git clone git@github.com:junegunn/fzf.git ~/src/fzf

git clone git@github.com:github/hub.git ~/src/hub

#git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting

#git clone git@github.com:tarruda/zsh-autosuggestions.git ~/.zsh-autosuggestions

#git clone git@github.com:ingydotnet/git-hub.git ~/git-hub

# wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

# cat ~/.ssh/id_rsa.pub | ssh user@123.45.56.78 "cat >> ~/.ssh/authorized_keys"

# Edit /usr/sbin/lightdm-session and remove '-nocpp'.
# setxkbmap -v gb

git clone git@github.com:tmux/tmux.git ~/src/tmux
