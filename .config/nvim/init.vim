"Important Key Remappings
"--------------------------------------
inoremap jk <ESC>
syntax enable
map <Leader> <Plug>(easymotion-prefix)
let mapleader=","

"Shortcuts
"--------------------------------
"Set key sequence for function keys
set <F2>=<C-v><F2>
nnoremap <F3> :set invpaste<cr>
set <F5>=<C-v><F5>

"Quick new tab shortcut
noremap <C-t> :tabnew<cr>
"Edit vimrc in new split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"Reindent shortcut (cheap autoformat)
nnoremap <leader>ri gg=G<C-o><C-o>

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
"Automatically remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

"CoC Configuration
"--------------------------------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" TODO: note - this interferes with bracket autocomplete on <cr> - not cool
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" if has('patch8.1.1068')
"   " Use `complete_info` if your (Neo)Vim version supports it.
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"Default CoC Plugins
"--------------------------------
let g:coc_global_extensions = [
 \'coc-omnisharp',
 \'coc-tsserver',
 \'coc-eslint',
 \'coc-prettier',
 \'coc-css',
 \]

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

"Git integration
Plug 'tpope/vim-fugitive'

"Easily change surrounding text object pairs
Plug 'tpope/vim-surround'

"Cleaner & easier to use file navigation
Plug 'tpope/vim-vinegar'

"File system tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"Allow colored icons/text in nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"Easy vscode-style code commenting
Plug 'tpope/vim-commentary'

"Code autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"All-in-one syntax support
Plug 'sheerun/vim-polyglot'

"Bracket autocompletion for the vscode experience
"Plug 'Raimondi/delimitMate'

"Custom swag icons
Plug 'ryanoasis/vim-devicons'

"Code Autoformat
"post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"Switch between vim and tmux splits
Plug 'christoomey/vim-tmux-navigator'

"Docker-compose
Plug 'skanehira/docker-compose.vim', { 'for': 'yaml' }
Plug 'skanehira/docker.vim', { 'for': 'yaml' }

"Hex color highlighting
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

"Color Schemes
"---------------------------------
Plug 'mhartington/oceanic-next'

call plug#end()

"------------------------------------------------

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
let g:airline_powerline_fonts = 1
"Remove special icons for portability

set noshowmode
"only search for uppercase chars when specified in search
"use \c to force case sensitive

"NERDTree
"----------------------------
nnoremap <C-n> :NERDTreeToggle<CR>
"Close if only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Chromatica
"----------------------------
let g:chromatica#libclang_path='/usr/local/opt/llvm/lib'

"JavaComplete2
"----------------------------
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"Delimitmate
"----------------------------
"Put cursor in code-writing position after open bracket --> enter
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expression = 1

"Closetag
"----------------------------
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,typescriptreact,javascriptreact'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

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

"Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"Hexokinase Settings
let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript', 'scss', 'yaml', 'htmldjango' ]
