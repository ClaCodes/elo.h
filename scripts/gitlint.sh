#!/usr/bin/env bash
set -e
BRANCH=$(git rev-parse --abbrev-ref HEAD)
gitlint --commits "$BRANCH"

