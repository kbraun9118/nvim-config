return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "nvim-lua/plenary.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
    "themaxmarchuk/tailwindcss-colors.nvim"
  },
  config = function()
    require("neodev").setup({})
    local lspconfig = require("lspconfig")

    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local mason_lspconfig = require("mason-lspconfig")

    local on_attach = function(client, bufnr)
      local setkey = function(keys, cmd, desc)
        vim.keymap.set("n", keys, cmd, { noremap = true, silent = true, desc = desc, buffer = bufnr })
      end

      setkey("gr", "<cmd>Telescope lsp_references<CR>", "Show LSP references")
      setkey("gD", vim.lsp.buf.declaration, "Goto Declaration")
      setkey("gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions")
      setkey("gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations")
      setkey("gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions")
      setkey("<leader>la", vim.lsp.buf.code_action, "See available code actions")
      setkey("<leader>lr", vim.lsp.buf.rename, "Smart rename")
      setkey("<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics")
      setkey("<leader>ld", vim.diagnostic.open_float, "Show line diagnostics")
      setkey("[d", vim.diagnostic.goto_prev, "Goto previous diagnostic")
      setkey("]d", vim.diagnostic.goto_prev, "Goto next diagnostic")
      setkey("K", vim.lsp.buf.hover, "Show documentation")
      setkey("<leader>ls", "<cmd>LspRestart<CR>", "Restart LSP")

      vim.diagnostic.config({ update_in_insert = true })
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()
    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, { border = "rounded" }),
    }

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- let opam installed lsp take over
    lspconfig["ocamllsp"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      handlers = handlers,
    })

    mason_lspconfig.setup_handlers({
      function(server)
        lspconfig[server].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          handlers = handlers,
        })
      end,
      ['tailwindcss'] = function(server)
        lspconfig[server].setup({
          capabilities,
          on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            require("tailwindcss-colors").buf_attach(bufnr)
          end,
          handlers = handlers
        })
      end,
      ["lua_ls"] = function(server)
        lspconfig[server].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          handlers = handlers,
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
              workspace = { checkThirdParty = false },
            },
          },
        })
      end,
    })
  end,
}
