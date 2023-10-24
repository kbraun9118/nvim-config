return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local on_attach = function(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
      vim.keymap.set("n", "l", api.node.open.preview, opts("Close Directory"))
      vim.keymap.set("n", "?", api.tree.toggle_help, opts("Toggle Help"))
      vim.keymap.set("n", ".", api.tree.change_root_to_node, opts("Change Root"))
    end

    require("nvim-tree").setup({
      view = {
        width = 40,
        relativenumber = true,
      },
      on_attach = on_attach,
      filters = {
        custom = {
          "^\\.git$",
        },
      },
    })

    vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree" })
  end,
}
