# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# Key bind
bindkey -v

# Auto Completion
zstyle :compinstall filename '/home/yuki/.zshrc'
autoload -Uz compinit
compinit

# vcs
autoload -Uz vcs_info
zstyle ':vsc_info:*' formats '(%s)-[%b]'
zstyle ':vsc_info:*' actionformats '(%s)-[%b]'
precmd () {
    psvar=()
    vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

#export LANG=ja_JP.UTF-8

# color
local DEFAULT=$'%{\e[1;m%}'
local GRAY=$'%{\e[1;30m%}'
local LIGHT_GRAY=$'%{\e[0;37m%}'
local WHITE=$'%{\e[1;37m%}'
local LIGHT_BLUE=$'%{\e[1;36m%}'
local YELLOW=$'%{\e[1;33m%}'
local PURPLE=$'%{\e[1;35m%}'
local GREEN=$'%{\e[1;32m%}'
local BLUE=$'%{\e[1;34m%}'

# Prompt
PROMPT=$LIGHT_GRAY'[${USER}@${HOST}] %(!.#.$) '$DEFAULT
RPROMPT=%1(v|%F{green}%1v%f|)$LIGHT_GRAY'[%~]'$DEFAULT
setopt PROMPT_SUBST

# Terminal Title
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# Aliases
alias ls='ls -F --color=auto'
alias ll='ls -la --color=auto'
alias setproxy='export http_proxy=http://10.9.21.20:8000'
alias noproxy='export http_proxy='

#
export CPLUS_INCLUDE_PATH=/usr/local/include/thrift/

# Environmental Settings
export JAVA_HOME=/opt/java
export MAVEN_HOME=/opt/maven
export ANT_HOME=/opt/ant

export PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$ANT_HOME/bin:$PATH

export LD_LIBRARY_PATH=/usr/local/lib

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export EDITOR=vim
export VISUAL=gvim

# nvm
. ~/.nvm/nvm.sh

# zaw
source ~/src/zaw/zaw.zsh
zsh-history() {
  zaw zaw-src-history
}
zle -N zsh-history
bindkey '^Xh' zsh-history
