#!/usr/bin/env bash
set -o xtrace

stow meituan
stow dev
# Do no stow python zsh
stow zsh
