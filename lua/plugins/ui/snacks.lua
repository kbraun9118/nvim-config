---@type LazySpec
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    input = {
      prompt_pos = "left",
      win = {
        position = "float",
      },
    },
    picker = {
      sources = {
        explorer = {
          auto_close = true,
          win = {
            list = {
              wo = {
                relativenumber = true,
                number = true,
              },
            },
          },
        },
      },
    },
    indent = {
      indent = {},
      scope = {
        hl = "SnacksIndent1",
      },
      animate = {
        style = "down",
      },
    },
    explorer = {},
    scratch = {},
  },
  keys = {
    {
      "<leader>e",
      function()
        Snacks.explorer({ include = { ".env*" } })
      end,
      desc = "Explorer",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files({ hidden = true, include = { ".env" } })
      end,
      desc = "Files in cwd",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent files",
    },
    {
      "<leader>fe",
      function()
        Snacks.picker.grep()
      end,
      desc = "String in cwd",
    },
    {
      "<leader>fs",
      function()
        Snacks.picker.grep({
          hidden = true,
          glob = "!**/.git/*",
        })
      end,
      desc = "String in cwd",
    },
    {
      "<leader>fw",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "String in cwd",
    },
    {
      "<leader>fb",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "String in cwd",
    },
    {
      "<leader>fm",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP symbols",
    },
    {
      "<leader>fM",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP symbols",
    },
    {
      "<leader>fq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "Quickfix",
    },
    {
      "<leader>fu",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undo",
    },
    {
      "<leader>fk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>fd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>.",
      function()
        local filetypes = {
          { text = "sql" },
          { text = "xml" },
          { text = "json" },
        }

        Snacks.picker.pick({
          source = "scratch",
          items = filetypes,
          format = "text",
          actions = {
            confirm = function(picker, item)
              picker:close()
              vim.schedule(function()
                local items = picker:items()
                if #items == 0 then
                  Snacks.scratch({ ft = picker:filter().pattern })
                else
                  Snacks.scratch({ ft = item.text })
                end
              end)
            end,
          },
        })
      end,
      desc = "Toggle scratch buffer",
    },
    {
      "<leader>fS",
      function()
        Snacks.scratch.select()
      end,
      desc = "Scratch buffer",
    },
  },
}
