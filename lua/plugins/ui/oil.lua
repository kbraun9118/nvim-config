return {
	"stevearc/oil.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("oil").setup()

		vim.keymap.set("n", "<leader>e", "<cmd>Oil<Cr>", { desc = "Open parent directory" })
	end,
}
