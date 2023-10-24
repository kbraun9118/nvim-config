return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
			},
			ensure_installed = { "lua", "typescript", "javascript", "html", "css", "rust", "ocaml", "go", "svelte" },
		})
	end,
}
