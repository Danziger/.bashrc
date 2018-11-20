SRC="$( cd "$( dirname "$( realpath "${BASH_SOURCE[0]}" )" )" >/dev/null && pwd )"

if [ -f "${SRC}/.windows.bash" ]; then
    source "${SRC}/.windows.bash"
fi

if [ -n "$on_windows" ]; then

    if [ -f "${SRC}/.utils.bash" ]; then
        source "${SRC}/.utils.bash"
    fi

    copy_function command_not_found_handle original_command_not_found_handle

    # command_not_found_handle can't cd directly as it runs in a subshell... :(

    function command_not_found_handle() {
        drive=${1:0:1} # First character from the command not found.

        if [[ $1 =~ ^[A-Za-z]:+$ ]] ; then
            if [ -d "/mnt/${drive,,}" ] ; then
                clear
                echo -e "\nDrive ${drive^^} found. Use rd && ${drive^^}: (or cd /mnt/${drive,,})\n" # Uppercase and then lowercase
            else
                clear
                echo -e "\nDrive ${drive^^} not found.\n" # Uppercase and then lowercase
            fi
        else
            original_command_not_found_handle "$@"
        fi
    }

    # alias "S:"

    # Init DRIVES, a list of current drives:
    export DRIVES="$( cd /mnt >/dev/null && ls -A )"

    # Create aliases for the units that exists that check if the unit still exists and navigates to it
    # or deletes itself and calls the command_not_found_handle otherwise:

    # TODO: Pass param of the unit we want to go when refreshing, if any.
    function rd() {
        # Unalias old ones and hide errors:
        for drive in $DRIVES ; do
            unalias "${drive^^}:" 2>/dev/null
        done

        # Update DRIVES:
        export DRIVES="$( cd /mnt >/dev/null && ls -A )"

        # Alias current ones:
        for drive in $DRIVES ; do
            alias "${drive^^}:"="[[ -d \"/mnt/${drive,,}\" ]] && { cd \"/mnt/${drive,,}\"; lc; true; } || { unalias \"${drive^^}:\"; command_not_found_handle \"${drive^^}:\"; }"
        done
    }

    rd
fi
