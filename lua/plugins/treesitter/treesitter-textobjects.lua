--- @type LazySpec
return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	after = "nvim-treesitter",
	requires = "nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter-textobjects").setup({
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
				},
			},
		})

		vim.keymap.set({ "x", "o" }, "af", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
		end, { desc = "arround function" })
		vim.keymap.set({ "x", "o" }, "if", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
		end, { desc = "inside function" })
		vim.keymap.set({ "x", "o" }, "ac", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
		end, { desc = "arround class" })
		vim.keymap.set({ "x", "o" }, "ic", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
		end, { desc = "inside class" })
	end,
}
