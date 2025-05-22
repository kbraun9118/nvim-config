return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"folke/snacks.nvim",
	},
	keys = {
		{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Open Neogit" },
	},
	config = true,
}
