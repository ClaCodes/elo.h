#!/usr/bin/env bash
EXIT_CODE=0
if [ "$1" == "--diff" ]; then
    shfmt -i 4 -s -d .
    EXIT_CODE=$?
elif [ "$1" == "--apply" ]; then
    shfmt -i 4 -s -w .
    EXIT_CODE=$?
else
    FILES=$(shfmt -i 4 -s -l .)
    for FILE in $FILES; do
        printf "%s;; \`shfmt\` would format this file. Use \`./scripts/shfmt.sh --diff\` to see the changes it would make and \`./scripts/shfmt.sh --apply\` to apply them.\n" "$FILE"
        EXIT_CODE=1
    done
fi
exit "$EXIT_CODE"
