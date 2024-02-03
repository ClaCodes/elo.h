#!/usr/bin/env bash
echo "$2<<EOF"
echo "# $1"
$1
EXIT_CODE=$?
echo "*returned with exit code $EXIT_CODE*"
echo EOF
exit $EXIT_CODE
