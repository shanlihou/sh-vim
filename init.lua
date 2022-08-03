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
require('plugin-config/bookmark')
if (not vim.fn.has('win32'))
then
    require('plugin-config/nvim-treesitter')
end


require('lsp/setup')
require('lsp/nvim-cmp')


vim.o.background = 'dark'
vim.o.timeoutlen = 1000 -- 设置快捷键的超时时间
vim.cmd [[
    silent! colorscheme nord
]]

