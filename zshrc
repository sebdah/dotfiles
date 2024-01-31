# Initialize starship
eval "$(starship init zsh)"

# Aliases
alias ls="ls --color=auto"
alias gst="git status"
alias scp="scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias ssh="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias tmux="tmux -2"

# Path configuration
path+=("/opt/homebrew/bin")
path+=("~/.local/bin")
path+=("~/go/bin")
export PATH

# Other environment variables
export BROWSER="open"
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND='ag --hidden -p ~/.agignore -g ""'
export GOPATH="~/go:/data/users/sebdah/fbsource/fbcode:/data/users/sebdah/fbsource/fbcode/third-party-go:/data/users/sebdah/fbsource/fbcode/third-party-go/vendor:/data/users/sebdah/fbsource/fbcode/third-party-source/go"
export GOPRIVATE='github.com/sebdah/devinsight,github.com/clockwork-guru/*,gitlab.com/agrea'
export GPG_TTY=$(tty)
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LESS='-F -g -i -M -R -S -w -X -z-4'
export PAGER="less"
export TERM="screen-256color"
export VISUAL="nvim"

# FZF configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# dcleanup can be used to clean up docker images.
dcleanup () {
  docker rm -v $(docker ps --filter status=exited -q 2>&1 /dev/null) 2>&1 /dev/null
  docker rmi $(docker images --filter dangling=true -q 2>&1 /dev/null) 2>&1 /dev/null
  docker volume rm $(docker volume ls -qf dangling=true)
}

# gcleanup is cleaning local git branches that have already been merged on origin.
gcleanup () {
  git branch -r --merged | grep -v master | sed 's/origin\///' | xargs -n 1 git push --delete origin
}

# tC is cleaning all tmux sessions.
tC () {
  tmux list-sessions | awk 'BEGIN{FS=":"}{print $1}' | xargs -n 1 tmux kill-session -t
}
