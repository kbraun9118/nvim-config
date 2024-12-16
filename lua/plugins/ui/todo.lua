return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		require("todo-comments").setup({})

		vim.keymap.set("n", "<leader>tt", "<cmd>Trouble todo<cr>", { desc = "Todos" })
		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Todos" })
	end,
}
