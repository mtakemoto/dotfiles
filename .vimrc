"Key Remappings
"--------------------------------------
inoremap jk <ESC>
map <Space> <Leader>
map <Leader> <Plug>(easymotion-prefix)
map <C-a> <ESC>ggVG

"Map tab switching to double-tap on tab number
noremap 11 1gt
noremap 22 2gt
noremap 33 3gt
noremap 44 4gt
noremap 55 5gt
noremap 66 6gt
noremap 77 7gt
noremap 88 8gt
noremap 99 9gt
noremap 00 :tablast<cr>

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
Plugin 'scrooloose/syntastic'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Tell vim that the background is dark
set background=dark
" Make sure color is set to 256 for airline
set t_Co=256

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
"Enable code folding
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
set smartcase   "only search for uppercase chars when specified

"Backup
"----------------------------
set nobackup
set nowritebackup
set noswapfile

"Airline Customization
"----------------------------
let g:airline_theme='wombat'

"Remove special icons for portability
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
  let g:airline_left_sep=''
  let g:airline_right_sep=''
  let g:airline_extensions_whitespace_checks = ''
endif

"Syntastic Settings
"----------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
