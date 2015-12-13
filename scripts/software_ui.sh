#!/bin/bash

set -x

# to install:
SOFTWARE=(
  colortest
  fonts-mplus
  fonts-ubuntu-font-family-console
  keychain
  ksnapshot
  ntfs-3g
  parcellite
  parted
  redshift
  redshift-gtk
  rxvt-unicode
  sgt-puzzles
  xdotool
  xfonts-terminus
  xfonts-terminus-oblique
  xmobar
  xmonad
  xzoom
)

sudo apt-get install "${SOFTWARE[@]}"