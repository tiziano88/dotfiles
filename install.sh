#!/bin/bash

#ln -s -t ~ $PWD/.*

shopt -s dotglob

fname=${0#*/}

for f in *
do
  if [[ $f == ".git" || $f == $fname ]]
  then
    continue
  fi
  if [[ -L ~/$f ]]
  then
    rm ~/$f
  fi
  ln -s $PWD/$f ~/$f
  chmod 600 ~/$f
done
