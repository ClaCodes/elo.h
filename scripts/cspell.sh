#!/usr/bin/env bash
set -e
cspell -c ./.cspell/cspell.config.yaml --no-progress --no-summary --show-suggestions --no-cache --dot --gitignore "**"
