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
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git vi-mode)

source_() {
  [[ -f $1 ]] && source $1
}

#source $ZSH/oh-my-zsh.sh
#source $HOME/src/powerline/powerline/bindings/zsh/powerline.zsh

prompt_git() {
  local ref dirty
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
#    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"

#    if [[ -n $dirty ]]; then
#      prompt_segment yellow black
#    else
#      prompt_segment green black
#    fi

    setopt promptsubst
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr '✚'
    zstyle ':vcs_info:git:*' unstagedstr '●'
    zstyle ':vcs_info:*' formats ' %u%c'
    zstyle ':vcs_info:*' actionformats '%u%c'
    vcs_info
    echo -n "${ref/refs\/heads\// }${vcs_info_msg_0_}"
  fi
}

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}

autoload -U colors && colors

source_ /usr/local/etc/bash_completion.d/git-prompt.sh
source_ /usr/local/etc/bash_completion.d/git-completion.bash
source_ /usr/local/etc/bash_completion.d/go-completion.bash
source_ /usr/local/etc/bash_completion.d/tmux

source_ ~/.git-prompt.sh

#export PROMPT="%{%f%b%k%}$(build_prompt) "
export PROMPT="%n@%{$fg[blue]%}%m%{$reset_color%} %DT%T %{$fg[yellow]%}%~%{$reset_color%}$(__git_ps1) %# "

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

skip_global_compinit=1

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

source ~/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

gpg-agent --daemon --enable-ssh-support --write-env-file "${HOME}/.gpg-agent-info"
