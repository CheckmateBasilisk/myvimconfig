-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- packer manages itself
    use 'wbthomason/packer.nvim'
    
    -- File Browser
    --   :NERDTree
    use {'scrooloose/nerdtree', cmd = 'NERDTree'} --invoke on command only

    -- Color Schemes
    vim.cmd "set termguicolors"
    use {'AlessandroYorba/Alduin'}
    use {'morhetz/gruvbox'}

    -- Fuzzy File Finder (use to search for contents)
    --   :Files <query>
    --   :Rg <query> --searches for file contents, requires ripgrep
    -- use 'junegunn/fzf', { 'do': { -> fzf#install() } } 
    --   fzf#install() makes sure that you have the latest binary, but it's optional, so you can omit it if you use a plugin manager that doesn't support hooks.
    use {'junegunn/fzf'}
    use {'junegunn/fzf.vim'}

    -- Table of contents for markdown
    --   :GenTocGFM --Generate table of contents in GFM link style
    use{'mzlogin/vim-markdown-toc'}

    -- https://vimawesome.com/plugin/ultisnips
    --Plug 'sirver/ultisnips'

    use { --UNAVAILABLE IN NVIM <7 ??
        "neovim/nvim-lspconfig",
        "williamboman/nvim-lsp-installer"
    }
    --[[
    -- Autocompletion
    ---- THIS IS A MASSIVE RABBIT HOLE I'M NOT WILLING TO DIVE FURTHER FOR NOW
    ---- configs for language server protocol, needed for other plugins
    use { --UNAVAILABLE IN NVIM <7
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    --   hardcore autocomplete
    --   https://github.com/ms-jpq/coq_nvim
    --Plug 'ms-jpq/coq_nvim', {'branch': 'coq'} -- main one
    --Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'} -- 9000+ snippets
    --]]
    use {'ms-jpq/coq_nvim', branch = 'coq'}
    --[[
        Please update dependencies using :COQdeps
        Dependencies will be installed privately inside `/home/lucasnascimento/.local/share/nvim/site/pack/packer/start/coq_nvim/.vars`
        `rm -rf coq_nvim` will cleanly remove everything
    --]]
end)

----- OLD INIT.VIM -----
--[[
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

"colorscheme vimspectrgrey-dark
let g:gruvbox_contrast_dark='hard'
set bg=dark
colorscheme gruvbox

--]]
