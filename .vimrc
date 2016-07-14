"Important Key Remappings
"--------------------------------------
inoremap jk <ESC>
syntax on
map <Space> <Leader>
map <Leader> <Plug>(easymotion-prefix)
map <C-a> <ESC>ggVG

"Shortcuts
"--------------------------------
"Set key sequence for function keys
set <F2>=<C-v><F2>
map <F3> :set invpaste<cr>
set <F5>=<C-v><F5>
"Quick new tab shortcut
noremap <C-t> :tabnew<cr>
"Clear trailing whitespace
noremap <F2> :%s/\s\+$//

set nocompatible              " be iMproved, required
filetype off                  " required

"Vundle Begin
"---------------------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"General Plugins
"-----------------------------------
"Close HTML tags on <C-_>
Plugin 'alvan/vim-closetag'

"Nicer & more informative status bar
Plugin 'bling/vim-airline'

"Seamless navigation between vim & tmux panes
Plugin 'christoomey/vim-tmux-navigator'

"Fuzzy finding files and recently used pane
Plugin 'ctrlpvim/ctrlp.vim'

"Magic navigation & position jumping
Plugin 'easymotion/vim-easymotion'

"Better support for NodeJS
Plugin 'moll/vim-node'

"Bracket completion on enter, parentheses, etc
Plugin 'rstacruz/vim-closer'

"Syntax checker
Plugin 'scrooloose/syntastic'

"Completion for scripting languages 'endif' tags
Plugin 'tpope/vim-endwise'

"Git integration
Plugin 'tpope/vim-fugitive'

"Easily change surrounding text object pairs
Plugin 'tpope/vim-surround'

"Cleaner & easier to use file navigation
Plugin 'tpope/vim-vinegar'

"Code completion
Plugin 'Valloric/YouCompleteMe'

"Install most default airline themes for compatibility
Plugin 'vim-airline/vim-airline-themes'

"Syntax Support Plugins
"---------------------------------
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'modess/vim-phpcolors'
Plugin 'jelera/vim-javascript-syntax'

"Color Schemes
"---------------------------------
Plugin 'altercation/vim-colors-solarized'

"Vundle End
"---------------------------------
"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"More Key Remappings
"--------------------------------
"-->Tab Navigation
"Map tab switching to Space<tab#>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

"-->Search Remappings
"Disable search hightlighting until next search
nnoremap <leader>l :nohlsearch<CR>
"Toggle search highlighting
nnoremap <leader>h :set hlsearch!<CR>
"Toggle incremental search
nnoremap <leader>i :set incsearch!<CR>
"Enable/disable search hl on leaving and entering insert mode
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch

"Color Scheme
"--------------------------------
" Tell vim that the background is dark
set background=dark
" Make sure color is set to 256 for airline
set t_Co=256
" Turn on syntax highlighting
syntax on

" Solarized color scheme
try
  colorscheme solarized
catch
  colorscheme default
endtry

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
"
" Set specific color schemes for different file types
"
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
"enable tab numbers
set number
"helpful output of the command being entered
set showcmd
"hide because airline handles mode display
set noshowmode
"only search for uppercase chars when specified in search
"use \c to force case sensitive
set smartcase
set ignorecase
"Turn on incremental and highlight search by default
set incsearch
set hlsearch

"Backup
"----------------------------
set nobackup
set nowritebackup
set noswapfile

"Custom Commands
"----------------------------
command ReloadBG :set t_ut= <bar> :redraw!

"Filetype Settings
"----------------------------
autocmd BufNewFile,BufRead Gemfile* set filetype=ruby
autocmd BufNewFile,BufRead Vagrantfile* set filetype=ruby
autocmd BufNewFile,BufRead Puppetfile* set filetype=ruby

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

"Ctrl-P Settings
"----------------------------
let g:ctrlp_map = '<c-p>'
"Set MRU as the default mode on opening
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_show_hidden = 1

"Use Silver Searcher (ag) if installed
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
