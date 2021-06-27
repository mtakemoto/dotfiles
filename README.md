Dotfiles Storage
====================
For keeping Unix (and Windows) program configurations consistent across devices

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

### Powershell
1. Read https://blogs.technet.microsoft.com/heyscriptingguy/2012/05/21/understanding-the-six-powershell-profiles/ to configure for the desired user, host and environment options
2. Use $Home\Documents\Profile.ps1 for current user, all hosts

If using Powershell 7...
1. `echo $PSHOME`
1. Will likely be in `C:\Program Files (x86)\Powershell\7`
1. Copy/paste `Profile.ps1` there
1. Run `Install-Module posh-git -Scope CurrentUser -Force -AllowClobber` (don't use Choco)
1. ^ See https://github.com/dahlbyk/posh-git/issues/734
1. Done!
