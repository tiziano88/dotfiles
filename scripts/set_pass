#!/bin/bash

ACCOUNT=$1
PASS=$2
exec echo "$PASS" | gpg --use-agent -e > ~/.passwd/$ACCOUNT.gpg
