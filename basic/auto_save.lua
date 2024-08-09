
-- Auto-save when the window loses focus
-- 失去焦点时自动保存
vim.api.nvim_create_autocmd({"InsertLeave"}, {
    pattern = {"*.*"},
    callback = function()
        local bufname = vim.api.nvim_buf_get_name(0) -- 获取当前缓冲区的文件名
        -- vim.print('curr buf', bufname)
        if bufname ~= '' and bufname ~= '[No Name]' then
            vim.cmd("write")
        end
    end,
    desc = "Auto-save when leaving a buffer with a name",
})
