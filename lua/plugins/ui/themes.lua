return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"rmehri01/onenord.nvim",
		name = "onenord",
		priority = 1000,
		config = function()
			require("onenord").setup()
		end,
	},
}
