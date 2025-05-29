
-- Auto-save when the window loses focus
-- 失去焦点时自动保存

local function save_file()
    local bufname = vim.api.nvim_buf_get_name(0)
    if bufname ~= '' and bufname ~= '[No Name]' then
        vim.cmd("write")
    end
end

local function clear_end_space()
    local buf = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    for i, line in ipairs(lines) do
        local trimmed_line = line:gsub("%s+$", "")
        if trimmed_line ~= line then
            vim.api.nvim_buf_set_lines(buf, i - 1, i, false, {trimmed_line})
        end
    end
end

local function do_all()
    local line_cnt = vim.api.nvim_buf_line_count(0)
    if line_cnt > 1000 then
        return
    end

    local buf = vim.api.nvim_get_current_buf()
    if not vim.api.nvim_buf_get_option(buf, "modifiable") then
        return
    end

    clear_end_space()
    save_file()
end

-- vim.api.nvim_create_autocmd({"BufLeave"}, {
--     pattern = {"*.*"},
--     callback = do_all,
--     desc = "Clear end space when entering a buffer",
-- })

vim.api.nvim_create_autocmd({"InsertLeave"}, {
    pattern = {"*.*"},
    callback = do_all,
    desc = "Auto-save when leaving a buffer with a name",
})

local function copy()
    if vim.v.event.operator == 'y' then
        if (vim.fn.has('win32') == 0) then
            require('osc52').copy_register('"')
        else
            vim.fn.setreg('+', vim.fn.getreg('"'))
        end
    end
end

vim.api.nvim_create_autocmd('TextYankPost', {callback = copy})
