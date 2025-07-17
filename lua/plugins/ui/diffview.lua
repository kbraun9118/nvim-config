--- @type LazySpec
return {
	"sindrets/diffview.nvim",
	opts = {},
	config = function(opts)
		require("diffview").setup(opts)

		vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Open diffview" })
		vim.keymap.set("n", "<leader>gm", "<cmd>DiffviewOpen origin/main<cr>", { desc = "Open diffview against main" })
		vim.keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" })
	end,
}
