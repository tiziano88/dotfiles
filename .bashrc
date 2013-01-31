# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export HISTTIMEFORMAT="%F %T "

# stores multiline commands
shopt -s cmdhist

# do not overwrite the history file
shopt -s histappend

#export TERM="xterm-color"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#git_is_dirty() {
#  if [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]]; then 
#    echo "±"
#  fi
#}

#git_prompt() {
#  echo "{$(__git_ps1 %s)$(git_is_dirty)}"
#}

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    export PS1="\n\[\e[32;1m\]==[\[\e[37;1m\]\u@\e[4m\H\e[m\[\e[32;1m\]]=[\[\e[37;1m\]jobs:\j\[\e[32;1m\]]=[\[\e[31;1m\]\w\[\e[32;1m\]]\n\[\e[32;1m\]==[\[\e[37;1m\]! \!\[\e[32;1m\]]==>\[\e[0m\]"
else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    export PS1="\n\[\e[32;1m\]==[\[\e[37;1m\]\u@\e[4m\H\e[m\[\e[32;1m\]]=[\[\e[37;1m\]jobs:\j\[\e[32;1m\]]=[\[\e[31;1m\]\w\[\e[32;1m\]]\n\[\e[32;1m\]==[\[\e[37;1m\]! \!\[\e[32;1m\]]==>\[\e[0m\]"
fi
#export PS1='\n\[\e[32;1m\]==[\[\e[37;1m\]\u@\e[4m\H\e[m\[\e[32;1m\]]=[\[\e[37;1m\]jobs:\j\[\e[32;1m\]]=[\[\e[31;1m\]\w\[\e[32;1m\]]=$(git_prompt)\n\[\e[32;1m\]==[\[\e[37;1m\]! \!\[\e[32;1m\]]==>\[\e[0m\]'
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    UPS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.zshenv ]; then
    . ~/.zshenv
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


# blaze autocompletion
if [ -e /home/build/nonconf/google3/devtools/blaze/scripts/blaze-complete.bash ]; then
  source /home/build/nonconf/google3/devtools/blaze/scripts/blaze-complete.bash
fi

# Set git autocompletion and PS1 integration
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi
if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi

# Enable branch state formatting
#GIT_PS1_SHOWDIRTYSTATE=true
#PS1='\h:\W$(__git_ps1)\$ '


set -o vi

# asfe shortcuts

# Source the git5_aliases
if [ -f ~/.git5_aliases ]; then
  . ~/.git5_aliases
fi
. /home/build/google3/devtools/blaze/scripts/blaze-complete.bash
#. /home/build/google3/ads/branding/adplanner/git5/git5_completion.sh

#export DISPLAY="localhost:99"
alias tmux="TERM=screen-256color-bce tmux"

if [[ "$TERM" != "screen" ]]
then
   # try to attach to existing session, or start a new one
   # tmux attach-session -t "$USER" || tmux -2 new-session -s "$USER"
   session_id=`date +%Y%m%d%H%M%S`
   ( tmux new-session -d -s $session_id -t "$USER" && tmux attach-session -t $session_id && tmux kill-session -t $session_id ) || tmux -2 new-session -s "$USER"
#   exit
fi
