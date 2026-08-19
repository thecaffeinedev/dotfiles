# zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME=""

# Plugins - reduced for speed
plugins=(git
zsh-autosuggestions
copypath
macos
fzf
)

# Optimize compinit - skip security check for speed
autoload -Uz compinit
compinit -C

source $ZSH/oh-my-zsh.sh

# User configuration

## Aliases
alias "home"="cd $HOME"
alias "la"="ls -la"
alias "lAh"="ls -lAh"
alias "ll"="ls -l"
alias "al"="ls -al"
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias deleteDSFiles='find . -name ".DS_Store" -type f -delete'

# Lazy-load virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs

_load_virtualenvwrapper() {
    if [ -z "$VIRTUALENVWRAPPER_SCRIPT" ]; then
        source /opt/homebrew/bin/virtualenvwrapper.sh
    fi
}

workon() {
    _load_virtualenvwrapper
    workon "$@"
}

mkvirtualenv() {
    _load_virtualenvwrapper
    mkvirtualenv "$@"
}

lsvirtualenv() {
    _load_virtualenvwrapper
    lsvirtualenv "$@"
}


# Lazy-load NVM
export NVM_DIR="$HOME/.nvm"
nvm() {
    unset -f nvm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm "$@"
}

# Set default node path (adjust version as needed)
export PATH="$NVM_DIR/versions/node/v20.0.0/bin:$PATH"

# Lazy-load conda
conda() {
    unset -f conda
    local conda_exe="/opt/homebrew/Caskroom/miniforge/base/bin/conda"
    if [ -f "$conda_exe" ]; then
        eval "$($conda_exe 'shell.zsh' 'hook' 2> /dev/null)"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
    conda "$@"
}

##Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

## Rosetta-x86 configs
alias ibrew="arch -x86_64 /usr/local/bin/brew"

#golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# neovim
alias vi=nvim

# cpp - links
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

# # Python Poetry
# export PATH="$HOME/.poetry/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/caffeinedev/Library/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac


# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Docker completions - lazy load
_docker_lazy_load() {
    fpath=(/Users/caffeinedev/.docker/completions $fpath)
    autoload -Uz compinit
    compinit -C
}

# Environment variables
export HOMEBREW_NO_AUTO_UPDATE=1

# Initialize at the end for fastest startup
eval "$(starship init zsh)"

# Lazy load these
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /Users/caffeinedev/.docker/init-zsh.sh ] && source /Users/caffeinedev/.docker/init-zsh.sh
[ -s "/Users/caffeinedev/.bun/_bun" ] && source "/Users/caffeinedev/.bun/_bun"

# zprofeval "$(uv generate-shell-completion zsh)"

# opencode
export PATH=/Users/caffeinedev/.opencode/bin:$PATH
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
