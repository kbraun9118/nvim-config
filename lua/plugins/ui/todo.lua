return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim", "nvim-telescope/telescope.nvim" },
	keys = {
		{ "<leader>tt", "<cmd>Trouble todo<cr>", desc = "Todos" },
		{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todos" },
	},
	config = true,
}
