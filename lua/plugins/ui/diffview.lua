return {
	"sindrets/diffview.nvim",
	keys = {
		{
			"<leader>gd",
			"<cmd>DiffviewOpen<cr>",
			desc = "Open diffview",
		},
	},
	config = function()
		require("diffview").setup({})
	end,
}
