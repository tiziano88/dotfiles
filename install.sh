#!/bin/bash

set -x
stow --verbose --dir="${HOME}/dotfiles" --target="${HOME}" common
touch ~/.Xdefaults_local
mkdir -p ~/Mail/tzn@google.com/{alias,cache/{headers,bodies},certificates,mailcap,temp}
mkdir -p ~/Mail/tiziano88@gmail.com/{alias,cache/{headers,bodies},certificates,mailcap,temp}
