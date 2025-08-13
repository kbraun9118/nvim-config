return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
	opts = {},
	config = function(opts)
		require("todo-comments").setup(opts)

		vim.keymap.set("n", "<leader>tt", "<cmd>Trouble todo<cr>", { desc = "Todos" })
	end,
}
