return {
	"jay-babu/mason-null-ls.nvim",
	dependencies = {
		"nvimtools/none-ls.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("mason-null-ls").setup({
			ensure_installed = {
				"stylua",
			},
			automatic_installation = false,
			handlers = {},
		})
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Swiftlint doesn't seem to work
				-- null_ls.builtins.diagnostics.swiftlint,
				-- null_ls.builtins.formatting.swiftlint,
				null_ls.builtins.formatting.swift_format,
			},
		})
	end,
}
