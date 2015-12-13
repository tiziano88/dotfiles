#!/bin/bash

ACCOUNT=$1
P="${HOME}/.passwd/${ACCOUNT}.gpg"

exec gpg --use-agent --quiet --batch -d ${P}
