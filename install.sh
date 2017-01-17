#!/bin/bash

## Link NeoVim config first
ln -sv "$(pwd)/.config/nvim" ~/.config/

## List of files to symlink in home dir
declare -a files=(".bashrc"
                  ".profile"
                  ".tmux.conf"
                  )

## Symlink files to destination
## Prompt for each if removal is needed
for i in "${files[@]}"
do
  ln -siv "$(pwd)/$i" $HOME
done
