--- @type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    -- require("nvim-treesitter").setup({
    -- 	highlight = {
    -- 		enable = true,
    -- 	},
    -- 	auto_install = true,
    -- 	-- autotag = {
    -- 	--   enable = true,
    -- 	-- },
    -- })
    local treesitter = require("nvim-treesitter")
    treesitter.install({
      "lua",
      "typescript",
      "javascript",
      "html",
      "css",
      "rust",
      "go",
      "java",
      "tsx",
      "jsx",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local bufnr = args.buf
        local ft = vim.bo[bufnr].filetype
        if not ft or ft == "" then
          return
        end

        local lang = require("vim.treesitter.language").get_lang(ft)

        local ok, parser = pcall(vim.treesitter.get_parser, bufnr)

        if not ok or not parser then
          require("nvim-treesitter").install(lang):wait(300000)
        end

        pcall(vim.treesitter.start)
      end,
    })
    require("nvim-ts-autotag").setup({})
  end,
}
