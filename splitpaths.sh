#!/bin/sh

splitpaths() {
    if [ "$#" -eq 0 ]; then
        while IFS= read -r line; do
            [ -z "$line" ] && continue
            echo "$line" | awk -F/ '{ for (i = 1; i <= NF; i++) if ($i != "") print $i }'
        done
    else
        for path in "$@"; do
            [ -z "$path" ] && continue
            echo "$path" | awk -F/ '{ for (i = 1; i <= NF; i++) if ($i != "") print $i }'
        done
    fi
}

splitpaths "$@"
