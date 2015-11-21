#!/usr/bin/env bash

echo "Linking configuration"

FILES=(gitconfig gitignore profile tmux.conf vimrc.local zlogin zlogout zpreztorc zprofile zshenv zshrc)

function backup_or_unlink {
  DEST=$1 ; shift
  if [[ -d ${DEST} || -e ${DEST} ]] ; then
    COPY="${DEST}-backup-$(date +%Y%m%d%H%I%S)"

    echo "Copying ${DEST} to ${COPY}"
    mv ${DEST} ${COPY}
  elif [[ -L ${DEST} ]] ; then
    echo "Unlinking ${DEST}"
    unlink ${DEST}
  fi
}

#
# Link in regular dotfiles (from a to ~/.a)
#
for FILE in ${FILES[@]}
do
  #DEST="${HOME}/.${FILE}"
  DEST=${HOME}/tmp/.${FILE}
  SRC="$(pwd)/${FILE}"

  backup_or_unlink ${DEST}

  echo "Linking ${FILE}"
  ln -s ${SRC} ${DEST}
done

#
# Special cases
#
echo "Linking .zprezto"
ln -s $(pwd)/prezto ${HOME}/.zprezto

echo "Done installing dotfiles"
