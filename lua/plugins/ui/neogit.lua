return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Open Neogit" },
	},
	config = true,
}
