# echo $BASH_CONF to know which config are we using:

export BASH_CONF="profile"


# NVM stuff:

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # --no-use # This loads nvm (uncomment --no-use if startup is slow)
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# JAVA/MAVEN:

export JAVA_HOME=`/usr/libexec/java_home`


# COLORS:

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad


# PROMPT:

export PS1="\W \[\033[38;5;11m\]➜\[$(tput sgr0)\]\[\033[38;5;15m\]  \[$(tput sgr0)\]"


# ALIASES:

alias cls="clear"
alias lc="clear && pwd && echo && ls && echo"
alias cshrc="atom ~/.bashrc"
alias cp="atom ~/.profile"
alias edit="atom"
