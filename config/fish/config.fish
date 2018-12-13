. ~/.profile-secrets.fish
. ~/.dotfiles/clearance-fish/fish_prompt.fish

# Aliases
alias grep 'grep --color=auto'
alias scp "scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias ssh "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias tmux "tmux -2"
alias apexssh "~/go/src/github.com/saltside/apex/scripts/apexssh"

alias agrea "cd ~/go/src/github.com/agrea"
alias funcd "cd ~/go/src/gitlab.com/funcd"
alias sebdah "cd ~/go/src/github.com/sebdah"
alias skymill "cd ~/go/src/github.com/skymill"
alias work "cd ~/go/src/github.com/saltside"

# Environment variables
set -gx PATH \
  ~/bin \
  ~/go/bin \
  /usr/local/bin \
  /usr/bin \
  /usr/sbin \
  ~/go/src/github.com/saltside/workstation/bin \
  $PATH

set -gx LESS '-F -g -i -M -R -S -w -X -z-4'
set -gx GOPATH ~/go
set -gx BROWSER open
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER less
set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US.utf-8
set -gx LC_ALL en_US.UTF-8
set -gx FZF_DEFAULT_COMMAND 'ag --hidden --skip-vcs-ignores --ignore .git --ignore vendor --ignore node_modules -g ""'
set -gx LSCOLORS 'Exfxcxdxbxegedabagacad'

# Disable the fish greeting
set fish_greeting ""

# Enable direnv (https://direnv.net/)
eval (direnv hook fish)

# s is running sandbox commands using the local sandbox, never the one in the
# workstation.
function s --description "s <command>"
  cd ~/go/src/github.com/saltside/sandbox
  saltside-workstation run ./bin/sandbox -t aws $argv
  cd -
end

# dcleanup can be used to clean up docker images.
function dcleanup
  docker rm -v (docker ps --filter status=exited -q ^ /dev/null) ^ /dev/null
  docker rmi (docker images --filter dangling=true -q ^ /dev/null) ^ /dev/null
  docker volume rm (docker volume ls -qf dangling=true)
end

function tmux-init
  tmux new -d -s "common/control" -c /home/sebdah

  set GITHUB_PROJECTS \
    "NordiskFilmDistribution/agillic-event-converter" \
    "NordiskFilmDistribution/infrastructure" \
    "NordiskFilmDistribution/minutes-watched" \
    "Oresundsbron/notification-service" \
    "saltside/admin" \
    "saltside/admin-service" \
    "saltside/apex" \
    "saltside/apex-bridge" \
    "saltside/apex-config" \
    "saltside/api-gateway-v2" \
    "saltside/chat-service" \
    "saltside/core-service" \
    "saltside/email-service" \
    "saltside/external-admin-service" \
    "saltside/image-service" \
    "saltside/infrastructure" \
    "saltside/inventory-service" \
    "saltside/lib" \
    "saltside/notification-service" \
    "saltside/offer-service" \
    "saltside/payment-admin" \
    "saltside/payment-service" \
    "saltside/platform-admin-data-contracts" \
    "saltside/platform-data-contracts" \
    "saltside/platform-puppet" \
    "saltside/platform-thrift-files" \
    "saltside/review-service" \
    "saltside/sandbox" \
    "saltside/search-service" \
    "saltside/search-service-v2" \
    "saltside/sms-service" \
    "saltside/store" \
    "saltside/web" \
    "saltside/web-gateway" \
    "saltside/web-pwa" \
    "saltside/web-router" \
    "saltside/workstation" \
    "skymill/portal"

  for project in $GITHUB_PROJECTS
    tmux new -d -s "$project" -c /Users/sebdah/go/src/github.com/$project
  end
end

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/sebdah/go/src/github.com/NordiskFilmDistribution/Serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/sebdah/go/src/github.com/NordiskFilmDistribution/Serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/sebdah/go/src/github.com/NordiskFilmDistribution/Serverless/node_modules/tabtab/.completions/sls.fish ]; and . /Users/sebdah/go/src/github.com/NordiskFilmDistribution/Serverless/node_modules/tabtab/.completions/sls.fish
