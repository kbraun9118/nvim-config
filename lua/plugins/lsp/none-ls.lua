return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "jay-babu/mason-null-ls.nvim",
    cmd = { "NullLsInstall", "NullLsUninstall" },
    opts = { handlers = {} },
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local on_attach = function(client, bufnr)
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      if client.supports_method("textDocument/formatting") then
        vim.keymap.set("n", "<leader>lf", function()
          vim.lsp.buf.format({ async = true })
        end, { desc = "Format buffer" })
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
      end
    end

    require("null-ls").setup({
      on_attach = on_attach
    })

    require("mason-null-ls").setup({
      ensure_installed = { "eslint_d" },
    })
  end,
}
