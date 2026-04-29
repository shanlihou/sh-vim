return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter", -- 仅在进入插入模式时加载，节省启动时间
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",     -- LSP 补全源
    "hrsh7th/cmp-buffer",       -- 文本缓冲区补全源
    "hrsh7th/cmp-path",         -- 文件路径补全源
    "saadparwaiz1/cmp_luasnip", -- 代码片段补全源
    "L3MON4D3/LuaSnip",         -- 代码片段引擎
    "rafamadriz/friendly-snippets", -- 预设的各语言代码片段
    "onsails/lspkind.nvim",     -- 补全菜单的图标修饰
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- 加载 friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(), -- 为补全窗口添加边框
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- 手动触发补全
        ["<C-e>"] = cmp.mapping.abort(),         -- 关闭补全窗口
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- 回车确认
        
        -- Tab 键逻辑：循环补全或跳到下一个代码片段占位符
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      -- 补全源的优先级设定
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- 核心：LSP
        { name = "luasnip" },  -- 代码片段
      }, {
        { name = "buffer" },   -- 当前文件内容
        { name = "path" },     -- 路径
      }),
      -- 使用 lspkind 格式化菜单（图标化）
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
        })
      },
    })
  end,
}
