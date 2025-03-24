return {
	"sindrets/diffview.nvim",
	opts = {},
	config = function(opts)
		require("diffview").setup(opts)

		vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Open diffview" })
	end,
}
