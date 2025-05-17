return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "nvim-lua/plenary.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/lazydev.nvim",
    "antosha417/nvim-lsp-file-operations",
  },
  config = function()
    require("lazydev").setup({})
    require("lspconfig")
    local lspFileOperations = require("lsp-file-operations")

    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = "*.gitlab-ci*.{yml,yaml}",
      callback = function()
        vim.bo.filetype = "yaml.gitlab"
      end,
    })

    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    require("mason-lspconfig").setup()

    local on_attach = function(client, bufnr)
      local setkey = function(keys, cmd, desc)
        vim.keymap.set("n", keys, cmd, { noremap = true, silent = true, desc = desc, buffer = bufnr })
      end
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

      setkey("gr", "<cmd>Telescope lsp_references<CR>", "Show LSP references")
      setkey("gD", vim.lsp.buf.declaration, "Goto Declaration")
      setkey("gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions")
      setkey("gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations")
      setkey("gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions")
      setkey("<leader>la", vim.lsp.buf.code_action, "See available code actions")
      setkey("<leader>lr", vim.lsp.buf.rename, "Smart rename")
      setkey("<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics")
      setkey("<leader>ld", vim.diagnostic.open_float, "Show line diagnostics")
      setkey("<leader>lR", "<cmd>LspRestart<cr>", "Restart LSP")
      setkey("[d", function()
        vim.diagnostic.jump({ count = -1, float = true })
      end, "Goto previous diagnostic")
      setkey("]d", function()
        vim.diagnostic.jump({ count = 1, float = true })
      end, "Goto next diagnostic")
      setkey("K", function()
        vim.lsp.buf.hover({ border = "rounded" })
      end, "Show documentation")
      -- setkey("<leader>lf", function()
      -- 	vim.lsp.buf.format({ async = true })
      -- end, "Format buffer")

      vim.diagnostic.config({ update_in_insert = true })
    end

    local capabilities =
        vim.tbl_extend("force", cmp_nvim_lsp.default_capabilities(), lspFileOperations.default_capabilities())

    vim.diagnostic.config({
      update_in_insert = true,
      virtual_text = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = "󰠠 ",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
    })

    vim.lsp.config("*", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.config("rust_analyzer", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace",
          },
          workspace = { checkThirdParty = false },
        },
      },
    })

    vim.lsp.config("pylsp", {
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              ignore = { "E501" },
            },
          },
        },
      },
    })

    vim.lsp.config("tailwindcss", {
      settings = {
        tailwindCSS = {
          classFunctions = { "tw", "twMerge" },
        },
      },
    })

    vim.lsp.config("basedpyright", {
      settings = {
        basedpyright = {
          reportAny = false,
        },
      },
    })

    vim.lsp.config("ts_ls", {
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = vim.fn.stdpath("data")
                .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
            languages = { "vue" },
          },
        },
      },
    })
    vim.lsp.config("volar", {
      capabilities = capabilities,
      on_attach = on_attach,
      init_options = {
        vue = { hybridMode = false },
      },
    })
  end,
}
