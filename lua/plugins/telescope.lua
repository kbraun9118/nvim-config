return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build =
      "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    "nvim-tree/nvim-web-devicons",
    "debugloop/telescope-undo.nvim",
  },
  event = "VeryLazy",
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
          },
        },
      },
      extensions = {
        undo = {
          side_by_side = true,
          layout_strategy = "vertical",
          layout_config = {
            preview_height = 0.65,
          },
          mappings = {
            i = {
              ["<cr>"] = require('telescope-undo.actions').restore
            }
          }
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("undo")

    local telescope_builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>fr", telescope_builtin.oldfiles, { desc = "Fuzzy find recent files" })
    vim.keymap.set("n", "<leader>fs", telescope_builtin.live_grep, { desc = "Fuzzy find string in cwd" })
    vim.keymap.set(
      "n",
      "<leader>fc",
      telescope_builtin.grep_string,
      { desc = "Fuzzy find string under cursor in cwd" }
    )
    vim.keymap.set("n", "<leader>fm", telescope_builtin.treesitter, { desc = "Fuzzy find treesitter symbols" })
    vim.keymap.set("n", "<leader>fq", telescope_builtin.quickfix, { desc = "Fuzzy find quickfix" })
    vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>", { desc = "Open undo tree" })
    vim.keymap.set("n", "<leader>fk", telescope_builtin.keymaps, { desc = "Fuzzy find keymaps" })
  end,
}
