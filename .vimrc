:set shiftwidth=4
:set tabstop=4
:set expandtab
:set smarttab

:set mouse=
:syntax enable

call plug#begin()

" COLOR SCHEMES
:set termguicolors
Plug 'tomasr/molokai'
let g:molokai_original = 1
Plug 'AlessandroYorba/Alduin'
Plug 'nightsense/carbonized'
Plug 'nightsense/vimspectr'
Plug 'morhetz/gruvbox'

"Plug 'tpope/vim-sensible'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTree' }
autocmd! User nerdtree echom 'NERDTree is now loaded!'

Plug 'junegunn/vim-easy-align', { 'on': 'EasyAlign' }
autocmd! User vim-easy-align echom 'EasyAlign is now loaded!'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
autocmd! User goyo.vim echom 'Goyo is now loaded!'
autocmd! User goyo.vim Goyo

Plug 'mzlogin/vim-markdown-toc'

Plug 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

call plug#end()

"colorscheme vimspectrgrey-dark
let g:gruvbox_contrast_dark='hard'
:set bg=dark
colorscheme gruvbox

":filetype indent off
":syntax off
:filetype indent off
