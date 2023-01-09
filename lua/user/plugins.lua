-- PLUGINS:  https://neovimcraft.com/

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- packer manages itself
    use 'wbthomason/packer.nvim'

    -- treesitter is a language parser
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- File Browser
    --   :NERDTree
    use {'scrooloose/nerdtree', cmd = {'NERDTree', 'NT'} } --invoke on command only

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

    use { --UNAVAILABLE IN NVIM <7
        "williamboman/mason.nvim", -- LSP manager, like apt
        "williamboman/mason-lspconfig.nvim", -- bridges mason and lspconfig
        "neovim/nvim-lspconfig",
    }
    -- starting mason
    require("mason").setup()
    require("mason-lspconfig").setup()

    --  TODO: add lazy loading based on filetype
    -- 'activating' lsp servers
        --use _ instead of - !!!
    require("lspconfig").clangd.setup {}
    require("lspconfig").jedi_language_server.setup{}
    require("lspconfig").sumneko_lua.setup {}
    require("lspconfig").rust_analyzer.setup {}
    --[[
        :Mason ; choose and install LSPs
            while editing a file; :LspInstall works like :Mason or :MasonInstall
        after installing LSPs i need to start/setup them when initializing vim (or when opening a relevant filetype)
            like so: 
                require("lspconfig").sumneko_lua.setup {}
                require("lspconfig").rust_analyzer.setup {}
            docs: check :h mason-lspconfig @ DYNAMIC SERVER SETUP
            also check mason-lspconfig.setup_handlers()|
    --]]
    --set ups servers i want to use 
    --  check :h lspconfig-quickstart

    --[[
    -- Autocompletion
    ---- THIS IS A MASSIVE RABBIT HOLE I'M NOT WILLING TO DIVE FURTHER FOR NOW
    ---- configs for language server protocol, needed for other plugins
    use { --UNAVAILABLE IN NVIM <7 ??
        "neovim/nvim-lspconfig",
        "williamboman/nvim-lsp-installer"
    }
    --   hardcore autocomplete
    --   https://github.com/ms-jpq/coq_nvim
    --Plug 'ms-jpq/coq_nvim', {'branch': 'coq'} -- main one
    --Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'} -- 9000+ snippets
    --]]
    use {'ms-jpq/coq_nvim', branch = 'coq'}
    use {'ms-jpq/coq.artifacts', branch = 'artifacts'} -- 9000+ snippets
    -- run once to compile the snippets :COQsnips compile
    --  <C-h> to jump to fields in snippets
    --[[
        Please update dependencies using :COQdeps
        Dependencies will be installed privately inside `/home/lucasnascimento/.local/share/nvim/site/pack/packer/start/coq_nvim/.vars`
        `rm -rf coq_nvim` will cleanly remove everything
    --]]

    --[[
    -- norg is a note-taking tool
    use {
        "nvim-neorg/neorg",
        tag = "*",
        --ft = "norg",
        after = "nvim-treesitter", -- You may want to specify Telescope here as well
        config = function()
            require('neorg').setup {
                ["core.defaults"] = {}
            }
        end
    }
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
