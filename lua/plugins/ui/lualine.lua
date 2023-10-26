return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", opt = true },
    { "linrongbin16/lsp-progress.nvim" }
  },
  event = "VeryLazy",
  config = function()
    local lsp_progress = require("lsp-progress")
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    lsp_progress.setup({})

    lualine.setup({
      options = {
        globalstatus = true,
      },
      sections = {
        lualine_c = {
          {"filename"},
          {require("lsp-progress").progress},
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
