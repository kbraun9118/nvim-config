---@type LazySpec
return {
	{
		"navarasu/onedark.nvim",
		version = "v0.1.0",
		priority = 1000,
		-- opts = {
		-- 	style = "warmer",
		-- },
		config = function()
			local onedark = require("onedark")
			onedark.setup({
				style = "warmer",
			})
			onedark.load()
			-- vim.cmd.colorscheme("onedark")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		---@require("catppuccin")
		---@type CatppuccinOptions
		-- opts = {
		-- 	flavour = "macchiato",
		-- 	auto_integrations = true,
		-- },
		-- init = function()
		-- 	vim.cmd.colorscheme("catppuccin")
		-- end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		---@require("tokyonight")
		---@type tokyonight.Config
		-- opts = {
		-- 	style = "storm",
		-- },
		-- init = function()
		-- 	vim.cmd.colorscheme("tokyonight")
		-- end,
	},
	{
		"LunarVim/darkplus.nvim",
		lazy = false,
		priority = 1000,
		---@require("tokyonight")
		---@type tokyonight.Config
		-- opts = {},
		-- init = function()
		-- 	vim.cmd.colorscheme("darkplus")
		-- end,
	},
}
