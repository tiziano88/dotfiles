#!/bin/bash

set -x

GO_PACKAGES=(
  github.com/golang/lint/golint
  github.com/jstemmer/gotags
  github.com/nsf/gocode
  golang.org/x/tools/cmd/goimports
  golang.org/x/tools/cmd/oracle
)

go get "${GO_PACKAGES[@]}"
