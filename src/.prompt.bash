SRC="$( cd "$( dirname "$( realpath "${BASH_SOURCE[0]}" )" )" >/dev/null && pwd )"

if [ -f "${SRC}/.windows.bash" ]; then
    source "${SRC}/.windows.bash"
fi

# TODO: If git info is not showing up see this:
# https://stackoverflow.com/questions/15384025/bash-git-ps1-command-not-found/17508424

function set_prompt() {
    if [ -n "$on_windows" ]; then
        export PS1=" \[$1\]● \[${WHITE}\]\W\$(__git_ps1) \[${YELLOW}\]»\[${RST}\] "
    else
        export PS1="\[$1\]● \[${WHITE}\]\W\$(__git_ps1) \[${YELLOW}\]➜\[${RST}\]  "
    fi
}