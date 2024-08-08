return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'sainnhe/edge' -- edge 主题
    use 'shaunsingh/nord.nvim' -- edge 主题
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
        'smoka7/multicursors.nvim',
        requires = 'nvimtools/hydra.nvim'
    }
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    -- use {'xolox/vim-session', requires= 'xolox/vim-misc'} --保存会话
    use {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup {
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
            }
        end
    }
    --use 'rmagatti/auto-session'
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    use { 'nvim-treesitter/nvim-treesitter'}
    use 'Yggdroot/LeaderF'

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
      -- nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
    use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
    use 'hrsh7th/cmp-path'     -- { name = 'path' }
    use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
    use 'hrsh7th/nvim-cmp'
    -- vsnip
    use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'
    -- lspkind
    use 'onsails/lspkind-nvim'
    use 'preservim/tagbar'
    use 'sheerun/vim-polyglot'
    use 'github/copilot.vim'
    -- use 'vim-airline/vim-airline'
    -- use 'vim-airline/vim-airline-themes' 
    use({
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    
    -- use 'MattesGroeger/vim-bookmarks'
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    if (vim.fn.has('win32') == 0)
    then
        use 'ojroques/vim-oscyank'
    end

    use {
        'dart-lang/dart-vim-plugin',
        'thosakwe/vim-flutter',
        'natebosch/vim-lsc',
        'natebosch/vim-lsc-dart'
    }

    use {
        "LintaoAmons/bookmarks.nvim",
        requires = 'LintaoAmons/bookmarks.nvim'
    }
end)
