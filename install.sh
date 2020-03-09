#!/bin/bash

##TODO: use a map to for file -> link for single ln with params
##TODO: install ZSH
##TODO: install Oh-my-zsh
##TODO: install nvim
##TODO: install lambda-mod zsh theme
##TODO: after all of the above, then copy files so ZSH theme applies
##TODO: nvim plugin install

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

## Link NeoVim config first
ln -svf "$DIR/.config/nvim/init.vim" ~/.config/nvim/init.vim

## List of files to symlink in home dir
declare -a files=(".bashrc"
                  ".profile"
                  ".bash_profile"
                  ".tmux.conf"
                  ".zshrc"
                  )

## Symlink files to destination
## Prompt for each if removal is needed
for i in "${files[@]}"
do
  ln -siv "$(pwd)/$i" $HOME
done
