-- set leader to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- Escaping
keymap.set({ "i", "v" }, "<C-j>", "<Esc>", { desc = "Exit insert mode" })
keymap.set({ "i", "v" }, "<C-c>", "<Esc>", { desc = "Exit insert mode" })

-- Convenient moving
keymap.set({ "n", "v" }, "L", "$")
keymap.set({ "n", "v" }, "H", "^")

-- Moving between splits
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to split left" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to split right" })
keymap.set("n", "<C-K>", "<C-w>k", { desc = "Move to split up" })
keymap.set("n", "<C-J>", "<C-w>j", { desc = "Move to split down" })

-- Saving and closing
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", "<cmd>qa<CR>", { desc = "Close nvim" })
keymap.set("n", "<leader>c", "<cmd>bd<CR>", { desc = "Close buffer" })

-- Indenting
keymap.set("v", "<Tab>", ">", { desc = "Indent" })
keymap.set("n", "<Tab>", ">>", { desc = "Indent" })
keymap.set("v", "<S-Tab>", "<", { desc = "Unindent" })
keymap.set("n", "<S-Tab>", "<<", { desc = "Unindent" })

-- Clear search
keymap.set("n", "<leader>z", "<cmd>noh<CR>", { desc = "Clear search" })
