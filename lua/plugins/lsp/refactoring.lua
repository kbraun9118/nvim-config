--- @type LazySpec
return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"lewis6991/async.nvim",
	},
	lazy = false,
	config = function()
		vim.keymap.set({ "n", "x" }, "<leader>ls", function()
			require("refactoring").select_refactor()
		end, { desc = "Select refactor" })
	end,
}
