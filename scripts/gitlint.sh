#!/usr/bin/env bash
set -e
BRANCH=$(git rev-parse --abbrev-ref HEAD)
gitlint --version
printf "Documentation: https://jorisroovers.com/gitlint/latest/\n\n"
gitlint --commits "$BRANCH"
