# COLORS:
# See https://misc.flogisoft.com/bash/tip_colors_and_formatting

# Foreground
RED='\033[38;1;31m'
GREEN='\033[38;0;32m'
WHITE='\033[38;1;37m'
YELLOW='\033[38;5;11m'
PURPLE='\033[38;5;57m'

# Other
RST='\033[0;m'


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
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


# NATIVESCRIPT TNS COMPLETITION:

if [ -f ~/.tnsrc ]; then
    source ~/.tnsrc
fi


# COLORS:

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagacad
export GREP_OPTIONS='--color=auto'


# ALIASES:

alias cls="clear"
alias lc="clear && pwd && echo && ls && echo"
alias edit="code" # or atom
alias back="cd -"

alias brce="edit ~/.bashrc" # .bashrc edit
alias brcr="source ~/.bashrc" # .bashrc re-source


# FAVOURITE FOLDERS (CD SHORTCUTS)
export CDPATH=$CDPATH:~
# TODO: Autocompletition not working :(


# WORK:
# For work-related stuff that might change occasionally and/or should be left
# out of this repo:
source ~/.work.bash


# Use echo $BASH_CONF to know which config are we using:
export BASH_CONF=".bashrc"


# PROMPT:
function set_prompt() {
    export PS1="\[$1\]● \[${WHITE}\]\W \[${YELLOW}\]➜\[${RST}\]  "
}

# CONFIGS SWITCHER:
# TODO: Move this to its own file.

configs=("~/.npmrc" "~/.gitconfig")
default="work"
whereami=~/.whereami

# TODO: Add a color indicator on the cursor
# declare -A config_colors
# config_colors=([work]=$YELLOW [home]=$HIB_BLUE)

# Switch location:
function go() {
    # For each config, grab the suffixed version of it and create a symlink
    # to it with the original name.

    current=$1
    echo "$current" > $whereami

    echo -e "\nGoing to ${WHITE}$current${RST}...\n"

    for base in "${configs[@]}" ; do
        file="$base-$current"

        if [ -f "`eval echo ${file//>}`" ] ; then
            if [ -L "`eval echo ${base//>}`" ] ; then
                # If the symlink already exists, update iy:
                ln -sf "`eval echo ${file//>}`" "`eval echo ${base//>}`"
            else
                # Otherwise, create a new one:
                ln -s "`eval echo ${file//>}`" "`eval echo ${base//>}`"
            fi

            echo -e "  ${GREEN}✓${RST}  ${WHITE}$base${RST}  ➜  ${WHITE}$file${RST} ok."
        else
            # Delete old symlink:
            rm $base
            echo -e "  ${RED}×${RST}  ${WHITE}$base${RST} as ${WHITE}$file${RST}  not found."
        fi
    done

    # TODO: This could be do with an associative array (bash v4)
    set_prompt $([ "$current" == work ] && echo "$PURPLE" || echo "$RED")

    echo ""
}

# Print where you currently are and all the option you have available:
function lost() {
    echo -e "\nCurrently at ${WHITE}$current${RST}.\n"

    # TODO Print configurable files with their variations and possible locations.

    for base in "${configs[@]}" ; do
        if [ -f "`eval echo ${base//>}`" ] ; then
            echo -e "  ${GREEN}✓${RST}  ${WHITE}$base${RST} is there."
        else
            echo -e "  ${RED}×${RST}  ${WHITE}$base${RST} not there."
        fi
    done

    # TODO: Put this on the same line
    # See: https://stackoverflow.com/questions/2575037/how-to-get-the-cursor-position-in-bash
    name=$(git config user.name)
    email=$(git config user.email)
    npm=$(nvm current)

    echo -e "\nNPM: ${WHITE}$npm${RST}\nGIT: ${WHITE}$name${RST} <${WHITE}$email${RST}>\n"
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

echo -e "Using ${WHITE}$BASH_CONF${RST}!"

# Load the location from $file if it exists or create it (empty):
if [ -f $whereami ] ; then
    current=$( < $whereami)
else
    touch $whereami
fi

# TODO: Run check

# If it doesn't (or is empty), use the default and set it in the file itself:
if [ -z $current ] || [ ! check ] ; then
    go $default
else
    # TODO: This could be do with an associative array (bash v4)
    set_prompt $([ "$current" == work ] && echo "$PURPLE" || echo "$RED")

    lost
fi
