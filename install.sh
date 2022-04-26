#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DIRNAME="$(dirname "$BASH_SOURCE")"
PACKAGE_LIST="zsh tmux neovim tree httpie"
CUSTOM_FONT_DIR=/usr/share/fonts/truetype/customfonts

## List of files to symlink in home dir
declare -a files=(".bashrc"
                  ".profile"
                  ".bash_profile"
                  ".tmux.conf"
                  ".zshrc"
                  )

## -----------------------
## Bootstrap
echo "${bold}Bootstrapping...${normal}"
sudo apt-get update
sudo apt-get install curl wget aptitude git software-properties-common

## Package repositories
echo "${bold}Adding repositories...${normal}"
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update

## Install packages
# sudo apt-get install -y git zsh tmux tree httpie
echo "${bold}Installing packages...${normal}"
sudo aptitude install -y $PACKAGE_LIST

## Install oh-my-zsh
echo "${bold}Installing Oh-my-zsh...${bold}"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

## Link NeoVim config first
echo "${bold}Linking config files...${bold}"
mkdir -p ~/.config/nvim
ln -svf "$DIR/.config/nvim/init.vim" ~/.config/nvim/init.vim


## Symlink files to destination
## Prompt for each if removal is needed
for i in "${files[@]}"
do
  ln -siv "$(pwd)/$i" $HOME
done

## Copy theme
echo "Copying theme"
cp -v "$DIR/lambda-mod.zsh-theme" ~/.oh-my-zsh/themes/lambda-mod.zsh-theme

## Enable Git Credential Manager
echo "Enable Git Credential Manager on WSL?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager-core.exe"; break;;
        No ) exit;;
    esac
done

## Neovim setup
echo "${bold}Installing neovim plugins....${normal}"
neovim +PlugInstall +qall

## Fonts
echo "${bold}Installing fonts...${normal}"
sudo mkdir $CUSTOM_FONT_DIR
sudo cp "$DIR/fonts/*.ttf" $CUSTOM_FONT_DIR
sudo fc-cache -fv

echo ${bold}Done! :D${normal}"
