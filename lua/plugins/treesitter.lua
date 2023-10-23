return {
  "nvim-treesitter/nvim-treesitter",
 config = function ()
   require("nvim-treesitter.configs").setup({
    ensure_installed = {"lua", "typescript", "javascript", "html", "css", "rust", "ocaml", "go"}
  })
 end
}
