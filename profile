# Alias
alias g='hub'
alias git='hub'
alias gci='git commit'
alias gco='git checkout'
alias gdiff='git diff'
alias gpl='git pull-request'
alias gst='git status'
alias grep='grep --color'
alias ls='ls -G'
alias ssh="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias scp="scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias tmux="tmux -2"
alias wrk="workstation"

# Path
export PATH="${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:/usr/local/bin:${PATH}"
export PATH="${PATH}:$SALTSIDE_SOURCE_DIR/docker-workstation/vagrant-workstation/bin"
export PATH="${PATH}:${HOME}/bin"
export PATH="${PATH}:${HOME}/go/bin"
export PATH="${PATH}:/usr/local/go/bin"
export PATH="${PATH}:/usr/local/opt/go/libexec/bin"
export PATH="${PATH}:./node_modules/.bin:./../node_modules/.bin"

# Go
export GOPATH="${HOME}/go"

# ls colors (Mac OS X ls)
export LSCOLORS 'Exfxcxdxbxegedabagacad'

#eval "$(rbenv init -)"

#eval "$(boot2docker shellinit 2> /dev/null)"

# Enable git completion
#if [ -f `brew --prefix`/etc/bash_completion ]; then
    #. `brew --prefix`/etc/bash_completion
#fi

# PS1 configuration
#export PS1='\[\e[1;37m\][\u \[\e[1;35m\]\w\[\e[m\]\[\e[1;37m\]$(__git_ps1 " (%s)")]\$\[\e[0m\] '

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
