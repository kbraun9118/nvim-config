return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    "nvim-tree/nvim-web-devicons",
    "debugloop/telescope-undo.nvim"
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          }
        }
      }
    })

    telescope.load_extension("fzf")
    telescope.load_extension("undo")

    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
    vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Fuzzy find string in cwd" })
    vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Fuzzy find string under cursor in cwd" })
    vim.keymap.set("n", "<leader>fm", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Fuzzy find LSP symbols in workspace"})
    vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "Open undo tree" })
  end
}
