return {
    'sainnhe/edge',
    'shaunsingh/nord.nvim',
    {
        'Yggdroot/LeaderF',
        config = function()
            vim.g.Lf_WindowPosition = 'popup'
            vim.g.Lf_PreviewInPopup = 1
        end
    },
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    -- {
    --     'hrsh7th/cmp-nvim-lsp', -- { name = nvim_lsp }
    --     'hrsh7th/cmp-buffer',   -- { name = 'buffer' },
    --     -- 'hrsh7th/cmp-path',     -- { name = 'path' }
    --     -- 'hrsh7th/cmp-cmdline',  -- { name = 'cmdline' }
    --     'hrsh7th/nvim-cmp',
    -- },
    {
        'hrsh7th/cmp-vsnip',    -- { name = 'vsnip' }
        'hrsh7th/vim-vsnip',
        'rafamadriz/friendly-snippets'
    },
    'onsails/lspkind-nvim',
    'preservim/tagbar',
    'sheerun/vim-polyglot',
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        'luozhiya/fittencode.nvim',
        config = function()
            require('fittencode').setup()
        end,
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup(require('keybindings').comment())
        end
    },
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    {
        "shanlihou/bookmarks.nvim",
        config = function()
            require('bookmarks').setup({
                auto_calibrate_cur_buf = true,
            })
        end
    }
}

