return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"nvim-lua/plenary.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"williamboman/mason-lspconfig.nvim",
		"folke/neodev.nvim",
	},
	config = function()
		require("neodev").setup({})
		local lspconfig = require("lspconfig")

		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local mason_lspconfig = require("mason-lspconfig")

		local on_attach = function(_, bufnr)
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
			setkey("<leader>lf", function()
				vim.lsp.buf.format({ async = true })
			end, "Format buffer")
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			function(server)
				lspconfig[server].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end,
		})

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})
	end,
}
