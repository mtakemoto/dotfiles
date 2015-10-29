inoremap jk <ESC>
map <Space> <Leader>
map <Leader> <Plug>(easymotion-prefix)

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'

"Custom Plugins
"-----------------------------------
Plugin 'easymotion/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Tell vim that the background is dark
set background=dark
" Solarized color scheme
try
  colorscheme solarized
catch
  colorscheme default
endtry

"Formatting
"--------------
"Convert tabs to spaces
set expandtab
"Tabs equal 2 columns
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set nowrap
set laststatus=2

"UI
"-----------------------------
set number
set showcmd
set noshowmode

"Backup
"----------------------------
set nobackup
set nowritebackup
set noswapfile

"Airline Customization
"----------------------------
let g:airline_theme='wombat'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
  let g:airline_left_sep=''
  let g:airline_right_sep=''
endif


