#!/usr/bin/env bash
EXIT_CODE=0
FILES=$(find . -name "*.json")
for FILE in $FILES; do
    if ! jq . "$FILE" >"$FILE.temp" 2>"$FILE.err"; then
        EXIT_CODE=1
        printf "%s;;%s\n" "$FILE" "$(<"$FILE.err")"
    fi
    rm "$FILE.temp"
    rm "$FILE.err"
done

exit "$EXIT_CODE"
