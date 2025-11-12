return {
  'abecodes/tabout.nvim',
  lazy = false,
  config = function()
    require('tabout').setup({})
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  event = 'InsertCharPre',
  priority = 1000,
}
