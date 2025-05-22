return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	config = function()
		require("bufferline").setup({
			options = {
				separator_style = "slant",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return icon .. count
				end,
				offsets = {
					{
						filetype = "snacks_picker_list",
						text = "File Explorer",
						text_align = "left",
						separator = true,
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", { desc = "Close buffers left" })
		vim.keymap.set("n", "<leader>br", "<cmd>BufferLineCloseRight<CR>", { desc = "Close buffers right" })
		vim.keymap.set(
			"n",
			"<leader>bo",
			"<cmd>BufferLineCloseOthers<CR>",
			{ desc = "Close buffers other than current" }
		)
		vim.keymap.set("n", "<leader>bC", "<cmd>BufferLinePickClose<CR>", { desc = "Pick buffer to close" })
		vim.keymap.set("n", "<leader>bb", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
	end,
}
