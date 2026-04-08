--- @type LazySpec
return {
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
				markdown = { "prettierd" },
				lua = { "stylua" },
				python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
				ocaml = { "ocamlformat" },
				cpp = { "clang-format" },
				toml = { "taplo" },
				sql = { "sqlfmt" },
				go = { "goimports", lsp_format = "last" },
				java = { "clang-format", lsp_format = "never" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			format_on_save = {
				lsp_format = "fallback",
			},
			formatters = {
				["clang-format"] = {
					-- args = function(ctx)
					-- 	return {
					-- 		"--style=file:" .. vim.fn.expand("$XDG_CONFIG_HOME/nvim/assets/.clang-format"),
					-- 		"--assume-filename" .. c,
					-- 	}
					-- end,
					prepend_args = {
						"--style=file:" .. vim.fn.expand("$XDG_CONFIG_HOME/nvim/assets/.clang-format"),
					},
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>lf", function()
			conform.format({ async = true })
		end, { desc = "Format" })
	end,
}
