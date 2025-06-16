--- @type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
			},
			auto_install = true,
			-- autotag = {
			--   enable = true,
			-- },
			ensure_installed = {
				"lua",
				"typescript",
				"javascript",
				"html",
				"css",
				"rust",
				"go",
			},
		})
		require("nvim-ts-autotag").setup({})
	end,
}
