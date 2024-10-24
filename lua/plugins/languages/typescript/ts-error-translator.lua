return {
  "dmmulroy/ts-error-translator.nvim",
  ft = "ts",
  config = function()
    require("ts-error-translator").setup()
  end,
}
