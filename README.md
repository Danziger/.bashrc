`.bashrc` and stuff
====================

The title says it all...


Features
========

Colors
------

TODO


Prompt
------

TODO


Aliases
-------

TODO

Configuration Switcher
----------------------

TODO


Files
=====

- `.bashrc`: Where the magic happens.

- `.bash_profile`: Just points to `.bashrc` like so:

      if [ -f ~/.bashrc ]; then 
          source ~/.bashrc 
      fi

  Why? See https://stackoverflow.com/questions/415403/whats-the-difference-between-bashrc-bash-profile-and-environment

- `.gitconfig-home`, `.gitconfig-work`, `.npmrc-home` and `.npmrc-work` are just placeholders that you should fill in with your own data. They are just there to provide some dummy data to the configuration switcher script so that it works out-of-the-box.


Installation
============

1. Check your have Bash 4 installed on your system:

        bash --version

    If you have an older version, you will have to update (not yet, for now it still works with version 3). See [here](http://clubmate.fi/upgrade-to-bash-4-in-mac-os-x/) for Mac.

2. Download the files listed in the previous section in your home directory.

2. Update them with your NPM and Git data.

3. Restart the terminal / Open a new one / Run `source ~/.bashrc`.

4. Enjoy.


Configuration
=============

TODO


Stuff
=====

As you can see in the title, this repo contains my `.bashrc` file and "stuff", which is basically a list of the programs I usually install on my computers.


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
- Sourcetree


Browsers
--------

- Chrome
- Firefox
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


TO DO
=====

- [ ] *DOC* - Document features and add screenshots.

- [ ] *FT* - Upgrade to bash v4: https://apple.stackexchange.com/questions/193411/update-bash-to-version-4-0-on-osx

- [ ] *BUG* - Handle TODOs on the code.

- [ ] *BUG* - Move configuration swither to its own file.

- [ ] *FT* - Do the same for maven `settings.xml`.

- [ ] *FT* - Add a script to backup these config files just in case we are playing around with them.

- [ ] *FT* - Add a script to print a palette of colors.


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
