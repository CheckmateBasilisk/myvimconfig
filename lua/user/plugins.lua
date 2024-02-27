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
    -- Buffer Manager
    use {'nvim-lua/plenary.nvim'}  -- basic dependency
    use {'j-morano/buffer_manager.nvim'}
    -- custom commmand to invoke the buffer manager. I like explicit and long comments instead of shortcuts
    vim.api.nvim_create_user_command('Buffer', 'command Buffer lua require("buffer_manager.ui").toggle_quick_menu()', {})

    -- Color Schemes
    vim.cmd "set termguicolors"
    use {'AlessandroYorba/Alduin'}
    use {'morhetz/gruvbox'}
    -- Whitespace highlight and cleanup
    --  :EnableWhitespace
    --  :DisableWhitespace
    --  :ToggleWhitespace
    --  :ToggleWhitespace
    -- To clean extra whitespace, call:
    --  :StripWhitespace
    --https://github.com/ntpeters/vim-better-whitespace
    use {'ntpeters/vim-better-whitespace'}
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
    require("lspconfig").lua_ls.setup {}
    require("lspconfig").rust_analyzer.setup {}
    require("lspconfig").ruby_ls.setup {}
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

    -- Git integration
    use {'tpope/vim-fugitive'}
    -- :Git <cmd> runs arbitrary git cmd
    -- :Git opens the status window, where I can
    --      [s]tage and [u]nstage files
    --      [S]tage and [U]nstage all files
    --      e[X]clude changes altogether
    --      Toggle inline diff [=] or vertical diff [dv] and close it with [dq]
    --      [cc] to go to the commit pane, write the msg and commit
    -- :Gvdiffsplit Show current merge conflicts
    --https://www.youtube.com/watch?v=uUrKrYCAl1Y

    -- -- simple git mrege conflict resolution
    -- use {'akinsho/git-conflict.nvim', tag = "*", config = function()
    --   require('git-conflict').setup({
    --       default_mappings = true, -- disable buffer local mapping created by this plugin
    --       default_commands = true, -- disable commands created by this plugin
    --       disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
    --       highlights = { -- They must have background color, otherwise the default color will be used
    --         incoming = 'DiffText',
    --         current = 'DiffAdd',
    --       }
    -- })
    -- end}
    -- -- GitConflictListQf — Get all conflict to quickfix
    -- --     co — choose ours
    -- --     ct — choose theirs
    -- --     cb — choose both
    -- --     c0 — choose none
    -- --     ]x — move to previous conflict
    -- --     [x — move to next conflict
    -- -- https://github.com/akinsho/git-conflict.nvim

end)
