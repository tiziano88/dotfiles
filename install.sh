#!/bin/sh

set -x
stow -v -d ~/dotfiles -t ~ common
touch ~/.Xdefaults_local
mkdir -p ~/Mail/tzn@google.com/{alias,cache/{headers,bodies},certificates,mailcap,temp}
mkdir -p ~/Mail/tiziano88@gmail.com/{alias,cache/{headers,bodies},certificates,mailcap,temp}
