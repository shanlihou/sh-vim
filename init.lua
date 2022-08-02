require('basic')
require('keybindings')
require('plugins')

-- 插件
require('plugin-config/nvim-tree')
-- lua require('plugin-config/auto-session')
require('plugin-config/buffline')
require('plugin-config/leaderf')
require('plugin-config/session')
require('plugin-config/comment')
require('plugin-config/nvim-treesitter')


require('lsp/setup')
require('lsp/nvim-cmp')


vim.o.background = 'dark'
vim.o.timeoutlen = 1000 -- 设置快捷键的超时时间
vim.cmd [[
    silent! colorscheme nord
]]

