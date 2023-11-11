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
	},
	{
		"navarasu/onedark.nvim",
		name = "onedark",
		priority = 1000,
		config = function()
			local onedark = require("onedark")
			onedark.setup({
				style = "warmer",
			})
			onedark.load()
		end,
	},
	{
		"tanvirtin/monokai.nvim",
		name = "monokai",
		priority = 1000,
	},
}
