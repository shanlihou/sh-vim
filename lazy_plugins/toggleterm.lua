return {
  'akinsho/toggleterm.nvim',
  version = "*",
  event = "VeryLazy",
  config = function()
    require("toggleterm").setup({
      -- 1. 基础布局：固定在底部
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<C-t>]], -- 快捷键：Ctrl + t 呼出/隐藏
      hide_numbers = true,      -- 终端内不显示行号
      shade_terminals = true,
      start_in_insert = true,   -- 打开时自动进入插入模式
      insert_mappings = true,   -- 在终端模式下也响应 open_mapping
      terminal_mappings = true, 
      persist_size = true,
      direction = 'horizontal', -- 默认为底部水平布局
      close_on_exit = true,     -- 进程退出后自动关闭窗口
      shell = vim.o.shell,      -- 使用系统默认 shell
    })

    -- 2. 极致快捷键映射 (针对 Terminal 模式)
    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      -- Esc 或 jk 退出终端插入模式，回到终端正常模式 (方便用 hjkl 翻阅日志)
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)

      -- 窗口无缝跳转：即使在输入模式，也能直接 Ctrl + hjkl 跳出终端到其他代码窗口
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      
      -- 窗口宽高快速调整
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    end

    -- 只有在进入终端缓冲区时才激活这些映射
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = function()
        set_terminal_keymaps()
      end,
    })

    -- 3. 进阶快捷键 (Normal 模式下管理多个终端)
    local nmap = function(keys, cmd, desc)
      vim.keymap.set('n', keys, cmd, { desc = "Terminal: " .. desc })
    end

    nmap('<leader>th', '<Cmd>ToggleTerm direction=horizontal<CR>', '底部终端')
    nmap('<leader>tf', '<Cmd>ToggleTerm direction=float<CR>', '悬浮终端')
    nmap('<leader>t1', '<Cmd>1ToggleTerm<CR>', '终端 1')
    nmap('<leader>t2', '<Cmd>2ToggleTerm<CR>', '终端 2')
    nmap('<leader>ta', '<Cmd>ToggleTermAll<CR>', '切换所有终端')
  end
}
