SRC="$( cd "$( dirname "$( realpath "${BASH_SOURCE[0]}" )" )" >/dev/null && pwd )"

if [ -f "${SRC}/.windows.bash" ]; then
    source "${SRC}/.windows.bash"
fi

if [ -n "$on_windows" ]; then
    alias open="explorer.exe"
fi

# CLEAR:
alias cls="clear"

# NAVIGATION:
alias bk="cd -"
alias back="bk"
alias up="cd .."

# EDITOR:

# TODO: Take this into account in this command on windows:
# https://blogs.msdn.microsoft.com/commandline/2016/11/17/do-not-change-linux-files-using-windows-apps-and-tools/
alias edit="code" # or atom TODO: Check if code or atom are valid commands!
# TODO: Doesn't work, it always opens stuff from C://

# LIST:
alias clsls="clear && pwd && echo && ls"
alias ls="ls --color=auto"
alias lc="clsls && echo ''" # My custom clean-screen list.
alias lt="clsls -F && echo ''" # List with type postfix.
alias la="clsls -A && echo ''" # List all.
alias ld="clsls -FA && echo ''" # List all with type postfix.
alias ll="clsls -FAl && echo ''" # List all with type postfix in list format.
alias ld="clsls -d */ && echo ''" # List all directories.
alias lsd="clear && echo -e \"Drives in /mnt:\n\" && ls /mnt -A && echo" # List all dirves under /mnt

# GREP:
alias grep="grep --color=auto"

# .BASHRC & RELATED STUFF:
alias brce="edit ~/.bashrc" # .bashrc edit
alias brcr="source ~/.bashrc" # .bashrc re-source
alias aliases="edit ${BASH_SOURCE[0]}"