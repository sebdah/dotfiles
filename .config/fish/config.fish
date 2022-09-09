. ~/.profile-secrets.fish

# Aliases
alias ls 'exa'
alias grep 'grep --color=auto'
alias scp "scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias ssh "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias tmux "tmux -2"

alias agrea "cd ~/go/src/github.com/agrea"
alias sebdah "cd ~/go/src/github.com/sebdah"

# Environment variables
set -gx PATH \
  /bin \
  /usr/bin \
  /usr/sbin \
  /usr/local/bin \
  /var/lib/snapd/snap/bin \
  ~/bin \
  ~/.local/bin \
  ~/go/bin

set -gx LESS '-F -g -i -M -R -S -w -X -z-4'
set -gx GOPATH ~/go
set -gx GOPRIVATE 'github.com/sebdah/devinsight,github.com/clockwork-guru/*'
set -gx BROWSER open
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER less
set -gx GPG_TTY (tty)
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
  for r in (ls -1)
    if ! test -d $r
      continue
    end

    pushd $r

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
      echo -e " ✅"
    end

    popd
  end

  set_color normal;
end

# gSua is pulling all repositories
function gSua
  for r in (ls -1)
    if ! test -d $r
      continue
    end

    pushd $r

    set_color blue;
    echo -ne "Updating submodules $r.."
    set_color normal;

    git submodule update --init --recursive &> /dev/null

    if test $status -gt 0
      echo -e " ❌"
    else
      set_color green;
      echo -e " ✅"
    end

    popd
  end

  set_color normal;
end

function gBa
  for r in (ls -1)
    if ! test -d $r
      continue
    end

    pushd $r

    set_color blue;
    echo -ne "$r"
    set_color normal;

    set -lx branch (git branch --show-current)
    echo -ne " ($branch)\n"

    popd
  end
end

# tC is cleaning all tmux sessions.
function tC
  tmux list-sessions | awk 'BEGIN{FS=":"}{print $1}' | xargs -n 1 tmux kill-session -t
end
