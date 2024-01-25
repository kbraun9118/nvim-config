return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {},
  config = function()
    local trouble = require("trouble")

    vim.keymap.set("n", "<leader>tt", trouble.toggle, {desc = "Toggle"})
    vim.keymap.set("n", "<leader>tw", trouble.toggle, {desc = "Workspace"})
    vim.keymap.set("n", "<leader>td", trouble.toggle, {desc = "Document"})
  end
}
