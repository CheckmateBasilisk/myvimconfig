" This file should be at ~/.config/nvim/init.vim

" this runs lua code, since NVIM has an embedded runtime for it
" load plugin manager and plugins from lua file @ ~/.config/nvim/user/plugins.lua
lua require('user.plugins')
" additional config in lua @ ~/.config/nvim/user/config.lua
lua require('user.config')

"colorscheme vimspectrgrey-dark
let g:gruvbox_contrast_dark='hard'
set bg=dark
colorscheme gruvbox

set guicursor=i:block " for NVIM, makes cursor a block, not a bar
set cursorline " highlights current line
set mouse=a " enable mouse interaction
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

" line count
set number
" adds a column (gutter) to the left so diagnostics don't push text aside every time
set signcolumn=yes
set signcolumn=number "puts gutter inside the line count
"highlight SignColumn guibg=darkgrey " gutter color
"highlight clear SignColumn " same color as bg

let $MYCONFIG_DIR="~/.config/nvim"
command Config vsplit $MYCONFIG_DIR
command ConfigReload source $MYVIMRC

set clipboard=unnamedplus   " using system clipboard
