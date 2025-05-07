return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	---@type ibl.config
	opts = {
		scope = {
			enabled = true,
		},
	},
}
