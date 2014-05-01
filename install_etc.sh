#!/bin/bash

set -x
stow -v -d ~/dotfiles -t /etc etc
