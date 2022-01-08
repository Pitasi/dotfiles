function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

" Plugins
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'icymind/NeoSolarized'
Plug 'rakr/vim-one'
Plug 'robertmeta/nofrils'
Plug 'itchyny/lightline.vim'
Plug 'thaerkh/vim-workspace'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'hyhugh/coc-erlang_ls', {'do': 'yarn install --frozen-lockfile'}
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'puremourning/vimspector'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'tmhedberg/SimpylFold'
Plug 'mxw/vim-jsx'
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'qpkorr/vim-bufkill'
Plug 'vimwiki/vimwiki'
Plug 'ryanoasis/vim-devicons'
Plug 'kassio/neoterm'
Plug 'DougBeney/pickachu'
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'
Plug 'amix/vim-zenroom2'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'danilamihailov/beacon.nvim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " keep this at the end
call plug#end()

" Lightline
let g:lightline = {
\   'colorscheme': 'one',
\   'active': {
\       'left':[ [ 'mode', 'paste' ],
\                [ 'gitbranch', 'readonly', 'filename', 'modified' ]
\       ],
\       'right': [ [ 'lineinfo' ],
\                  [ 'filetype' ],
\                  [ 'fileformat', 'fileencoding' ] ]
\   },
\   'component': {
\       'lineinfo': ' %3l:%-2v',
\     },
\   'component_function': {
\       'gitbranch': 'fugitive#head',
\   }
\ }
let g:lightline.separator = {
\   'left': '', 'right': ''
\}
let g:lightline.subseparator = {
\   'left': '', 'right': ''
\}
set noshowmode

" CTRL-P
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_map = '<c-f>'
let g:ctrlp_use_caching = 1
let g:ctrlp_working_path_mode = 'ra'

" Basic
let g:python3_host_prog = '/usr/bin/python'
let mapleader=","
syntax on
set list " show tabs
set number
set relativenumber
set termguicolors

colorscheme one
set background=dark
" colorscheme NeoSolarized
" set background=light

set colorcolumn=80
nnoremap <leader><space> :nohlsearch<CR>
set mouse=a
set noshowmode
" hi Normal guibg=NONE  " make background transparent

set foldlevelstart=99

set ignorecase
set smartcase         " Use case insensitive search, except when using capital letters
set wildignorecase    " Use case insensitive search for filenames

" Make paste not replace the clipboard in visual mode
xnoremap p pgvy

" Undo persistent after close file
set undofile
set undodir=$HOME/.vim/undo
set undolevels=5000
set backupdir=~/.vim/backup
set dir=~/.vim/swap
set bk

set inccommand=nosplit  " preview replace

" Easily move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" same but for Terminal moe
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
" set expandtab
set autoindent

" Utilities
set title " append - NVIM to the window title
set spelllang=en,it
set splitbelow
set splitright
set clipboard=unnamedplus
let g:tex_flavor = "latex" " disambiguate .tex files to latex
let g:ale_linters_ignore = { 'tex': ['lacheck'] }
let g:ale_lint_on_text_changed = 'never'
" let g:LanguageClient_diagnosticsEnable = 0

" Buffer cycle shortcuts
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" Save file shortcut
:map <C-s> :w <Enter>

" Surround plugin custom commands
let g:surround_{char2nr('c')} = "\\\1command\1{\r}" " ysiwctextit<CR>

" Toggle comments with Ctrl-/
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle

" Exit terminal mode with <ESC>
tnoremap <Esc> <C-\><C-n>

" Language Server Protocol completions
" set hidden
" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['/usr/bin/rustup', 'run', 'stable', 'rls'],
"     \ 'javascript': ['flow', 'lsp'],
"     \ 'javascript.jsx': ['flow', 'lsp'],
"     \ 'python': ['/usr/bin/pyls'],
"     \ }
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_hoverPreview = "Never"
" let g:echodoc#enable_at_startup = 1
" let g:echodoc#type = 'signature'
" function SetLSPShortcuts()
"   nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
"   nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
"   nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
"   nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
"   nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
"   nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
"   nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
"   nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
"   nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
"   nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
" endfunction()

" augroup LSP
"   autocmd!
"   autocmd FileType python,rust,javascript call SetLSPShortcuts()
" augroup END

" Hide row numbers in terminal
au TermOpen * setlocal nonumber norelativenumber
au TermOpen * startinsert " insert mode when open terminal
:au BufEnter * if &buftype == 'terminal' | :startinsert | endif " insert mode when moving to terminal

" Autostart
" autocmd VimEnter * if argc() == 0 | NERDTree | endif
autocmd vimenter * wincmd p  " focus main window

" NERDTree
map <C-m> :NERDTreeToggle<CR>
" Close NERDTree after opening file
let NERDTreeQuitOnOpen=1
" close if NERDTree is last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree git plugin
let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
    \ "Modified"  : ["#ffd75f", 221, "NONE", "NONE"],
    \ "Staged"    : ["#00ff87", 49, "NONE", "NONE"],
    \ "Untracked" : ["#ff5f5f", 203, "NONE", "NONE"],
    \ "Dirty"     : ["#5fffff", 87, "NONE", "NONE"],
    \ "Clean"     : ["#87939A", 248, "NONE", "NONE"],
    \ "Ignored"   : ["#808080", 244, "NONE", "NONE"]
    \ }

let g:hardtime_default_on = 1

" Filetypes
filetype plugin on

autocmd FileType markdown,mkd,text,mail,rst,tex,textile,asciidoc call pencil#init()

" 2 spaces as tab for the following languages
au FileType html,rust,javascript,tex,css,scss,yaml setlocal
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

" 4 spaces
au FileType erlang setlocal
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
	\ expandtab

au FileType tex,markdown,vimwiki setlocal
    \ spell
    \ textwidth=79
au FileType tex imap <buffer> <A-b> \textbf{}<Left>
au FileType tex imap <buffer> <A-i> \textit{}<Left>
" Alt-b and Alt-i to surround selected text with bold/italic
au FileType tex vmap <buffer> <A-b> Sctextbf<CR>
au FileType tex vmap <buffer> <A-i> Sctextit<CR>

" GoLang + vim-go = WOW
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_fmt_command = "goimports" " auto imports
let g:go_auto_type_info = 1
let g:go_addtags_transform = "snakecase" " :GoAddTags automatic json tags!


" open 10 line terminal below
nnoremap <leader>o :below 10sp term://$SHELL<cr>

map <leader>vp :VimuxPromptCommand<cr>
map <leader>vl :VimuxRunLastCommand<cr>












" Sample COC configuration
" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ge <Plug>(coc-diagnostic-next)

nmap <silent> gR <Plug>(coc-refactor)

" C-space to trigger completions list
inoremap <silent><expr> <c-space> coc#refresh()

"""""""""""" Coc snippet  """"""""""""""""""
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <C-l> for trigger snippet expand.
imap <C-f> <Plug>(coc-snippets-expand)
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'






" Workspace sessions directory
" I use this only for session management, that's why autosave and undo history
" are disabled
set sessionoptions-=blank " ignore NerdTREE
let g:workspace_create_new_tabs = 0
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_persist_undo_history = 0
let g:workspace_autosave = 0




" vimwiki
let g:vimwiki_global_ext = 0
let wiki_1 = {}
let wiki_1.path = '~/keybase/private/zaphodias/vimwiki'
let wiki_1.path_html = '~/keybase/private/zaphodias/vimwiki_html'

let g:vimwiki_list = [wiki_1]





























" Fuzzy finder
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-s': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

nnoremap <C-p> :<C-u>Files<CR>
nnoremap <C-f> :<C-u>Rg<CR>
nnoremap <C-q> :<C-u>BLines<CR>
"nnoremap <leader>t :Tags<CR>

let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.95, 'height': 0.95,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files"


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
