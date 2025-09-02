--- @type LazySpec
return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")
			conform.setup({
				log_level = vim.log.levels.DEBUG,
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
					jsonc = { "prettierd" },
					lua = { "stylua" },
					python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
					ocaml = { "ocamlformat" },
					cpp = { "clang-format" },
					toml = { "toplo" },
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
