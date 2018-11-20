multiple_backups=true
prefix=""
postfix=".bak"

if [ "$multiple_backups" = true ] ; then
    prefix="$(date +"%s-%N")-"
fi

echo

if [ -f ~/.bashrc ]; then
    backup="~/.${prefix}bashrc${postfix}"

    echo ".bashrc       file already exists! Backed up as ${backup}"

    cp ~/.bashrc "`eval echo ${backup}`"

    rm ~/.bashrc
fi

if [ -f ~/.profile ]; then
    backup="~/.${prefix}profile${postfix}"

    echo ".profile      file already exists! Backed up as ${backup}"

    cp ~/.profile "`eval echo ${backup}`"
fi

if [ -f ~/.bash_profile ]; then
    backup="~/.${prefix}bash_profile${postfix}"

    echo ".bash_profile file already exists! Backed up as ${backup}"

    cp ~/.bash_profile "`eval echo ${backup}`"
fi

echo

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

target="${DIR}/.bashrc"

if [ -L ~/.bashrc ]; then
    # If the symlink already exists, update it:
    ln -sf "$target" ~/.bashrc
else
    # Otherwise, create a new one:
    ln -s "$target" ~/.bashrc
fi

echo