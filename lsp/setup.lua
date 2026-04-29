-- 1. 获取 cmp 的能力支持
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 2. 全局基础配置（所有 LSP 都会继承）
vim.lsp.config('*', {
    capabilities = capabilities,
})

-- 3. 针对特定服务器进行个性化配置（替代以前的 .setup）
-- 例如：针对 pyright 做特殊设置
vim.lsp.config('pyright', {
    settings = {
        python = {
            analysis = { autoSearchPaths = true }
        }
    }
})

-- 4. 批量启用服务器
-- 注意：这里写的是 'dartls' 而不是 'dart_ls'
vim.lsp.enable({
    'lua_ls', 
    'pyright', 
    'rust_analyzer', 
    'volar', 
    'dartls', -- 修正下划线问题
    'ccls', 
    'gopls',
    'clangd'
})

-- 5. 诊断配置（保持不变）
vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
})
