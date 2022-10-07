hg_root="$(hg root 2>/dev/null)"
if [ -z "${hg_root}" ]; then
  return $?
else
  hg_root="$hg_root/.hg"
fi
if [ -f "$hg_root/sharedpath" ]; then
  hg_sharedroot=$(cat "$hg_root/sharedpath")
fi
if [[ -f "$hg_root/bisect.state" ]]; then
  echo "BISECT"
elif [[ -f "$hg_root/histedit-state" ]]; then
  echo "HISTEDIT"
elif [[ -f "$hg_root/graftstate" ]]; then
  echo "GRAFT"
elif [[ -f "$hg_root/unshelverebasestate" ]]; then
  echo "UNSHELVE"
elif [[ -f "$hg_root/rebasestate" ]]; then
  echo "REBASE"
elif [[ -d "$hg_root/merge" ]]; then
  echo "MERGE"
elif [[ -L "$hg_root/store/lock" ]]; then
  echo "STORE-LOCKED"
elif [[ -L "$hg_root/wlock" ]]; then
  echo "WDIR-LOCKED"
elif [[ -z "$hg_sharedroot" ]]; then
  if [[ -f "$hg_sharedroot/bisect.state" ]]; then
    echo "BISECT"
  elif [[ -f "$hg_sharedroot/histedit-state" ]]; then
    echo "HISTEDIT"
  elif [[ -f "$hg_sharedroot/graftstate" ]]; then
    echo "GRAFT"
  elif [[ -f "$hg_sharedroot/unshelverebasestate" ]]; then
    echo "UNSHELVE"
  elif [[ -f "$hg_sharedroot/rebasestate" ]]; then
    echo "REBASE"
  elif [[ -d "$hg_sharedroot/merge" ]]; then
    echo "MERGE"
  elif [[ -L "$hg_sharedroot/store/lock" ]]; then
    echo "STORE-LOCKED"
  elif [[ -L "$hg_sharedroot/wlock" ]]; then
    echo "WDIR-LOCKED"
  fi
fi
