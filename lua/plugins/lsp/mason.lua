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
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"prismals",
				"pyright",
				"rust_analyzer",
				"lua_ls",
				"volar",
				"sqlls",
				"gradle_ls",
				"gopls",
				"dockerls",
				"docker_compose_language_service",
			},
			automatic_installation = {
				exclude = { "ocamllsp" },
			},
		})

		vim.keymap.set("n", "<leader>pm", "<cmd>Mason<CR>", { desc = "Open Mason" })
	end,
}
