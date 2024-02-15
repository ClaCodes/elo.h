#!/usr/bin/env bash
export YAMLFIX_LINE_LENGTH="70"

EXIT_CODE=0

FILES=$(find . \( -name "*.yaml" -o -name '*.yml' \))
for FILE in $FILES; do
    if [ "$1" == "--diff" ]; then
        cp "$FILE" "$FILE.temp"
        yamlfix "$FILE.temp" 2>/dev/null
        diff --unified "$FILE.temp" "$FILE"
        rm "$FILE.temp"
    elif [ "$1" == "--apply" ]; then
        yamlfix "$FILE"
    else
        if ! yamlfix "$FILE" --check 2>/dev/null; then
            printf "%s;; \`yamlfix\` would format this file. Use \`./scripts/yamlfix.sh --diff\` to see the changes it would make and \`./scripts/yamlfix.sh --apply\` to apply them.\n" "$FILE"
            EXIT_CODE=1
        fi
    fi
done

exit "$EXIT_CODE"
