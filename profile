# Alias
alias agrea="cd ${HOME}/go/src/github.com/agrea"
alias cist="hub ci-status"
alias cistw="watch -n5 hub ci-status"
alias grep='grep --color'
alias ls='ls -G'
alias s="saltside-workstation sandbox"
alias sL="saltside-workstation sandbox logs -f"
alias sR="saltside-workstation sandbox reset"
alias scp="scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias sd="saltside-workstation sandbox dev"
alias se="saltside-workstation sandbox exec"
alias sebdah="cd ${HOME}/go/src/github.com/sebdah"
alias sm="saltside-workstation sandbox market"
alias sr="saltside-workstation sandbox reload"
alias ss="saltside-workstation sandbox sync"
alias ssh="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias tmux="tmux -2"
alias w="saltside-workstation"
alias work="cd ${HOME}/go/src/github.com/saltside"

source ${HOME}/.dotfiles/gitaliases

# Path
export PATH="${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:/usr/local/bin:${PATH}"
export PATH="${PATH}:${SALTSIDE_SOURCE_DIR}/workstation/bin"
export PATH="${PATH}:${HOME}/bin"
export PATH="${PATH}:${HOME}/go/bin"
export PATH="${PATH}:/usr/bin"
export PATH="${PATH}:/usr/sbin"
export PATH="${PATH}:/usr/local/go/bin"
export PATH="${PATH}:/usr/local/opt/go/libexec/bin"
export PATH="${PATH}:./node_modules/.bin:./../node_modules/.bin"

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Android
#
export ANDROID_HOME=/usr/local/opt/android-sdk
export ANDROID_HOME=~/Library/Android/sdk
export PATH="${PATH}:~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools"

# Go
export GOPATH="${HOME}/go"

# ls colors (Mac OS X ls)
export LSCOLORS 'Exfxcxdxbxegedabagacad'

export EDITOR='vim'

# ls colors (Mac OS X ls)
export LSCOLORS='Exfxcxdxbxegedabagacad'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
  export LANGUAGE='en_US.utf-8'
  export LC_ALL='en_US.UTF-8'
fi

# Don't save duplicates in bash history
export HISTCONTROL=erasedups

# nvm settings
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Load the secrets
source ${HOME}/.profile-secrets

#
# Browser
#
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#########################################################
#
#                 Avail settings
#
#########################################################
# Umbrella
UMBRELLA_PATH="${HOME}/git/avail/umbrella"

# Path additions
export PATH="${PATH}:${HOME}/git/avail/tools/pys3"
