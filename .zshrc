# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
#ZSH_THEME="blinks"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode)

source_() {
  [[ -f $1 ]] && source $1
}

source $ZSH/oh-my-zsh.sh
#source $HOME/src/powerline/powerline/bindings/zsh/powerline.zsh

# citc
source_ /etc/bash_completion.d/g4d

# Customize to your needs...
# export PATH=/home/tzn/bin:/home/tzn/bin:/usr/local/buildtools/java/jdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
# take the first part of the path to be exact
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' hosts off
setopt NO_CDABLE_VARS

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# shopt -s checkwinsize

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
source_ ~/.aliases
source_ ~/.env


# blaze autocompletion
source_ /home/build/nonconf/google3/devtools/blaze/scripts/blaze-complete.bash

# Set git autocompletion and PS1 integration
source_ /usr/local/git/contrib/completion/git-completion.bash
source_ /opt/local/etc/bash_completion

#source_ /home/build/google3/devtools/blaze/scripts/blaze-complete.bash
#source_ /home/build/google3/ads/branding/adplanner/git5/git5_completion.sh

set -o vi
bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
set show-all-if-ambiguous on
set completion-ignore-case on

bindkey '^V' paste-from-clipboard
bindkey '^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line
bindkey -M vicmd '^[h' run-help
bindkey -M viins '^[h' run-help
bindkey -M viins '^p'  up-line-or-history
bindkey -M viins '^n'  down-line-or-history
bindkey -M viins '^w'  backward-kill-word
bindkey -M viins '^h'  backward-delete-char
bindkey -M viins '^?'  backward-delete-char

function tmux_has_main() {
  tmux -2 has-session -t "main"
}

function tmux_init_main() {
  tmux -2 new-session -d -s "main" -n "misc"
}

if [[ "$TERM" != "screen" ]] && [[ "$TMUX" == "" ]]
then
   # try to attach to existing session, or start a new one
   # tmux attach-session -t "$USER" || tmux -2 new-session -s "$USER"
   # session_id=`date +%Y%m%d%H%M%S`
   #tmux_has_main || tmux_init_main
   #tmux -2 attach-session -t "main"
   # ( tmux new-session -d -s $session_id -t "$USER" && tmux attach-session -t $session_id && tmux kill-session -t $session_id ) || tmux -2 new-session -s "$USER"
#   exit

  mux default
fi

export COMPLETION_WAITING_DOTS="true"

source ~/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

