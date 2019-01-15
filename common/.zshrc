#!/bin/zsh

# vim: ft=zsh

# https://github.com/changs/slimzsh

# http://www.zzapper.co.uk/zshtips.html

function exists {
  which $1 &> /dev/null
}

source_() {
  [[ -f $1 ]] && source $1
}

source_ ~/.aliases
source_ ~/.env

source_ ~/.google.sh
source_ ~/git-hub/init
source_ ~/.nix-profile/etc/profile.d/nix.sh
source_ ~/.cargo/env
source_ ~/google-cloud-sdk/path.zsh.inc
source_ ~/google-cloud-sdk/completion.zsh.inc

# http://kubernetes.io/docs/user-guide/kubectl-cheatsheet/
source <(kubectl completion zsh)

# ^ in glob negates pattern following it

# Disable C-s for flow control (C-q to resume).
# See http://unix.stackexchange.com/questions/72086/ctrl-s-hang-terminal-emulator.
stty -ixon

# Options
# see `man zshoptions`

# Changing Directories
setopt AUTO_CD
setopt AUTO_PUSHD
unsetopt CDABLE_VARS
unsetopt CHASE_DOTS
unsetopt CHASE_LINKS
unsetopt POSIX_CD
setopt PUSHD_IGNORE_DUPS
unsetopt PUSHD_MINUS
unsetopt PUSHD_SILENT
unsetopt PUSHD_TO_HOME

# Completion
setopt ALWAYS_LAST_PROMPT
unsetopt ALWAYS_TO_END
setopt AUTO_LIST
setopt AUTO_MENU
unsetopt AUTO_NAME_DIRS
setopt AUTO_PARAM_KEYS
setopt AUTO_PARAM_SLASH
setopt AUTO_REMOVE_SLASH
unsetopt BASH_AUTO_LIST
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD
setopt GLOB_COMPLETE
setopt HASH_LIST_ALL
setopt LIST_AMBIGUOUS
setopt LIST_BEEP
setopt LIST_BEEP
unsetopt LIST_PACKED
unsetopt LIST_ROWS_FIRST
setopt LIST_TYPES
unsetopt MENU_COMPLETE
unsetopt REC_EXACT

# Expansion and Globbing

# History

setopt APPEND_HISTORY
unsetopt BANG_HIST
unsetopt EXTENDED_HISTORY # Timestamp in history.
setopt HIST_FIND_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FCNTL_LOCK
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS # Only previous entry.
setopt HIST_IGNORE_ALL_DUPS # Even if not previous entry.
setopt HIST_IGNORE_SPACE
setopt HIST_NO_FUNCTIONS
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_BY_COPY
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY # Edit history line on enter.
unsetopt INC_APPEND_HISTORY # Unset if SHARE_HISTORY is set.
setopt INC_APPEND_HISTORY_TIME
setopt SHARE_HISTORY

###

unsetopt PROMPT_SUBST
unsetopt CDABLE_VARS
unsetopt CASE_GLOB

# Good stuff but conflicts with fzf.
unsetopt EXTENDED_GLOB

setopt INTERACTIVE_COMMENTS

HISTSIZE=1000000000
if (( ! EUID )); then
  HISTFILE=~/.history_root
else
  HISTFILE=~/.history
fi
SAVEHIST=$HISTSIZE

autoload -U colors && colors
#export PROMPT="%{%f%b%k%}$(build_prompt) "
export PROMPT="%n@%{$fg[blue]%}%m%{$reset_color%} %D{%Y-%m-%dT%H:%M} %{$fg[yellow]%}%~%{$reset_color%} %(1j.[%j] .)%#> "

# liquidprompt
source ~/src/liquidprompt/liquidprompt

# syntax highlighting
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='underline'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=blue'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=blue'
source ~/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# git
#fpath=(~/.zsh $fpath)

zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path ~/.zsh/cache
# take the first part of the path to be exact
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' hosts false

# see http://en.wikipedia.org/wiki/ANSI_escape_code
# zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#b)($PREFIX:t)*==7}:${(s/:/)LS_COLORS}")';

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:corrections' format '%U%B%d%b (errors %e)%u'
zstyle ':completion:*:warnings' format '%Bno matches for: %d%b'
zstyle ':completion:*' verbose true

# For man pages.
zstyle ':completion:*' separate-sections true

# http://stackoverflow.com/a/844299
expand-or-complete-with-dots() {
  echo -n "\e[31m...\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey '^I' expand-or-complete-with-dots
bindkey '^_' undo

autoload -U compinit && compinit
# autoload -U predict-on && predict-on

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# shopt -s checkwinsize

# fileutil autocompletion
# source_ /home/miotov/.bash_fileutil_autocomplete

set -o vi

# Timeout for escape sequences, in 0.01 seconds.
# http://dougblack.io/words/zsh-vi-mode.html
export KEYTIMEOUT=1

# Do not eat the space between tab completion and pipe.
export ZLE_SPACE_SUFFIX_CHARS=$'|'

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

# Clean up previous lines.
function zle-line-finish {
  VIM_PROMPT=""
  RPS1="$VIM_PROMPT $EPS1"
  zle reset-prompt
}

zle -N zle-line-finish

bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

#bindkey '\e[A' history-beginning-search-backward
#bindkey '\e[B' history-beginning-search-forward
bindkey '\e[A' up-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search

set show-all-if-ambiguous on
set completion-ignore-case on

# bindkey '^V' paste-from-clipboard
#bindkey '^[[7~' beginning-of-line
#bindkey '^[[8~' end-of-line
#bindkey -M vicmd '^[h' run-help
#bindkey -M viins '^[h' run-help
#bindkey -M viins '^p'  up-line-or-history
#bindkey -M viins '^n'  down-line-or-history
bindkey -M viins '^w'  backward-kill-word
bindkey -M viins '^h'  backward-delete-char
bindkey -M viins '^?'  backward-delete-char

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

function tmux_has_main() {
  tmux -2 has-session -t 'main'
}

function tmux_init_main() {
  tmux -2 new-session -d -s 'main' -n 'misc'
}

if [[ "$TERM" != 'screen' ]] && [[ "$TMUX" == '' ]]
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

function tmux-usurp() {
  # tmux-usurp
  #
  # Finds all other clients attached to the current session and puts them in
  # a sort of soft-detached state where they can trivially reattach.
  #
  # In particular, this makes it easy to attach from my laptop, soft-detach my
  # desktop's terminals so I can use all my screen real-estate, and then undo the
  # damage once I get back to my desk.

  if [[ -z "$TMUX" ]]; then
    echo 'Not running under tmux.' >&2
    exit 1
  fi

  # Grab information about our session & current client.
  SESSION_ID=$(tmux display-message -p '#{session_id}')
  SESSION_NAME=$(tmux display-message -p '#{session_name}')
  CLIENT_TTY=$(tmux display-message -p '#{client_tty}')

  for client in $(tmux list-clients -t $SESSION_ID -F '#{client_tty}'); do
    if [[ "$client" != "$CLIENT_TTY" ]]; then

      # Build a new session to quick-reattach.
      # TODO(dhoover): maybe give the session a name to indicate what's going on
      #                and make it easier to filter from display?
      # TODO(dhoover): if the session goes away before the clients switch back,
      #                they just exit when they try to switch back. Is there
      #                anything friendlier to do there?
      new_session=$(unset TMUX ; tmux new-session -dP -F '#{session_id}' \
        "echo \"Hit enter to reattach to session '$SESSION_NAME'...\" \
        ; read \
        ; tmux switch-client -l \
        ")

      # Switch to it
      tmux switch-client -c "$client" -t "$new_session"
    fi
  done
}

eval $(dircolors ~/.dir_colors)

if exists sk; then
  function fuzzy_select_history() {
    # BUFFER=$(history 1 | sort --reverse --key=2 --unique | sort --reverse --numeric-sort | cut --characters=8- | sk --prompt='HISTORY>' | sed 's/\\n/\n/g')
    BUFFER=$(history 1 | cut --characters=8- | tac | awk '!seen[$0]++' | fgrep -v -f ~/.history_blacklist | sk --prompt='HISTORY>' --bind='del:execute(echo {} >> ~/.history_blacklist)' --query="$BUFFER" | sed 's/\\n/\n/g')
    CURSOR=$#BUFFER         # move cursor
    zle -R -c               # refresh
  }
  zle -N fuzzy_select_history
  bindkey '^R' fuzzy_select_history

  function fuzzy_clean_history() {
    set -x
    SELECTION=$(history 1 | sort --reverse --key=2 --unique | sort --reverse --numeric-sort | cut --characters=8- | sk --prompt='DELETE HISTORY>')
    sed -i "/;$SELECTION$/d" "$HISTFILE"
  }
  zle -N fuzzy_clean_history
  # bindkey '^T' fuzzy_clean_history

  function find_file() {
    # TODO: Use current prefix.
    # f="find . -not -path '*/\\.git/*'"
    f='rg -l .'
    # f='find .'
    RBUFFER=$(eval "$f" | sk --prompt='FILE>')
    CURSOR=$#BUFFER         # move cursor
    zle -R -c               # refresh
  }
  zle -N find_file
  bindkey '^P' find_file

  function change_dir() {
    # local dir=$(z -l | cut -c12- | sk --layout=bottom-up --prompt 'DIR>')
    local dir=$(dirs -p | uniq | sk --prompt='DIR>')
    cd "$dir"
    zle reset-prompt
  }
  zle -N change_dir
  bindkey '^O' change_dir

  function find_git_branch() {
    RBUFFER=$(git branch --verbose --sort=-committerdate | cut -b'3-' | sk | cut -d' ' -f1)
    CURSOR=$#BUFFER         # move cursor
    zle -R -c               # refresh
  }
  zle -N find_git_branch
  bindkey '^B' find_git_branch

  function nav() {
    type highlight &> /dev/null || sudo apt-get install highlight
    while true; do
      local lsd=($(echo ".." && ls -p))
      local sel="$(printf '%s\n' ${lsd[@]} |
        sk --reverse --preview '
          __nav_nxt="$(echo {})";
          __nav_path="$(echo $(pwd)/${__nav_nxt} | sed "s;//;/;")";
          if [ -d "$__nav_nxt" ]; then
            echo $__nav_path;
            echo;
            ls -p --color=always "${__nav_path}";
          else
            echo $__nav_path;
            highlight "$__nav_nxt" --out-format=xterm256 --line-numbers --force --style=solarized-dark
          fi
      ')"
      [[ ${#sel} != 0 ]] || return 0
      if [ -d "$sel" ]; then
        builtin cd "$sel" &> /dev/null
      else
        ${EDITOR:-vim} "$sel"
      fi
    done
  }
fi

# Update prompt every 60 second. Doing it more often makes the up/down keys behave in the wrong way.
# TMOUT=60
TRAPALRM() {
  zle reset-prompt
}

# EXPERIMENTAL
# compdef _gnu_generic -P "*"

# Setup zsh-autosuggestions
# source /usr/local/google/home/tzn/.zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
#    zle autosuggest-start
}

zle -N zle-line-init

export AUTOSUGGESTION_HIGHLIGHT_COLOR='fg=4'

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
# bindkey '^T' autosuggest-toggle
# bindkey '^f' vi-forward-word

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
