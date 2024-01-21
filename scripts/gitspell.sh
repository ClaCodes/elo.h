#!/usr/bin/env bash
set -e
printf "cspell version %s\n" "$(cspell --version)"
git log | cspell stdin -c ./.cspell/cspell.config.yaml --no-progress --no-summary --show-context --show-suggestions --no-cache
