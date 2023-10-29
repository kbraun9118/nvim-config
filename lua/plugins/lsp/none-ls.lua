return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "jay-babu/mason-null-ls.nvim",
    cmd = { "NullLsInstall", "NullLsUninstall" },
    opts = { handlers = {} },
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("null-ls").setup({})

    require("mason-null-ls").setup({
      ensure_installed = { "eslint_d" },
    })
  end,
}
