if (vim.fn.has('win32') == 0) then
    -- 开启 Folding
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
    -- 默认不要折叠
    -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
    vim.wo.foldlevel = 99
    return {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate", -- 建议加上这一行，插件更新时会自动更新 parser
        config = function()
            -- 重点：这里去掉了 .configs
            require('nvim-treesitter').setup({
                -- 安装 language parser
                ensure_installed = {"html", "css", "vim", "lua", "javascript", "typescript", "tsx", "python", "cpp", "c", "vimdoc"},
                -- 启用代码高亮功能
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false
                },
                -- 启用增量选择
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = '<CR>',
                        node_incremental = '<CR>',
                        node_decremental = '<BS>',
                        scope_incremental = '<TAB>',
                    }
                },
                -- 启用缩进
                indent = {
                    enable = true
                }
            })
        end
    }

else
    return {}
end
