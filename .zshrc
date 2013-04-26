# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# Key bind
bindkey -v

# Auto Completion
zstyle :compinstall filename '$HOME/.zshrc'
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
PROMPT=$LIGHT_GRAY'[${USER}]%(!.#.$) '$DEFAULT
RPROMPT=%1(v|%F{green}%1v%f|)$LIGHT_GRAY'[%~]'$DEFAULT
setopt PROMPT_SUBST
setopt transient_rprompt

# Terminal Title
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# Aliases
alias ls='ls -GF'
alias ll='ls -Gla'
alias git=/usr/local/bin/git

alias gl='git log --graph --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset"'

#
export CPLUS_INCLUDE_PATH=/usr/local/include/thrift/

# Environmental Settings
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.6.0_29-b11-402.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_09.jdk/Contents/Home
export JAVA_OPTIONS="-Dfile.encoding=UTF-8"
#export MAVEN_HOME=/opt/maven
#export ANT_HOME=/opt/ant
export ANT_OPTS="-Dfile.encoding=UTF-8"

export PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$ANT_HOME/bin:~/Developments/bin:~/Developments/tools/hadoop-1.0.1/bin:$PATH

export LD_LIBRARY_PATH=/usr/local/lib

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export EDITOR=vim
export VISUAL=vim

export CLOJURE_EXT=~/Developments/tools/clojure

# zaw
#source ~/src/zaw/zaw.zsh
#zsh-history() {
#  zaw zaw-src-history
#}
#zle -N zsh-history
#bindkey '^Xh' zsh-history
fpath=($HOME/.zsh/func $fpath)
typeset -U fpath

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

source ~/.zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugin/go
