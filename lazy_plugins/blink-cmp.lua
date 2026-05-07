return {
  'saghen/blink.cmp',
  -- 记得下载预编译好的二进制文件（推荐）
  version = '*',
  -- 如果你想自己编译，可以使用 build = 'cargo build --release'
  
  dependencies = {
    'rafamadriz/friendly-snippets', -- 提供常用代码片段
  },

  opts = {
    -- 快捷键设置：'default' 模式非常接近 nvim-cmp，但也支持 'super-tab'
    keymap = { 
      preset = 'enter',
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
    },

    appearance = {
      -- 自动根据你的主题调整图标颜色
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },

    -- 补全源配置
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- 补全窗口美化
    completion = {
      menu = { border = 'rounded' },
      documentation = { window = { border = 'rounded' }, auto_show = true },
    },

    -- 这里的配置会自动接管你的 LSP capabilities
    -- 你不再需要在每一个 lsp setup 里手动写 capabilities = ... 了！
  },
  
  -- 这里的 opts_extend 是为了确保你的配置能正确覆盖默认值
  opts_extend = { "sources.default" }
}
