#!/bin/sh

splitpaths() {
    for path in "$@"; do
        if [ -z "$path" ]; then
            continue
        fi

        echo "$path" | awk -F/ '{ for (i = 1; i <= NF; i++) print $i }'
    done
}

splitpaths "$@"
