return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			vim.keymap.set("n", "<leader>gb", function()
				gs.blame_line({ full = true })
			end, { buffer = bufnr, silent = true, desc = "Toggle git blame for line" })
			vim.keymap.set("n", "<leader>gR", gs.reset_buffer, { buffer = bufnr, silent = true, desc = "Reset buffer" })
		end,
	},
}
