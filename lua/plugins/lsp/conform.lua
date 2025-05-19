return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					javascript = { "prettierd" },
					javascriptreact = { "prettierd" },
					typescript = { "prettierd" },
					typescriptreact = { "prettierd" },
					svelte = { "prettierd" },
					vue = { "prettierd" },
					css = { "prettierd" },
					html = { "prettierd" },
					yaml = { "prettierd" },
					json = { "prettierd" },
					lua = { "stylua" },
					python = { "ruff" },
				},
				default_format_opts = {
					lsp_format = "fallback",
				},
				format_on_save = {
					lsp_format = "fallback",
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>lf", function()
				conform.format({ async = true })
			end, { desc = "Format" })
		end,
	},
}
