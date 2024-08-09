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


local opts = {
  auto_session_enabled = true,
  auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
  auto_save_enabled = true,
  auto_restore_enabled = true,
  auto_session_suppress_dirs = nil,
  auto_session_allowed_dirs = nil,
  auto_session_create_enabled = true,
  auto_session_enable_last_session = false,
  auto_session_use_git_branch = false,
  auto_restore_lazy_delay_enabled = true,
  log_level = 'info',
  post_restore_cmds = {restore_nvim_tree, restore_bookmark},
}

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
require('auto-session').setup(opts)
