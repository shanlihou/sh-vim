require('basic')
require('basic.auto_save')
require('keybindings')
require('plugins')

-- 插件
require('plugin-config/nvim-tree')
require('plugin-config/auto-session')
require('plugin-config/buffline')
require('plugin-config/leaderf')
-- require('plugin-config/session')
require('plugin-config/comment')
require('plugin-config/bookmark')
require('plugin-config/multi')
require('plugin-config/hydra')
require('plugin-config/telescope')
if (vim.fn.has('win32') == 0)
then
    require('plugin-config/nvim-treesitter')
end


require('lsp/setup')
require('lsp/nvim-cmp')


vim.cmd [[
    silent! colorscheme nord
]]

