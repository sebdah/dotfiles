#!/usr/bin/env bash
COMMIT_ID="$(hg id -i)"
hg bookmarks --list-subscriptions | awk '{ map[$2] = $1; } END { if ("'"$COMMIT_ID"'" in map) { print "(" map["'"$COMMIT_ID"'"] ")"; } }'
