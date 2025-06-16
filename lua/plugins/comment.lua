--- @type LazySpec
return {
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("Comment").setup({
				toggler = {
					line = "<leader>/",
					block = "<leader>\\",
				},
				opleader = {
					line = "<leader>/",
					block = "<leader>\\",
				},
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})

			vim.g.skip_ts_context_commentstring_module = true
		end,
	},
}
