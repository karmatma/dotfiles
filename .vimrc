set nocompatible

let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

" set a vertical line indicating the max line length for readability
set colorcolumn=100

filetype off
syntax on

" Set eader key as SPACE
let mapleader="\<space>"
nnoremap <leader>c :botright term<CR>

set number
set rnu
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" Clear search field by pressing leader + space
" This is to get rid of annoying search highlight persist even after 
" the search job is done
map <leader><space> :let @/=''<cr>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2 smarttab
set noshiftround

" Show file stats
set ruler

" Blink cursor on error instead of beeping
set visualbell

" Encoding
set encoding=utf-8

" whitespace
set wrap
set textwidth=100
set formatoptions=tcqrn1

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
" Use % to jump between pairs
set matchpairs+=<:>
runtime! macros/matchit.vim

" Allow hidden buffers
set hidden

" Rendering
set ttyfast
" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

if $COLORTER == 'truecolor'
    set termguicolors
endif

filetype plugin indent on

" TODO: No idea what this is
set modelines=0

" Plugins additions using Vim-Plug plugin manager
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'yegappan/lsp'
Plug 'dense-analysis/ale'
Plug 'bluz71/vim-mistfly-statusline'
Plug 'sainnhe/sonokai'
Plug 'sheerun/vim-polyglot'
call plug#end()

" Colorscheme settings
colorscheme sonokai
highlight! link MistflyNormal DiffChange
highlight! link MistflyInsert WildMenu
highlight! link MistflyVisual IncSearch
highlight! link MistflyCommand WildMenu
highlight! link MistflyReplace ErrorMsg

" FZF settings
nnoremap <silent> <leader>/ :Lines<CR>
nnoremap <silent> <leader>F :Ag<CR>
nnoremap <silent> <leader>b :Buffers <CR>
nnoremap <silent> <leader>sf :GFiles<CR>
nnoremap <silent> <leader>sF :Files<CR>

" Map buffer switch keys - TODO: not sure what this is
nnoremap <silent> <leader><Tab> <C-^>

" LSP Settings --- LSP settings ---------------------------------------------------"
let lspOptions = #{ 
    \ aleSupport: v:true, 
    \ autoHighlight: v:true, 
    \ completionTextEdit: v:true, 
    \ noNewlineInCompletion: v:true, 
    \ outlineOnRight: v:true, 
    \ outlineWinSize: 70, 
    \ showDiagWithSign: v:false, 
    \ useQuickfixForLocations: v:true, 
    \ } 
autocmd VimEnter * call LspOptionsSet(lspOptions) 
let lspServers = [ 
    \ #{name: 'luals', 
        \ filetype: 'lua', 
        \ path: '/home/shunti/.local/share/nvim/mason/bin/lua-language-server', 
        \ args: [], 
        \ }, 
    \ #{ name: 'rustanalyzer', 
        \ filetype: ['rust'], 
        \ path: '/home/shunti/.local/share/nvim/mason/bin/rust-analyzer',
        \ args: [], 
        \ syncInit: v:true, 
    \ }] 
autocmd VimEnter * call LspAddServer(lspServers) 

"\ path: '/home/shunti/.cargo/bin/rust-analyzer', 
"Enable auto selection of the fist autocomplete item"
augroup LspSetup 
    au! 
    au User LspAttached set completeopt-=noselect 
augroup END 

"Disable newline on selecting completion option" 
inoremap <expr> <CR> pumvisible() ? "\<C-Y>": "\<CR>"

"Mappings for most-used functions"
nnoremap <leader>K :LspHover<CR> 
nnoremap <leader>gd :LspGotoDefinition<CR> 
nnoremap <leader>gD :LspGotoDeclaration<CR> 
nnoremap <leader>gI :LspGotoImpl<CR> 
nnoremap <leader>pd :LspPeekDefinition<CR> 
nnoremap <leader>R :LspRename<CR> 
nnoremap <leader>gR :LspPeekReferences<CR> 
nnoremap <leader>gr :LspShowReferences<CR> 
nnoremap <leader>ss :LspShowSignature<CR> 
nnoremap <leader>sg :LspSymbolSearch<CR> 
nnoremap <leader>o :LspDocumentSymbol<CR> 
nnoremap <leader>ca :LspCodeAction<CR> 
nnoremap <leader>ee :LspDiag current<CR> 
nnoremap <leader>]d :LspDiag next<CR> 
nnoremap <leader>[d :LspDiag prev<CR> 

"--- ALE settings ------------------------------------------------------" 
"Disable ALE's LSP in favour of standalone LSP plugin" 
let g:ale_disable_lsp = 1 
"Show linting errors with highlights" 
"* Can also be viewed in the loclist with :lope" 
let g:ale_set_signs = 1 
let g:ale_set_highlights = 1 
let g:ale_virtualtext_cursor = 1 
highlight ALEError ctermbg=none cterm=underline 

"Define when to lint" 
let g:ale_lint_on_save = 1 
let g:ale_lint_on_insert_leave = 1 
let g:ale_lint_on_text_change = 'never' 
"Set linters for individual filetypes" 
let g:ale_linters_explicit = 1 
" let g:ale_linters = { 
"    \ 'rust': ['cargo'], 
" \ } 

"Don't warn about trailing whitespace, as it is auto-fixed by '*' above" 
let g:ale_warn_about_trailing_whitespace = 0 
"Show info, warnings, and errors; Write which linter produced the message" 
let g:ale_lsp_show_message_severity = 'information' 
let g:ale_echo_msg_format = '[%linter%] [%severity%:%code%] %s'
"Specify Containerfiles as Dockerfiles" 
let g:ale_linter_aliases = {"Containerfile": "dockerfile"} 
"Mapping to run fixers on file" 
nnoremap <leader>L :ALEFix<CR>


