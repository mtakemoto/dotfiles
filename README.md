Dotfiles Storage 
====================
For keeping Unix program configurations consistent across devices

## List of Programs
* Vim
* NeoVim (in .config/neovim)
* Bash
  * Colorscheme inspired by [@theMusician](https://github.com/theMusician)
* Tmux
  * Theme from /u/dothebarbwa's [post](https://www.reddit.com/r/unixporn/comments/3cn5gi/tmux_is_my_wm_on_os_x/) on reddit
* ZSH/Oh My ZSH
  * Theme from https://github.com/halfo/lambda-mod-zsh-theme
  
## Install
1. Clone the repository and run ```install.sh```.  
2. The script will symlink the files to their correct locations, asking for confirmation to replace if there is an existing file.
3. To enable powerline fonts for Vim/TMUX, install your favorite or clone from my other repository @ https://github.com/mtakemoto/fonts.

### ZSH
1. Clone the theme: https://github.com/halfo/lambda-mod-zsh-theme
2. Move the ```.zsh-theme``` file into ```~/.oh-my-zsh/themes```

### Neovim
1. Install the Plug plugin manager from the instructions at https://github.com/junegunn/vim-plug
2. Run ```neovim +Plug install```

### VIM 
Working on transitioning completely to Neovim, but for now on machines that don't support Neovim:
1. Install Vundle via the instructions at https://github.com/VundleVim/Vundle.vim
2. Run ```vim +PluginInstall```

### Tmux
1. Clone Tmux Plugin Manager (TPM)[https://github.com/tmux-plugins/tpm] with
```$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm```
Otherwise, tmux-resurrect (which saves sessions on logout/restart) won't work.  


## To Do
Automate all of the above
