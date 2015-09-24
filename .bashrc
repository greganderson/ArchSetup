# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


### GREG START
export PATH=$PATH:/home/greg/scripts
export PATH=$PATH:/home/greg/apps/android-sdk-linux/platform-tools
export PATH=$PATH:/home/greg/bin
export PATH=$PATH:/home/greg/apps/android-sdk-linux/tools
alias visualvm="visualvm --jdkhome $JAVA_HOME"
export PATH=$PATH:/home/greg/apps/racket-6.2.1/bin
export PATH=$PATH:/home/greg/apps/spark-1.2.1-bin-hadoop2.4/bin
export PATH=$PATH:/home/greg/apps/idea-IC-141.1532.4/bin
export PATH=$PATH:/home/greg/apps/eclipse

#export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64"
export JAVA_HOME="/usr/lib/jvm/jdk1.8.0_60"
export JDK_HOME=$JAVA_HOME

# Java
alias java=$JAVA_HOME/bin/java
alias javac=$JAVA_HOME/bin/javac
alias javaws=$JAVA_HOME/bin/javaws


# Just for handiness
alias mv="mv -i"
alias cp="cp -i"
alias bashrc="pwd >> ~/.bashrc && vim ~/.bashrc && source ~/.bashrc"
alias emacs="emacs -nw"
alias watch="watch -c"
alias grep="grep --color"
alias l="ls"

alias vpn="sudo openconnect -u greg88 -b -s /etc/vpnc/vpnc-script vpn.ldschurch.org"

# Quick aliases to get to directories
alias home="cd /home/greg/programming/search-match/tools/emr"
alias gits="git status"

# Start tomcat server
alias startTomcat="/home/greg/apps/apache-tomcat-7.0.62/bin/catalina.sh start"
alias stopTomcat="/home/greg/apps/apache-tomcat-7.0.62/bin/catalina.sh stop"

# Screen
alias screen="screen -h 10000"

# Racket
alias racket="racket -il readline"


# Maven
export M2_HOME="/home/greg/apps/apache-maven-3.3.3"
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"
export PATH=$PATH:$M2

# AWS
export EC2_HOME=/home/greg/apps/ec2-api-tools-1.7.5.0

# Work
export AWS_ACCESS_KEY='AKIAIHIOJZQL6JHLLKMA'
export AWS_SECRET_KEY='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'

# Greg: Personal
#export AWS_ACCESS_KEY='AKIAJ5PUVOH2S3PDKQDQ'
#export AWS_SECRET_KEY='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'

# Umair: Personal
#export AWS_ACCESS_KEY='AKIAIAWA5GZSZVD5DSHA'
#export AWS_SECRET_KEY='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'

export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_KEY

eval `dircolors ~/.dir_colors`

man() {
  env LESS_TERMCAP_mb=$'\E[01;31m' \
  LESS_TERMCAP_md=$'\E[01;38;5;74m' \
  LESS_TERMCAP_me=$'\E[0m' \
  LESS_TERMCAP_se=$'\E[0m' \
  LESS_TERMCAP_so=$'\E[38;5;246m' \
  LESS_TERMCAP_ue=$'\E[0m' \
  LESS_TERMCAP_us=$'\E[04;38;5;146m' \
  man "$@"
}

function cd () { builtin cd "$@" && ls; }
### GREG END
#export PATH=$PATH:
