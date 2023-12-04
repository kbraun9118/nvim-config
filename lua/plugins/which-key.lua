return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {},
	config = function()
		local wk = require("which-key")

		wk.register({
			p = { "Packages" },
			f = { "Fuzzy Find" },
			l = { "LSP functions" },
			g = { "Git" },
			b = { "Buffer" },
			e = { "Tree" },
			h = { "Harpoon" },
			s = { "Flash" },
			d = { "DAP" },
		}, { prefix = "<leader>" })
	end,
}
