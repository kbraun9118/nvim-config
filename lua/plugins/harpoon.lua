return {
	"theprimeagen/harpoon",
  event  = "VeryLazy",
	dependencies = {
		"nvim/lua/plenary.nvim",
	},
	config = function()
		local harpoon_ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>hh", function()
			harpoon_ui.nav_next()
		end, { desc = "Next mark" })
		vim.keymap.set("n", "<leader>hp", function()
			harpoon_ui.nav_prev()
		end, { desc = "Previous mark" })
		vim.keymap.set("n", "<leader>hn", function()
			require("harpoon.mark").add_file()
		end, { desc = "Add mark" })
		vim.keymap.set("n", "<leader>hm", function()
			harpoon_ui.toggle_quick_menu()
		end, { desc = "View marks" })
	end,
}
