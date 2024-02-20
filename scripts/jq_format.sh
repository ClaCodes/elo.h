#!/usr/bin/env bash
EXIT_CODE=0
FILES=$(find . -name "*.json")
for FILE in $FILES; do
  if jq . "$FILE" >"$FILE.temp" 2>"$FILE.err"; then
    if ! diff --unified "$FILE" "$FILE.temp" >"$FILE.diff"; then
      EXIT_CODE=1
      if [ "$1" == "--diff" ]; then
        cat "$FILE.diff"
      elif [ "$1" == "--apply" ]; then
        cp "$FILE.temp" "$FILE"
      else
        printf "%s;; \`jq\` would format this file. Use \`./scripts/jq_format.sh --diff\` to see the changes it would make and \`./scripts/jq_format.sh --apply\` to apply them.\n" "$FILE"
      fi
    fi
    rm "$FILE.diff"
  fi
  rm "$FILE.temp"
  rm "$FILE.err"
done

exit "$EXIT_CODE"
