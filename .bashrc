# NVM stuff:

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # Add --no-use if startup is slow
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# JAVA/MAVEN/ANDROID:

export JAVA_HOME=`/usr/libexec/java_home -v 1.8` # Use -v X.Y in case you installed multiple versions.
export ANDROID_HOME=~/Library/Android/sdk

export PATH=$PATH:~/Dev/apache-maven-3.5.2/bin
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools


# NATIVESCRIPT TNS COMPLETITION:

if [ -f /Users/danielgamezfranco/.tnsrc ]; then
    source /Users/danielgamezfranco/.tnsrc
fi


# COLORS:

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export GREP_OPTIONS='--color=auto'


# PROMPT:

export PS1="\W \[\033[38;5;11m\]➜\[$(tput sgr0)\]\[\033[38;5;15m\]  \[$(tput sgr0)\]"


# ALIASES:

alias cls="clear"
alias lc="clear && pwd && echo && ls && echo"
alias editbrc="atom ~/.bashrc"
alias edit="atom"


# Use echo $BASH_CONF to know which config are we using:
export BASH_CONF=".bashrc"


# CONFIG SWITCHER:
# TODO: Move this to its own file.

configs=(".npmrc" ".gitconfig")
default="work"
file=~/.whereami

RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Switch location:
function go() {
    # For each config, grab the suffixed version of it and create a symlink
    # to it with the original name.

    current=$1
    echo "$current" > $file

    echo -e "\nGoing to $current...\n"

    for base in "${configs[@]}" ; do
        file="$base-$current"

        if [ -f $file ] ; then
            if [ -L $base ] ; then
                # If the symlink already exists, update iy:
                ln -sf $file $base
            else
                # Otherwise, create a new one:
                ln -s $file $base
            fi

            echo -e "  ${GREEN}✓${NC} ${WHITE}$base${NC}  ➜  ${WHITE}$file${NC} ok."
        else
            # Delete old symlink:
            rm $base
            echo -e "  ${RED}×${NC} ${WHITE}$base${NC} as ${WHITE}$file${NC}  not found."
        fi
    done

    echo ""
}

# Print where you currently are and all the option you have available:
function lost() {
    echo -e "\nCurrently at $current.\n"

    # TODO Print configurable files with their variations and possible locations.

    for base in "${configs[@]}" ; do
        if [ -f $base ] ; then
            echo -e "  ${GREEN}✓${NC} ${WHITE}$base${NC} is there."
        else
            echo -e "  ${RED}×${NC} ${WHITE}$base${NC} not there."
        fi
    done

    echo ""
}

function check() {
    # TODO: This should be checking if the symlinks are valid (to the right location)

    # TODO: Check if all the files that exists for the current env
    # (eg .npmrc-work) also exists unpostfixed. Otherwise, we are missing some
    # symlinks and we need to recreate them.

    # TODO: Also, check if the symlinks that are there point to the right files
    # according to $current.

    # TODO: Return true or false

    return true
}

# INIT:

lc

echo -e "Using ${WHITE}$BASH_CONF${NC}!"

# Load the location from $file if it exists or create it (empty):
if [ -f $file ] ; then
    current=$( < $file)
else
    touch $file
fi

# TODO: Run check

# If it doesn't (or is empty), use the default and set it in the file itself:
if [ -z $current ] || [ ! check ] ; then
    go $default
else
    # TODO: also execute lc here
    lost
fi
