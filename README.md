`.bashrc` and stuff
====================

The title says it all...

`.bashrc` is there in a separated file.

Same goes for `.bash_profile`, that just points to `.bashrc` like so:

    if [ -f ~/.bashrc ]; then 
        source ~/.bashrc 
    fi

Why? See https://stackoverflow.com/questions/415403/whats-the-difference-between-bashrc-bash-profile-and-environment

The rest of the stuff is below:


TO DO
=====

- [ ] *BUG* - Change to absolute paths so that it works on integrated terminals like the one in VSCode.

- [ ] *BUG* - Handle TODOs on the code.

- [ ] *DOC* - Document features.

- [ ] *FT* - Print current git user and NPM version (`nvm current`).

- [ ] *FT* - Do the same for maven `settings.xml`.

- [ ] *FT* - Highlight "work" (blue) or "home" (green) and mave also change prompt!


Stuff
=====

IDEs & Code Editors
-------------------

- Atom
- Visual Studio Code
- Visual Studio
- JetBrains Toolbox
- WebStorm
- PyCharm
- IntelliJ
- Android Studio


Development
-----------

- iTerm
- VirtualBox
- Java SDK
- Homebrew
- NVM
- Python 2 & 3
- Maven
- MongoDB
- XCode


Browsers
--------

- Chrome
- Firefix
- Safari
- IE Virtual Machines: https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/


Communication
-------------

- WhatsApp
- Telegram
- Slack
- StarLeaf


Productivity
------------

- Wunderlist
- Spectacle
- f.lux


Misc.
-----

- Dropbox
- Spotify
- TunnelBlick


Having trouble?
===============

- https://superuser.com/questions/320065/bashrc-not-sourced-in-iterm-mac-os-x
