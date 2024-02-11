#!/usr/bin/env bash
set -e
find . \( -name "*.yaml" -o -name '*.yml' \) -exec yamllint --strict {} +
