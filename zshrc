# Path to your oh-my-zsh installation.
export ZSH=/Users/sebdah/.dotfiles/oh-my-zsh

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep
bindkey -v

zstyle :compinstall filename '/Users/sebdah/.zshrc'

autoload -Uz compinit
compinit

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="miloshadzic"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux)

source $ZSH/oh-my-zsh.sh

# Alias
alias grep='grep --color'
alias ls='ls -G'
alias ssh="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias scp="scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias tmux="tmux -2"
alias wrk="workstation"

# Path
export PATH="${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:/usr/local/bin:${PATH}"
export PATH="${PATH}:${HOME}/bin"
export PATH="${PATH}:${HOME}/go/bin"
export PATH="${PATH}:/usr/local/go/bin"
export PATH="${PATH}:/usr/local/opt/go/libexec/bin"
export PATH="${PATH}:./node_modules/.bin:./../node_modules/.bin"

# Go
export GOPATH="${HOME}/go"

# ls colors (Mac OS X ls)
export LSCOLORS 'Exfxcxdxbxegedabagacad'

export EDITOR='vim'

# ls colors (Mac OS X ls)
export LSCOLORS='Exfxcxdxbxegedabagacad'

# Language settings
export LANG="en_US.utf-8"
export LANGUAGE="en_US.utf-8"
export LC_ALL="en_US.UTF-8"

# Don't save duplicates in bash history
export HISTCONTROL=erasedups

# nvm settings
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Load the secrets
source ${HOME}/.profile-secrets

#########################################################
#
#                 Saltside settings
#
#########################################################
export SALTSIDE_SOURCE_DIR="${HOME}/work"
export WORKSTATION_VAGRANTFILE=$SALTSIDE_SOURCE_DIR/docker-workstation/Vagrantfile
export PROJECT_PATH=$SALTSIDE_SOURCE_DIR
export PATH="${PATH}:$SALTSIDE_SOURCE_DIR/docker-workstation/vagrant-workstation/bin"
export PATH=$PATH:${HOME}/work/platform-utilities/instance-ips

#########################################################
#
#                 Avail settings
#
#########################################################
# Umbrella
UMBRELLA_PATH="${HOME}/git/avail/umbrella"

# Path additions
export PATH="${PATH}:${HOME}/git/avail/tools/pys3"
