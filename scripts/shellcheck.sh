#!/usr/bin/env bash
set -e
find . -name "*.sh" -exec shellcheck "$@" {} +
