vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.api.nvim_set_keymap
local opt = {noremap = true}

-- normal
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

map("v", "<leader>y", '"+y', opt)
map("c", "<S-Insert>", '<C-R>+', opt)
map("i", "<S-Insert>", '<C-R>+', opt)

-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', opt)


-- session
map('n', '<leader>so', ':OpenSession', opt)

-- packer
map('n', '<leader>ps', ':PackerSync<CR>', opt)

-- Telescope
map("n", "<leader>lf", ":Telescope find_files<CR>", opt)
map("n", "<leader>lg", ":Telescope live_grep<CR>", opt)
map("n", "<leader>ll", ":LeaderfLine<CR>", opt)
map("n", "<leader>lt", ":LeaderfMru<CR>", opt)

-- bufferline
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)

