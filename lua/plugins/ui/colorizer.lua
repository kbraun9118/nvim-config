--- @type LazySpec
return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	---@module 'colorizer.config'
	---@type colorizer.SetupOptions
	opts = {
		options = {},
	},
}
