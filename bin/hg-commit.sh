#!/usr/bin/env bash
hg id -i -B | awk 'NR=1 { if (length($2) != 0) { print $2 } else { print substr($1, 1, 9) } }'
