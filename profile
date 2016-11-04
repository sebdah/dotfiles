# Alias
alias grep='grep --color'
alias ls='ls -G'
alias ssh="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias scp="scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias tmux="tmux -2"
alias wrk="workstation"

# Path
export PATH="${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:/usr/local/bin:${PATH}"
export PATH="${PATH}:$SALTSIDE_SOURCE_DIR/workstation/bin"
export PATH="${PATH}:${HOME}/bin"
export PATH="${PATH}:${HOME}/go/bin"
export PATH="${PATH}:/usr/local/go/bin"
export PATH="${PATH}:/usr/local/opt/go/libexec/bin"
export PATH="${PATH}:./node_modules/.bin:./../node_modules/.bin"
export PATH="${PATH}:~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools"

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
#                 Avail settings
#
#########################################################
# Umbrella
UMBRELLA_PATH="${HOME}/git/avail/umbrella"

# Path additions
export PATH="${PATH}:${HOME}/git/avail/tools/pys3"
