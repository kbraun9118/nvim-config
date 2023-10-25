return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
      ensure_installed = { "lua", "typescript", "javascript", "html", "css", "rust", "ocaml", "go", "svelte" },
    })
  end,
}
