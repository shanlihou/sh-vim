-- init.lua / lsp setup
vim.lsp.config.pyright = vim.tbl_deep_extend(
  "force",
  vim.lsp.config.pyright or {},
  {
    on_attach = function(client, bufnr)
      client.server_capabilities.definitionProvider = false
    end,
  }
)


