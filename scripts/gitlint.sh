#!/usr/bin/env bash
gitlint --commits "$(git rev-parse --abbrev-ref HEAD)"

