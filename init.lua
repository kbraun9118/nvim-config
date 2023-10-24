require("options")
require("keybindings")

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
}, {
	checker = {
		notify = false,
	},
})

vim.keymap.set("n", "<leader>pl", "<cmd>Lazy<CR>", { desc = "Open lazy config" })
