"Important Key Remappings
"--------------------------------------
inoremap jk <ESC>
syntax enable
map <Space> <Leader>
map <Leader> <Plug>(easymotion-prefix)

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
"Edit vimrc in new split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"Reindent shortcut (cheap autoformat)
nnoremap <leader>ri gg=G<C-o><C-o>

"More Key Remappings
"--------------------------------
"-->Tab Navigation
"Map tab switching
nnoremap H gT
nnoremap L gt

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

"-->Autocomplete mappings for CoC
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"Formatting
"--------------
"Convert tabs to spaces
set expandtab
"Tabs equal 2 columns
set tabstop=2
"Enable code folding
set shiftwidth=2
"Enable line numbers
set number
set autoindent
set smartindent
set nowrap
set laststatus=2

"Searching for capital letters automatically  enables case-senstitive
"Otherwise, ignore case.
set ignorecase
set smartcase

"Vim Plug AutoInstall
"-------------------------------
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins
"--------------------------------
call plug#begin('~/.config/nvim/plugged')

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

"Code formatting via prettier (:Prettier)
"post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"Code autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Syntax Support Plugins
"---------------------------------
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'modess/vim-phpcolors'
Plug 'jelera/vim-javascript-syntax'
Plug 'arakashic/chromatica.nvim'
Plug 'yuezk/vim-js'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'PProvost/vim-ps1'

"Color Schemes
"---------------------------------
Plug 'mhartington/oceanic-next'

call plug#end()

"------------------------------------------------

"Default CoC Plugins
"--------------------------------
let g:coc_global_extensions=[ 'coc-omnisharp', 'coc-tsserver', 'coc-eslint', 'coc-css']


"Color Scheme Configuration
"--------------------------------
set background=dark

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

try
  colorscheme OceanicNext
catch
  colorscheme default
endtry

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=""
endif

"Custom Commands
"----------------------------
command! ReloadBG :set t_ut= <bar> :redraw!

"Filetype Settings
"----------------------------
autocmd BufNewFile,BufRead Gemfile* set filetype=ruby
autocmd BufNewFile,BufRead Vagrantfile* set filetype=ruby
autocmd BufNewFile,BufRead Puppetfile* set filetype=ruby

"Airline Customization
"----------------------------
let g:airline_theme='oceanicnext'
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
