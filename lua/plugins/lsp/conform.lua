return {
  {
    'stevearc/conform.nvim',
    config = function()
      local conform = require('conform')
      conform.setup({
        formatters_by_ft = {
          javascript = { "prettierd" },
          javascriptreact = { "prettierd" },
          typescript = { "prettierd" },
          typescriptreact = { "prettierd" },
          yaml = { "prettierd" },
          json = { "prettierd" },
          lua = { "stylelua" },
          python = { "ruff" }
        },
        default_format_opts = {
          lsp_format = "fallback",
        },
        format_on_save = {
        }
      })


      vim.keymap.set({ "n", "v" }, "<leader>lf", function() conform.format({ async = true }) end, { desc = "Format" })
    end
  }
}
