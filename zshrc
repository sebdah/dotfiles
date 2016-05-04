#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload -Uz promptinit
promptinit
prompt peepcode '>>'

setopt append_history no_inc_append_history no_share_history

bindkey -e

git_tag() {
  if ! git rev-parse --is-inside-work-tree &> /dev/null; then
    return
  fi
  echo $(git rev-parse --short HEAD)
}

source ${HOME}/.dotfiles/zsh-git-prompt/zshrc.sh
ZSH_THEME_GIT_PROMPT_PREFIX=''
ZSH_THEME_GIT_PROMPT_SUFFIX=''
ZSH_THEME_GIT_PROMPT_SEPARATOR=' '
RPROMPT='$(git_tag) $(git_super_status)'
