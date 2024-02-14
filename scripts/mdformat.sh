#!/usr/bin/env bash
mdformat --version
EXIT_CODE=0
FILES=$(find . -name "*.md")
for FILE in $FILES; do
    if [ "$1" == "--diff" ]; then
        cp "$FILE" "$FILE.temp"
        mdformat "$FILE.temp"
        if ! diff --unified "$FILE" "$FILE.temp"; then
            EXIT_CODE=1
        fi
        rm "$FILE.temp"
    elif [ "$1" == "--apply" ]; then
        mdformat "$FILE"
    else
        if ! mdformat --check "$FILE" 2>/dev/null; then
            printf "%s;; \`mdformat\` would format this file. It should comply with CommonMark. Use \`./scripts/mdformat.sh --diff\` to see the changes it would make and \`./scripts/mdformat.sh --apply\` to apply them.\n" "$FILE"
            EXIT_CODE=1
        fi
    fi
done

exit "$EXIT_CODE"
