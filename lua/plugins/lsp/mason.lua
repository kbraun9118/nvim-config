---@type LazySpec
return {
	"williamboman/mason.nvim",
	dependencies = {
		"folke/neodev.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")

		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"rust_analyzer",
				"lua_ls",
				"sqlls",
				"gopls",
			},
			automatic_installation = {
				exclude = { "ocamllsp" },
			},
		})

		vim.keymap.set("n", "<leader>pm", "<cmd>Mason<CR>", { desc = "Open Mason" })
	end,
}
