return {
	"sindrets/diffview.nvim",
	config = function()
		require("diffview").setup({})

		vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Open diffview" })
	end,
}
