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

- [ ] *FT* - Upgrade to bash v4: https://apple.stackexchange.com/questions/193411/update-bash-to-version-4-0-on-osx

- [ ] *DOC* - Document features.

- [ ] *FT* - Do the same for maven `settings.xml`.

- [ ] *BUG* - Handle TODOs on the code.


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
- XCode


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
- Avast Security


FAQ & Troubleshooting
=====================

- **This is not doing anything.**

  Have you created both a `.bashrc` and a `.bash_profile` files with the right content?

  Otherwise, see https://superuser.com/questions/320065/bashrc-not-sourced-in-iterm-mac-os-x.

- **How can I change the colors/formatting you use?**

  See https://misc.flogisoft.com/bash/tip_colors_and_formatting.

- **Could you put variables for all/more/this color?**

  No, this repo is meant to have the `.bashrc` I **personally** use.

  You are free to use all its contents as you wish, but I'm not really into making this too extensible/configurable and add plenty of unused stuff and checks in there for that, you can just download it and adjust it to your needs yourself.
