return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	opts = {
		on_attach = function(bufnr)
			local gs = require("gitsigns")

			vim.keymap.set("n", "<leader>gb", function()
				gs.blame_line({ full = true })
			end, { buffer = bufnr, silent = true, desc = "Toggle git blame for line" })
			vim.keymap.set("n", "<leader>gR", gs.reset_buffer, { buffer = bufnr, silent = true, desc = "Reset buffer" })
			vim.keymap.set("n", "<leader>ghr", gs.reset_hunk, { desc = "Reset hunk" })
			vim.keymap.set("n", "]c", function()
				gs.nav_hunk("next")
			end, { desc = "next hunk" })
			vim.keymap.set("n", "[c", function()
				gs.nav_hunk("prev")
			end, { desc = "next hunk" })
		end,
	},
}
