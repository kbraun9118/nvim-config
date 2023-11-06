return {
  "jay-babu/mason-null-ls.nvim",
  dependencies = {
    "nvimtools/none-ls.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = {
        "stylua"
      },
      automatic_installation = false,
      handlers = {},
    })
    require("null-ls").setup({})
  end,
}
