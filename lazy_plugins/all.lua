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
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
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
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
        "shanlihou/bookmarks.nvim",
        config = function()
            require('bookmarks').setup({
                auto_calibrate_cur_buf = true,
            })
        end
    },
    -- {
    --     "AckslD/nvim-neoclip.lua",
    --     dependencies = {
    --         {'nvim-telescope/telescope.nvim'},
    --         {'kkharji/sqlite.lua', module = 'sqlite'},
    --     },
    --     config = function()
    --         require('neoclip').setup({
    --             enable_persistent_history = true,
    --             db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
    --         })
    --     end,
    -- }
}


