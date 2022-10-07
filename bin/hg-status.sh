hg_status=""
hg_status_summary="$(timeout 1 hg status 2>/dev/null | cut -c 1)"
if [[ -n "$hg_status_summary" ]]; then
  if [[ "${hg_status_summary}" =~ .*M.* ]]; then
    hg_status="${hg_status}*"
  fi
  if [[ "${hg_status_summary}" =~ .*A.* ]]; then
    hg_status="${hg_status}+"
  fi
  if [[ "${hg_status_summary}" =~ .*R.* ]]; then
    hg_status="${hg_status}✘"
  fi
  if [[ "${hg_status_summary}" =~ .*!.* ]]; then
    hg_status="${hg_status}!"
  fi
  if [[ "${hg_status_summary}" =~ .*[?].* ]]; then
    hg_status="${hg_status}?"
  fi
  echo "[${hg_status}]"
fi
