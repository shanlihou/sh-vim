
-- Auto-save when the window loses focus
-- 失去焦点时自动保存

local function save_file()
    local bufname = vim.api.nvim_buf_get_name(0)
    if bufname ~= '' and bufname ~= '[No Name]' then
        vim.cmd("write")
    end
end

-- 去除每行末尾空格（同步版本，适合小文件）
local function clear_end_space()
    local buf = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    for i, line in ipairs(lines) do
        local trimmed_line = line:gsub("%s+$", "")
        if trimmed_line ~= line then
            vim.api.nvim_buf_set_lines(buf, i - 1, i, false, { trimmed_line })
        end
    end
end

-- 异步分帧去空格，避免大文件卡顿
-- opts = { chunk_size = 500, interval_ms = 10, on_done = function(buf) end }
-- Module-local state to avoid storing non-serializable types in vim.b
local _ces_state = {}

local function clear_end_space_async(opts)
    opts = opts or {}
    local chunk_size = opts.chunk_size or 500
    local interval_ms = opts.interval_ms or 10

    local buf = vim.api.nvim_get_current_buf()
    if not vim.api.nvim_buf_is_valid(buf) or not vim.api.nvim_buf_is_loaded(buf) then
        return
    end
    if not vim.api.nvim_buf_get_option(buf, "modifiable") then
        return
    end

    -- 防止重复运行
    _ces_state[buf] = _ces_state[buf] or {}
    if _ces_state[buf].running then
        return
    end
    _ces_state[buf].running = true

    local total = vim.api.nvim_buf_line_count(buf)
    local start_idx = 0 -- 0-based

    local function finish()
        if _ces_state[buf] then
            _ces_state[buf].running = false
        end
        if opts.on_done then
            pcall(opts.on_done, buf)
        end
    end

    local function step()
        -- 在主线程执行缓冲区操作
        if not vim.api.nvim_buf_is_valid(buf) or not vim.api.nvim_buf_is_loaded(buf) then
            finish()
            return
        end
        if not vim.api.nvim_buf_get_option(buf, "modifiable") then
            finish()
            return
        end

        if start_idx >= total then
            finish()
            return
        end

        local last = math.min(start_idx + chunk_size, total)
        local lines = vim.api.nvim_buf_get_lines(buf, start_idx, last, false)
        for i, line in ipairs(lines) do
            local trimmed_line = line:gsub("%s+$", "")
            if trimmed_line ~= line then
                local idx = start_idx + i - 1
                vim.api.nvim_buf_set_lines(buf, idx, idx + 1, false, { trimmed_line })
            end
        end

        start_idx = last
        total = vim.api.nvim_buf_line_count(buf)

        -- 继续下一帧
        if _ces_state[buf] and _ces_state[buf].running then
            vim.defer_fn(step, interval_ms)
        end
    end

    -- 启动第一帧
    vim.defer_fn(step, 0)
end

local function do_all()
    local buf = vim.api.nvim_get_current_buf()
    if not vim.api.nvim_buf_get_option(buf, "modifiable") then
        return
    end

    -- local line_cnt = vim.api.nvim_buf_line_count(buf)
    -- if line_cnt <= 1000 then
    --     clear_end_space()
    --     save_file()
    --     return
    -- end

    -- 大文件使用异步分帧处理，每帧 500 行
    -- clear_end_space_async({
    --     chunk_size = 500,
    --     interval_ms = 10,
    --     on_done = function(b)
    --         if vim.api.nvim_buf_is_valid(b) and vim.api.nvim_buf_get_option(b, "modified") then
    --             -- 完成后再保存
    --             pcall(function() vim.cmd("write") end)
    --         end
    --     end,
    -- })
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
