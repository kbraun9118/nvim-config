return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim", "nvim-telescope/telescope.nvim" },
	opts = {},
	config = function(opts)
		require("todo-comments").setup(opts)

		vim.keymap.set("n", "<leader>tt", "<cmd>Trouble todo<cr>", { desc = "Todos" })
		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Todos" })
	end,
}
