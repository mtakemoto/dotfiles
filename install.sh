#!/bin/bash

##TODO: use a map to for file -> link for single ln with params
##TODO: install ZSH
##TODO: install Oh-my-zsh
##TODO: install lambda-mod zsh theme
##TODO: nvim plugin install

## Link NeoVim config first
ln -svf "$(pwd)/.config/nvim" ~/.config/

## List of files to symlink in home dir
declare -a files=(".bashrc"
                  ".profile"
                  ".tmux.conf"
		  ".zshrc"
                  )

## Symlink files to destination
## Prompt for each if removal is needed
for i in "${files[@]}"
do
  ln -siv "$(pwd)/$i" $HOME
done
