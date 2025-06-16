--- @type LazySpec
return {
	"folke/which-key.nvim",
	dependencies = {
		"echasnovski/mini.icons",
	},
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {},
	config = function()
		local wk = require("which-key")

		wk.add({
			{ "<leader>b", desc = "Buffer" },
			{ "<leader>d", desc = "DAP" },
			{ "<leader>e", desc = "Tree" },
			{ "<leader>f", desc = "Fuzzy Find" },
			{ "<leader>g", desc = "Git" },
			{ "<leader>h", desc = "Harpoon" },
			{ "<leader>l", desc = "LSP functions" },
			{ "<leader>p", desc = "Packages" },
			{ "<leader>s", desc = "Flash" },
			{ "<leader>t", desc = "Trouble" },
			{ "<leader>y", desc = "Neotest" },
		})
	end,
}
