---@type LazySpec
return {
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			require("kanagawa").load("wave")
		end,
	},
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			-- local onedark = require("onedark")
			-- onedark.setup({
			--   style = "warmer",
			-- })
			-- onedark.load()
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
}
