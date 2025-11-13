--- @type LazySpec
return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
		{
			"fredrikaverpil/neotest-golang",
			version = "*", -- Optional, but recommended; track releases
			build = function()
				vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
			end,
		},
		"nvim-neotest/neotest-jest",
		"marilari88/neotest-vitest",
		"rouge8/neotest-rust",
	},
	config = function()
		local neotest = require("neotest")
		neotest.setup({
			adapters = {
				require("neotest-python")({}),
				require("neotest-golang")({
					runner = "gotestsum", -- Optional, but recommended
				}),
				require("neotest-rust")({}),
				require("neotest-jest")({}),
				require("neotest-vitest")({}),
			},
			floating = {
				border = "rounded",
			},
		})

		vim.keymap.set("n", "<leader>yy", neotest.run.run, { desc = "Run nearest" })
		vim.keymap.set("n", "<leader>yp", function()
			neotest.run.run(vim.fn.getcwd())
		end, { desc = "Run all" })
		vim.keymap.set("n", "<leader>yf", function()
			neotest.run.run(vim.fn.expand("%"))
		end, { desc = "Run file" })
		vim.keymap.set("n", "<leader>yk", neotest.output.open, { desc = "Display output" })
		vim.keymap.set("n", "<leader>ye", neotest.summary.toggle, { desc = "Toggle summary" })
	end,
}
