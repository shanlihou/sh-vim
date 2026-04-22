return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({
      -- 基础配置，已经非常好用
      windowWidth = 80,
      windowHeight = 0.8,
      startInInsertMode = false, -- 打开不自动进入输入
    })
  end,

  -- 最关键的快捷键
  keys = {
    {
      "<leader>sr",
      function()
        require("grug-far").open()
      end,
      desc = "全局搜索替换 (Grug Far)",
    },
    -- 可选：在当前文件内搜索替换
    {
      "<leader>sf",
      function()
        require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
      end,
      desc = "当前文件搜索替换",
    },
  },
}
