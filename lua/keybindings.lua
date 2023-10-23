-- set leader to space
vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "<C-j>", "<Esc>", { desc = "Exit insert mode" })
keymap.set("v", "<C-j>", "<Esc>", { desc = "Exit insert mode" })
keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit insert mode" })
keymap.set("v", "<C-c>", "<Esc>", { desc = "Exit insert mode" })

keymap.set("n", "L", "$")
keymap.set("v", "L", "$")
keymap.set("n", "H", "^")
keymap.set("v", "H", "^")
