#!/bin/bash

set -x
stow --verbose --dir="${HOME}/dotfiles" --target="${HOME}" common
touch ~/.Xdefaults_local
mkdir -p ~/Mail/tzn@google.com/{alias,cache/{headers,bodies},certificates,mailcap,temp}
mkdir -p ~/Mail/tiziano88@gmail.com/{alias,cache/{headers,bodies},certificates,mailcap,temp}

# http://askubuntu.com/questions/243639/ctrlspace-has-been-bound-to-invoke-some-input-method-and-does-not-work-in-ema
gsettings set org.freedesktop.ibus.general.hotkey triggers '[]'
