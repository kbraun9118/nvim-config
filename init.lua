require("options")
require("keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins" },
	{ import = "plugins.lsp" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.ui" },
	{ import = "plugins.languages.typescript" },
	{ import = "plugins.test" },
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	ui = {
		border = "rounded",
	},
})

vim.keymap.set("n", "<leader>pl", "<cmd>Lazy<CR>", { desc = "Open Lazy" })
