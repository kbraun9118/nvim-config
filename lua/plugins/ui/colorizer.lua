--- @type LazySpec
return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	---@module 'colorizer.config'
	---@type colorizer.SetupOptions
	opts = {
		options = {
			parsers = {
				rgb = { enable = true },
				tailwind = {
					enable = true,
					update_names = true,
					lsp = {
						enable = true,
					},
				},
			},
		},
	},
}
