. ~/.profile-secrets.fish
#. ~/dotfiles/clearance-fish/fish_prompt.fish

# Aliases
alias ls 'exa'
alias grep 'grep --color=auto'
alias scp "scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias ssh "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias tmux "tmux -2"
alias apexssh "~/go/src/github.com/saltside/apex/scripts/apexssh"

alias agrea "cd ~/go/src/github.com/agrea"
alias sebdah "cd ~/go/src/github.com/sebdah"
alias work "cd ~/go/src/github.com/saltside"

# Environment variables
set -gx PATH \
  ~/bin \
  ~/go/bin \
  /var/lib/snapd/snap/bin \
  /usr/local/bin \
  /usr/bin \
  /usr/sbin \
  ~/go/src/github.com/saltside/workstation/bin \
  ~/.gem/ruby/2.7.0/bin \
  $PATH

set -gx LESS '-F -g -i -M -R -S -w -X -z-4'
set -gx GOPATH ~/go
set -gx GOPRIVATE 'github.com/saltside/*,github.com/NordiskFilmDistribution/*,github.com/sebdah/devinsight,github.com/clockwork-guru/*'
set -gx BROWSER open
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER less
set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US.utf-8
set -gx LC_ALL en_US.UTF-8
set -gx FZF_DEFAULT_COMMAND 'ag --hidden -p ~/.agignore -g ""'
set -gx LSCOLORS 'Exfxcxdxbxegedabagacad'
set -gx NVM_SYMLINK_CURRENT true

# Disable the fish greeting
set fish_greeting ""

# Enable direnv (https://direnv.net/)
eval (direnv hook fish | source)

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

# gcleanup is cleaning local git branches that have already been merged on origin.
function gcleanup
  git branch -r --merged | grep -v master | sed 's/origin\///' | xargs -n 1 git push --delete origin
end

# gLa is pulling all repositories
function gLa
  set -lx root ~/go/src/github.com/saltside

  for r in (ls -1 $root)
    cd $root/$r

    set_color blue;
    echo -ne "Pulling $r.."
    set_color normal;

    git pull > /dev/null

    if test $status -gt 0
      echo -e " ❌"
    else
      set -lx branch (git branch --show-current)
      echo -ne " ($branch)"
      set_color green;
      echo -e " 🗸"
    end
  end

  set_color normal;
end

function gBa
  set -lx root ~/go/src/github.com/saltside

  for r in (ls -1 $root)
    cd $root/$r

    set_color blue;
    echo -ne "$r"
    set_color normal;

    set -lx branch (git branch --show-current)
    echo -ne " ($branch)\n"
  end
end

# tC is cleaning all tmux sessions.
function tC
  tmux list-sessions | awk 'BEGIN{FS=":"}{print $1}' | xargs -n 1 tmux kill-session -t
end
