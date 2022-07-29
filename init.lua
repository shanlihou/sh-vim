require('basic')
require('keybindings')
require('plugins')

-- 插件
require('plugin-config/nvim-tree')
-- lua require('plugin-config/auto-session')
-- lua require('plugin-config/buffline')
require('plugin-config/leaderf')
require('plugin-config/session')
require('plugin-config/comment')

require('lsp/setup')
require('lsp/nvim-cmp')


vim.o.background = 'dark'
vim.o.timeoutlen = 1000
vim.cmd [[
    silent! colorscheme edge
]]

