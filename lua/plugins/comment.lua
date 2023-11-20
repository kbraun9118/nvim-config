return {
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			toggler = {
				line = "<leader>/",
				block = "<leader>\\",
			},
			opleader = {
				line = "<leader>/",
				block = "<leader>\\",
			},
		},
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = true,
			})

			vim.g.skip_ts_context_commentstring_module = true
		end,
	},
}
