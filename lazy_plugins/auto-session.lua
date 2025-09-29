local function restore_nvim_tree()
  local nvim_tree_api = require('nvim-tree.api')
  nvim_tree_api.tree.open()
  nvim_tree_api.tree.change_root(vim.fn.getcwd())
  nvim_tree_api.tree.reload()
  nvim_tree_api.tree.close()
end


local function restore_bookmark()
  local cwd = vim.fn.getcwd()
  local api = require('bookmarks').api
  if api.reset_new_db_path ~= nil then
    api.reset_new_db_path(cwd)
  end
end

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

return {
  'rmagatti/auto-session',
  lazy = false,
  keys = {
    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    { "<leader>so", ":AutoSession search<CR>", desc = "Session search" },
    { "<leader>ws", ":AutoSession save<CR>", desc = "Save session" },
    { "<leader>wa", ":AutoSession toggle<CR>", desc = "Toggle autosave" },
  },
  opts = {
    -- The following are already the default values, no need to provide them if these are already the settings you want.
    log_level = 'info',
    post_restore_cmds = {restore_nvim_tree, restore_bookmark},
    session_lens = {
      picker = nil, -- "telescope"|"snacks"|"fzf"|"select"|nil Pickers are detected automatically but you can also manually choose one. Falls back to vim.ui.select
      mappings = {
        -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
        delete_session = { "i", "<C-d>" },
        alternate_session = { "i", "<C-s>" },
        copy_session = { "i", "<C-y>" },
      },

      picker_opts = {
      },

      -- Telescope only: If load_on_setup is false, make sure you use `:AutoSession search` to open the picker as it will initialize everything first
      load_on_setup = true,
    },
  },
}
