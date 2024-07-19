local Hydra = require('hydra')

-- 创建一个窗口操作的 Hydra，包括调整大小和跳转
Hydra({
    name = 'Window Operations',
    hint = [[Window Operations]],
    mode = 'n', -- 在普通模式下激活
    body = '<C-w>', -- 使用 Ctrl-w 作为前缀键
    heads = {
        -- 窗口大小调整
        { 'H', '<C-w>5<', { desc = 'Shrink width' } }, -- 缩小宽度
        { 'L', '<C-w>5>', { desc = 'Expand width' } }, -- 增加宽度
        { 'J', '<C-w>5+', { desc = 'Increase height' } }, -- 增加高度
        { 'K', '<C-w>5-', { desc = 'Decrease height' } }, -- 减少高度
        
        -- 窗口跳转
        -- 退出 Hydra
        { 'q', nil, { desc = 'Exit', exit = true } }, 
    },
    config = {
        color = 'pink', -- 使用粉色高亮显示
        hint = {
            type = 'window', -- 在浮动窗口中显示提示
            position = 'bottom', -- 提示窗口显示在底部
            border = 'single', -- 提示窗口的边框样式
            show_name = true, -- 显示 Hydra 名称
        },
    }
})
