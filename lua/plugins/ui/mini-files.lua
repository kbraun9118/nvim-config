return {
	"echasnovski/mini.files",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local mini_files = require("mini.files")
		mini_files.setup({
			mappings = {
				go_in_plus = "<CR>",
				synchronize = "<leader>w",
			},
		})

		vim.keymap.set("n", "<leader>e", mini_files.open, { desc = "Open parent directory" })
	end,
}
