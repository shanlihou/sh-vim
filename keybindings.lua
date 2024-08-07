vim.g.mapleader = "`"
vim.g.maplocalleader = "`"
local map = vim.api.nvim_set_keymap
local opt = {noremap = true}

-- save all
map("n", "<leader>w", ":wa<CR>", opt)

-- normal
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

map("c", "<S-Insert>", '<C-R>+', opt)
map("i", "<S-Insert>", '<C-R>+', opt)
map("n", "<leader>rt", ":%retab!<CR>", opt)
-- 拷贝当前文件名到剪贴板
map("n", "<leader>cn", ":let @* = expand('%:t')<CR>", opt)
map("i", "jk", "<Esc>", opt)
-- map("n", "<leader>re", ":%s/\\<foo\\>/bar/g", opt)

-- copilot
vim.keymap.set('i', '<C-]>', '<Plug>(copilot-next)')
-- vim.keymap.set('i', '<C-[>', '<Plug>(copilot-previous)')
vim.keymap.set('i', '<C-d>', '<Plug>(copilot-dismiss)')
vim.keymap.set('i', '<C-l>', '<Plug>(copilot-suggest)')
-- vim.keymap.set('i', '<C-i>', 'copilot#Accept("\\<CR>")', {
--   expr = true,
--   replace_keycodes = false
-- })
-- vim.g.copilot_no_tab_map = true

--
-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', opt)

-- bookmark
vim.keymap.set({ "n", "v" }, "mm", "<cmd>BookmarksMark<cr>", { desc = "Mark current line into active BookmarkList." })
vim.keymap.set({ "n", "v" }, "mo", "<cmd>BookmarksGoto<cr>", { desc = "Go to bookmark at current active BookmarkList" })
vim.keymap.set({ "n", "v" }, "ma", "<cmd>BookmarksCommands<cr>", { desc = "Find and trigger a bookmark command." })
vim.keymap.set({ "n", "v" }, "mg", "<cmd>BookmarksGotoRecent<cr>", { desc = "Go to latest visited/created Bookmark" })
vim.keymap.set({ "n", "v" }, "md", "<cmd>BookmarksTree<cr>", { desc = "display all the bookmarks" })
vim.keymap.set({ "n", "v" }, "mr", "<cmd>BookmarksCalibration<cr>", { desc = "display all the bookmarks" })

-- session
map('n', '<leader>so', ':OpenSession ', opt)

-- packer
-- map('n', '<leader>ps', ':PackerSync<CR>', opt)

-- Telescope
map("n", "<leader>lf", ":Telescope find_files<CR>", opt)
map("n", "<leader>lg", ":Telescope live_grep<CR>", opt)

-- leaderf
map("n", "<leader>ll", ":LeaderfLine<CR>", opt)
map("n", "<leader>lt", ":LeaderfMru<CR>", opt)
map("n", "<leader>la", ":Leaderf rg", opt)
vim.cmd('noremap <C-F> :<C-U><C-R>=printf("Leaderf rg -w %s ", expand("<cword>"))<CR>')

-- bufferline
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<m-h>", ":BufferLineCloseLeft<CR>", opt)
map("n", "<m-l>", ":BufferLineCloseRight<CR>", opt)
local function close_all_buf()
  vim.cmd('BufferLineCloseLeft')
  vim.cmd('BufferLineCloseRight')
end

vim.keymap.set("n", "<leader>x", close_all_buf, { noremap = true })

-- tagbar
map("n", "<F8>", ":TagbarToggle<CR>", opt)

--
-- copy
if (vim.fn.has('win32') == 0)
then
    map('v', '<leader>y', '<Plug>OSCYankVisual', opt)
    -- map("v", "<leader>y", ':OSCYank<CR>', opt)
else
    map("v", "<leader>y", '"+y', opt)
end

-- multicursors.nvim
map('n', '<leader>re', ':MCstart<CR>', opt)

local pluginKeys = {}

-- lsp 回调函数快捷键设置
pluginKeys.maplsp = function(mapbuf)
  -- rename
  mapbuf('n', '<leader>gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
  -- code action
  mapbuf('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
  -- go xx
  mapbuf('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  mapbuf('n', '<leader>gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
  mapbuf('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
  mapbuf('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
  mapbuf('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
  -- diagnostic
  mapbuf('n', '<leader>go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
  mapbuf('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
  mapbuf('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- leader + =
  mapbuf('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
  -- mapbuf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
  return {
    -- 上一个
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    -- 下一个
    ['<C-j>'] = cmp.mapping.select_next_item(),
    -- 出现补全
    ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- 取消
    ['<A-,>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 确认
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({
      select = true ,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  }
end

-- Comment
pluginKeys.comment = function()
    return {
        toggler = {
            ---Line-comment toggle keymap
            line = '<leader>cl',
            ---Block-comment toggle keymap
            block = 'gbc',
        },
        ---LHS of operator-pending mappings in NORMAL + VISUAL mode
        ---@type table
        opleader = {
            -- -Line-comment keymap
            line = '<leader>ca',
            -- -Block-comment keymap
            block = '<leader>qq',
        },
    }
end


return pluginKeys


