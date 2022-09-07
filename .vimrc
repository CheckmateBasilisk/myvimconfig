call plug#begin()

    " COLOR SCHEMES
    set termguicolors
    Plug 'tomasr/molokai'
    let g:molokai_original = 1
    Plug 'AlessandroYorba/Alduin'
    Plug 'morhetz/gruvbox'

    " File Browser
    "   :NERDTree
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTree' }

    " Fuzzy File Finder (use to search for contents)
    "   fzf <query>
    "   Rg <query> "searches for file contents, requires ripgrep
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " alignment for tables (useful for .md)
    Plug 'junegunn/vim-easy-align', { 'on': 'EasyAlign' }
    autocmd! User vim-easy-align echom 'EasyAlign is now loaded!'
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)

    " Table of contents for markdown
    "   :GenTocGFM "Generate table of contents in GFM link style
    Plug 'mzlogin/vim-markdown-toc'

    " https://vimawesome.com/plugin/ultisnips
    "Plug 'sirver/ultisnips'

    " Autocompletion

    "" THIS IS A MASSIVE RABBIT HOLE I'M NOT WILLING TO DIVE FURTHER FOR NOW
    "" configs for language server protocol, needed for other plugins
    "Plug 'williamboman/mason.nvim'
    "Plug 'williamboman/mason-lspconfig.nvim'
    "Plug 'neovim/nvim-lspconfig'
    "" hardcore autocomplete
    "" https://github.com/ms-jpq/coq_nvim
    "Plug 'ms-jpq/coq_nvim', {'branch': 'coq'} " main one
    "Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'} " 9000+ snippets

call plug#end()

" this runs lua code, since NVIM has an embedded runtime for it
lua << EOF
    require("user.config")
EOF

"colorscheme vimspectrgrey-dark
let g:gruvbox_contrast_dark='hard'
set bg=dark
colorscheme gruvbox

set guicursor=i:block " for NVIM, makes cursor a block, not a bar
set cursorline " highlights current line
set mouse=a " enable mouse interaction
set clipboard=unnamedplus   " using system clipboard
"set encoding=UTF-8 " NVIM uses utf-8 by default

" setting up proper tabs
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

" removing autoindent
filetype indent off
set noai
" removing autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
