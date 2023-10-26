return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		toggler = {
			line = "<leader>/",
			block = "<leader>\\",
		},
		opleader = {
			line = "<leader>/",
			block = "<leader>\\",
		},
	},
}
