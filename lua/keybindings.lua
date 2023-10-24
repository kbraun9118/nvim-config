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

keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to split left" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to split left" })

keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", "<cmd>qa<CR>", { desc = "Close nvim" })
keymap.set("n", "<leader>c", "<cmd>bd<CR>", { desc = "Close buffer" })
