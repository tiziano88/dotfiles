# vim: ft=zsh

source_() {
  [[ -f $1 ]] && source $1
}

source ~/.aliases
source ~/.env

source_ ~/.google.sh

# ^ in glob negates pattern following it
setopt extendedglob

autoload -U colors
colors
setopt prompt_subst

setopt share_history
setopt inc_append_history
HISTSIZE=1000000
if (( ! EUID )); then
  HISTFILE=~/.history_root
else
  HISTFILE=~/.history
fi
SAVEHIST=$HISTSIZE

# liquidprompt
# git clone https://github.com/nojhan/liquidprompt.git
source ~/liquidprompt/liquidprompt

source_ ~/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# git
fpath=(~/.zsh $fpath)

# Customize to your needs...
# export PATH=/home/tzn/bin:/home/tzn/bin:/usr/local/buildtools/java/jdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
# take the first part of the path to be exact
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' hosts off
setopt NO_CDABLE_VARS

# http://stackoverflow.com/a/844299
expand-or-complete-with-dots() {
  echo -n "\e[31m...\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

skip_global_compinit=1

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# shopt -s checkwinsize

# fileutil autocompletion
# source_ /home/miotov/.bash_fileutil_autocomplete

set -o vi

# Timeout for escape sequences, in 0.01 seconds.
# http://dougblack.io/words/zsh-vi-mode.html
export KEYTIMEOUT=1

# Mode indicator.
# http://dougblack.io/words/zsh-vi-mode.html
function zle-line-init zle-keymap-select {
  typeset -A namemap
  namemap=(
    main INSERT
    vicmd NORMAL
  )
  typeset -A colormap
  colormap=(
    main ${bg[yellow]}${fg[white]}
    vicmd ${bg[red]}${fg[white]}
  )
  VIM_PROMPT="%{${colormap[$KEYMAP]}%}${namemap[$KEYMAP]}%{$reset_color%}"
  RPS1="$VIM_PROMPT $EPS1"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

#bindkey '\e[A' history-search-backward
#bindkey '\e[B' history-search-forward
bindkey '\e[A' up-line-or-search
bindkey '\e[B' down-line-or-search
set show-all-if-ambiguous on
set completion-ignore-case on

# bindkey '^V' paste-from-clipboard
bindkey '^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line
bindkey -M vicmd '^[h' run-help
bindkey -M viins '^[h' run-help
#bindkey -M viins '^p'  up-line-or-history
#bindkey -M viins '^n'  down-line-or-history
bindkey -M viins '^w'  backward-kill-word
bindkey -M viins '^h'  backward-delete-char
bindkey -M viins '^?'  backward-delete-char

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

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

#export PROMPT="%{%f%b%k%}$(build_prompt) "
export PROMPT='%n@%{$fg[blue]%}%m%{$reset_color%} %D{%Y-%m-%dT%H:%M} %{$fg[yellow]%}%~%{$reset_color%}$(__git_ps1) %(1j.[%j] .)%# '

#gpg-agent --daemon --enable-ssh-support --write-env-file "${HOME}/.gpg-agent-info"
eval $(keychain --eval)
eval $(dircolors ~/.dir_colors)
