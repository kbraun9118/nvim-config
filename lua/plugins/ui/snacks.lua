return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		input = {
			prompt_pos = "left",
			win = {
				position = "float",
			},
		},
		picker = {},
		indent = {
			indent = {
				-- only_scope = true,
			},
			scope = {
				hl = "SnacksIndent1",
			},
			animate = {
				style = "down",
			},
		},
	},
	keys = {
		{
			"<leader>pp",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Highlights",
		},
	},
}
