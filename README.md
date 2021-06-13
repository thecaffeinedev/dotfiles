#  💻 dotfiles

My personal Dotfiles for my M1 MBP  💻

These are my dotfiles. Take anything you want, but at your own risk.

## Table of Contents <!-- omit in toc -->

- [Installation](#installation)
- [Hardware](#hardware)
- [macOS](#macos)
- [Homebrew package management](#homebrew-package-management)
- [Shell](#shell)
- [Text editors and Apps](#text-editors-and-apps)
  - [VSCode](#vscode)
  - [Sublime text](#sublime-text)
- [Git](#git)
- [Language-specific setup](#language-specific-setup)
  - [Python](#python)
  - [JavaScript](#javascript)
- [SSH](#ssh)
  - [Key generation](#key-generation)
  - [Connecting to GitHub](#connecting-to-github)
- [General productivity](#general-productivity)
- [Media](#media)
- [VSCode Extension](VScode-extension)

## Installation

Dotfiles are application configuration and settings files. They frequently begin with a dot, hence the name.

#### Rosetta 2

Rosetta 2 is the lifeline that allows us to run apps designed for Intel-based chips that use x86 architecture on ARM-based chips (in this case M1). 

```
/usr/sbin/softwareupdate --install-rosetta --agree-to-license
```
If you decide not to put the flag --agree-to-license, you will be prompted by Apple's interactive install and you will have to agree to their terms and license conditions in order to use it.

#### Homebrew

I use Homebrew to install most of my apps and utilities.

It runs natively on M1. You can install it by
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```


#### XCode CLI

```
xcode-select --install
```

## Hardware

- [M1 Macbook Pro](https://www.apple.com/macbook-pro-13/) 
- [LG Monitor 24MK600M](https://www.lg.com/hk_en/monitor/lg-24MK600M)
- [Seagate external hard drives](https://www.amazon.in/Seagate-Backup-External-Drive-Portable/dp/B07M67W1PH)
- [Logitech Keyboard](https://www.logitech.com/en-in/products/keyboards/k380-multi-device.920-007597.html?crid=27) 
- [Logitech bluetooth  mouse](https://www.logitech.com/en-in/products/mice/m720-triathlon.910-004792.html?crid=7)

## macOS

Currently I am running MacOS Big Sur.

Check MacOS Updates by

```bash
sudo softwareupdate -i -a
```

Post-Installation, here are some of the stuff I do. You can check here 
- `dotfiles macos` (set [macOS defaults](./macos/defaults.sh))


## Homebrew package management

- [Homebrew](https://brew.sh/) is a package manager that includes [Homebrew-Cask](https://caskroom.github.io/) to manage other macOS applications.
- See the Homebrew [docs](https://docs.brew.sh) for further info.

To install a package (or Formula in Homebrew vocabulary) simply type:
```
brew install <formula>
```
To update Homebrew's directory of formulae, run:
```
brew update
```

To search for formulas you run:

```
brew search <formula>
```
To uninstall a formula you can run:

```
brew uninstall <formula>
```

You can find more information from [Homebrew-Cask](https://formulae.brew.sh/cask/)

#### Some of the apps
Some useful apps and utilities are available. You can search for more and install

```
brew install tree wget git vim cmake rectangle grep htop 
```

Some other apps. You can find here 
- `dotfiles brew` (set [macOS brew](./macos/brew-ins.sh))

## Shell

- I use Zsh as my shell, which functions like Bash but offers more customization.
- [iTerm2](https://iterm2.com/downloads.html)  as my default terminal.
- I use [Oh My Zsh](https://ohmyz.sh/) for extra configuration.
- Also [Powerlevel 10k](https://github.com/romkatv/powerlevel10k). 

## Text editors and Apps

### VSCode

VSCode runs natively on M1. 
- [Microsoft Visual Studio Code](https://code.visualstudio.com/)

### Sublime Text

It also runs natively.

- [Sublime Text](https://www.sublimetext.com/)

### Apps

- [Docker Desktop](https://docs.docker.com/docker-for-mac/install/) — If you’re a developer, you’ll most likely touch Docker at some point. It now runs natively on Apple Silicon Macs.
- [Rectangle](https://rectangleapp.com/) — I’ve tried many window management apps, and this is my favorite for its ease of use, price (free), and speed (optimized for Apple Silicon).
- [Telegram](https://desktop.telegram.org/)
- [TunnelBlick](https://tunnelblick.net/downloads.html) - OpenSource VPN for MacOS
- [Figma](https://www.figma.com/downloads/)
- [qBittorrent](https://www.qbittorrent.org/)
- [AnyDesk](https://anydesk.com/en)


## Git

Install git by
```
brew install git
```

#### Setup Git config

```
git config --global user.name "your name"

git config --global user.email "someone@gmail.com"
```

I do set up SSH keys for my Github auth. 

You can check my git config here.

- `dotfiles git` (set [Git Config](./git/))

## Language-specific setup

### Python

By default Python 3.9 is there. You can install Python 3.8 by

```
brew install python@3.8
```
I use Python 3.8 for most of my work. If you are a Data Science Enthusiast, you need to use Miniforge for now. Because most of the python libraries like Numpy, Pandas etc are not natively supported as of now.

You can download the arm version of miniforge [here](https://github.com/conda-forge/miniforge/#download). 

##### Virtualenvwrapper
I normally use virtualenv for managing python enviroments.

You can install and setup virtualenv by

```
pip3 install virtualenv
```

And then

```
virtualenvwrapper
```

[virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/index.html) provides a set of commands which makes working with virtual environments much more pleasant. It also places all your virtual environments in one place.

To install (make sure virtualenv is already installed):
```
pip3 install virtualenvwrapper
```
Create a directory in your home
```
mkdir .virtualenvs
```

Add path to your ``.bashrc`` or ``.zshrc``

```
export PATH="/opt/homebrew/opt/python@3.8/bin:$PATH"
export VIRTUALENVWRAPPER_PYTHON=/opt/homebrew/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
source /opt/homebrew/bin/virtualenvwrapper.sh

```

## Javascript

#### Node.js
On Apple's silicon-based laptops, [Node.js](https://nodejs.org/en/) versions starting from 14 and below are not supported. You will have to install version 15.x.x. or greater (depending on when you are reading this).

Note that if you do not already have a profile file (~/.bash_profile, ~/.zshrc, ~/.profile, or ~/.bashrc) for your shell it won’t be able to install correctly. You should create the appropriate file(s) first before running the command below.


At first, I installed Node.js using nvm without using Homebrew. Execute the below curl command to install nvm first:

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
```

Now that you have nvm installed you can run the following command to install node. Version 15 works on arm.
```
nvm install v15
```

You can confirm by
```
node --version
```

React and other stuff you can install later on based on your requirements.


## SSH

### Key generation

To [generate an SSH key](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent):

```sh
ssh-keygen -t ed25519 -C "your_email@example.com" -f ~/.ssh/id_ed25519_"$(whoami)"
```

### Connecting to GitHub

See the [GitHub docs on connecting to GitHub with SSH](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh).

 [Add SSH key to GitHub account](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account):
  - Use the [GitHub CLI](https://cli.github.com/manual/gh_ssh-key_add): `gh ssh-key add`
  - Or, run `pbcopy < ~/.ssh/id_ed25519_"$(whoami)".pub`, and go to GitHub in a web browser and paste the key.
- [Check SSH connection](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/testing-your-ssh-connection) with `ssh -T git@github.com`.


To Manage multiple SSH keys. Here are some sites, which I have found to be useful

- https://dev.to/yashsway/setting-up-multiple-ssh-profiles-to-manage-multiple-git-accounts-macos-3m7m
- https://www.freecodecamp.org/news/how-to-manage-multiple-ssh-keys/
- https://gist.github.com/jexchan/2351996


## General productivity

- [1Password](https://1password.com/) (Mac App Store)
- [Rectangle](https://rectangleapp.com/)
- [Notion](https://www.notion.so/)
- [Amphetamine](https://apps.apple.com/us/app/amphetamine/id937984704?mt=12)
- macOS Keynote, Numbers, and Pages

## Media

- [Audacity](https://www.audacityteam.org/)
- [HandBrake](https://handbrake.fr/)
- [Jellyfin](https://jellyfin.org/) media server
- [VLC](https://www.videolan.org/vlc/) media player
- [Fotor Photo Editor](https://www.fotor.com/mac/index.html)
- iMovie

## VSCode Extensions

Below is the combination of extensions that fulfills both of my purposes. 

- [autoDocstring](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring)
- [Auto Close tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-close-tag)
- [Auto Complete Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-complete-tag)
- [Auto Rename Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag)
- [Babel JavaScript](https://marketplace.visualstudio.com/items?itemName=mgmcdermott.vscode-language-babel)
- [Better Comments](https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments)
- [Bracket Pair Colorizer 2](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2)
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
- [Code::Stats](https://codestats.net/)
- [Color Highlight](https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight)
- [DotENV](https://marketplace.visualstudio.com/items?itemName=mikestead.dotenv)
- [ESLint](https://eslint.org/)
- [Expo Tools](https://marketplace.visualstudio.com/items?itemName=byCedric.vscode-expo)
- [Flow Language Support](https://marketplace.visualstudio.com/items?itemName=flowtype.flow-for-vscode)
- [Highlight Matching Tag](https://marketplace.visualstudio.com/items?itemName=vincaslt.highlight-matching-tag)
- [Indent rainbow](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow)
- [iOS common files](https://marketplace.visualstudio.com/items?itemName=Orta.vscode-ios-common-files)
- [macros](https://marketplace.visualstudio.com/items?itemName=geddski.macros)
- [npm](https://marketplace.visualstudio.com/items?itemName=eg2.vscode-npm-script)
- [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [Python Preview](https://marketplace.visualstudio.com/items?itemName=dongli.python-preview)
- [npm intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.npm-intellisense)
- [Path intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense)
- [Prettier](https://prettier.io/)
- [React Native Tools](https://marketplace.visualstudio.com/items?itemName=msjsdiag.vscode-react-native)
- [Read Time](https://marketplace.visualstudio.com/items?itemName=johnpapa.read-time)
- [SVG Viewer](https://marketplace.visualstudio.com/items?itemName=cssho.vscode-svgviewer)
- [TODO Highlight](https://marketplace.visualstudio.com/items?itemName=wayou.vscode-todo-highlight)
- [vscode-styled-components](https://marketplace.visualstudio.com/items?itemName=jpoissonnier.vscode-styled-components)
- [Word Count](https://marketplace.visualstudio.com/items?itemName=ms-vscode.wordcount)



I have missed many extensions. I will update it later on.

## Conclusion

[**isapplesiliconready.com**](https://isapplesiliconready.com/for/developer) is another useful link I found sometimes back to check what is compatible to work on Apple Silicon chips natively or using Rosetta or not optimized at all.