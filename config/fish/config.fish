. /Users/sebdah/.profile-secrets.fish
. ~/.dotfiles/clearance-fish/fish_prompt.fish

#
# Aliases
#
alias grep 'grep --color'
alias scp "scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias ssh "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias tmux "tmux -2"

alias agrea "cd ~/go/src/github.com/agrea"
alias sebdah "cd ~/go/src/github.com/sebdah"
alias skymill "cd ~/go/src/github.com/skymill"
alias work "cd ~/go/src/github.com/saltside"

alias cist "hub ci-status"
alias cistw "watch -n5 hub ci-status"

alias w "saltside-workstation"
alias g 'git'

function s --description "s <command>"
  cd ~/go/src/github.com/saltside/sandbox
  saltside-workstation run ./bin/sandbox $argv
  cd -
end

function dcleanup
  docker rm -v (docker ps --filter status=exited -q 2>/dev/null) ^ /dev/null
  docker rmi (docker images --filter dangling=true -q 2>/dev/null) ^ /dev/null
end

#
# Path
#
set -gx PATH \
  ~/.rbenv/shims \
  /usr/local/bin \
  ~/go/src/github.com/saltside/workstation/bin \
  ~/bin \
  ~/go/bin \
  /usr/bin \
  /usr/sbin \
  /usr/local/go/bin \
  /usr/local/opt/go/libexec/bin \
  ./node_modules/.bin \
  ./../node_modules/.bin \
  ~/git/avail/tools/pys3 \
  ~/Library/Android/sdk/tools \
  ~/Library/Android/sdk/platform-tools \
  $PATH

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
set -gx LESS '-F -g -i -M -R -S -w -X -z-4'

#
# Android
#
set -gx ANDROID_HOME /usr/local/opt/android-sdk

#
# Go
#
set -gx GOPATH ~/go

#
# Browser
#
set -gx BROWSER open

#
# Editors
#
set -gx EDITOR vim
set -gx VISUAL vim
set -gx PAGER less

#
# Other
#

set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US.utf-8
set -gx LC_ALL en_US.UTF-8


# ls colors (Mac OS X ls)
set -gx LSCOLORS 'Exfxcxdxbxegedabagacad'

# Disable the fish greeting
set fish_greeting ""
set -g fish_user_paths "/usr/local/opt/node@4/bin" $fish_user_paths
