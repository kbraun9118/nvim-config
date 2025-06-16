--- @type LazySpec
return {
	"folke/flash.nvim",
	keys = {
		{
			"<leader>ss",
			mode = "n",
			function()
				require("flash").jump()
			end,
			desc = "Jump",
		},
		{
			"<leader>st",
			mode = "n",
			function()
				require("flash").treesitter()
			end,
			desc = "Treesitter",
		},
	},
}
