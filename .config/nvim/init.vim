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
map <F5>= :so $MYVIMRC<cr>
"Quick new tab shortcut
noremap <C-t> :tabnew<cr>
"Clear trailing whitespace
noremap <F2> :%s/\s\+$//

"Plugins
"--------------------------------
call plug#begin('~/.vim/plugged')

"!--All Single Quotes--!
"
"Close HTML tags on <C-_>
Plug 'alvan/vim-closetag'

"Nicer & more informative status bar w/ themes
Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes'

"Seamless navigation between vim & tmux panes
Plug 'christoomey/vim-tmux-navigator'

"Fuzzy finding files and recently used pane
Plug 'ctrlpvim/ctrlp.vim'

"Magic navigation & position jumping
Plug 'easymotion/vim-easymotion'

"Better support for NodeJS
Plug 'moll/vim-node'

"Bracket completion on enter, parentheses, etc
Plug 'rstacruz/vim-closer'

"Completion for scripting languages 'endif' tags
Plug 'tpope/vim-endwise'

"Git integration
Plug 'tpope/vim-fugitive'

"Easily change surrounding text object pairs
Plug 'tpope/vim-surround'

"Cleaner & easier to use file navigation
Plug 'tpope/vim-vinegar'

"File system tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"Code autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'artur-shaik/vim-javacomplete2'
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neco-vim'

"Syntax Support Plugins
"---------------------------------
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'modess/vim-phpcolors'
Plug 'jelera/vim-javascript-syntax'
Plug 'arakashic/chromatica.nvim'

"Color Schemes
"---------------------------------
Plug 'altercation/vim-colors-solarized'

call plug#end()

"------------------------------------------------

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
set background=dark

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

"Custom Commands
"----------------------------
command ReloadBG :set t_ut= <bar> :redraw!

"Filetype Settings
"----------------------------
autocmd BufNewFile,BufRead Gemfile* set filetype=ruby
autocmd BufNewFile,BufRead Vagrantfile* set filetype=ruby
autocmd BufNewFile,BufRead Puppetfile* set filetype=ruby

"Deoplete Settings
"----------------------------
let g:deoplete#enable_at_startup=1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

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
set noshowmode
"only search for uppercase chars when specified in search
"use \c to force case sensitive

"NERDTree
"----------------------------
map <C-n> :NERDTreeToggle<CR>
"Close if only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Chromatica
"----------------------------
let g:chromatica#libclang_path='/usr/local/opt/llvm/lib'

"JavaComplete2
"----------------------------
autocmd FileType java setlocal omnifunc=javacomplete#Complete

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
