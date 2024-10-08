require('lsp/pyright')
require('lsp/cpp')
vim.lsp.set_log_level("error")
require('lsp/clangd')
require('lsp/rust')
require('lsp/go')


require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",
    "volar",
    -- "ast-grep"
  },
})

require("lspconfig").lua_ls.setup {}
require("lspconfig").pyright.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").volar.setup {}
require("lspconfig").dartls.setup {
  cmd = { "dart", "language-server", "--protocol=lsp"},
  filetypes = { "dart" },
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = true,
    outline = true,
    suggestFromUnimportedLibraries = true,
  },
  -- root_dir = require("lspconfig.util").root_pattern("package.json", ".git"),
}

-- local lsp_installer = require "nvim-lsp-installer"


-- 安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- { key: 语言 value: 配置文件 }
local servers = {
  -- sumneko_lua = require "lsp.lua", -- /lua/lsp/lua.lua
  -- pyright = require "lsp.pyright",
  -- ccls = require "lsp.cpp",
}

-- 自动安装 LanguageServers
-- for name, _ in pairs(servers) do
--   local server_is_found, server = lsp_installer.get_server(name)
--   if server_is_found then
--     if not server:is_installed() then
--       print("Installing " .. name)
--       server:install()
--     end
--   end
-- end

-- lsp_installer.on_server_ready(function(server)
--   local opts = servers[server.name]
--   if opts then
--     opts.on_attach = function(_, bufnr)
--       local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--       -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
--       -- 绑定快捷键
--       require('keybindings').maplsp(buf_set_keymap)
--     end
--     opts.flags = {
--       debounce_text_changes = 150,
--     }
--     server:setup(opts)
--   end
-- end)
