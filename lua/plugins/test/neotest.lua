return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
		"nvim-neotest/neotest-go",
		"nvim-neotest/neotest-jest",
		"marilari88/neotest-vitest",
		"rouge8/neotest-rust",
	},
	config = function()
		local neotest = require("neotest")
		local neotest_ns = vim.api.nvim_create_namespace("neotest")
		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
					return message
				end,
			},
		}, neotest_ns)

		neotest.setup({
			adapters = {
				require("neotest-python")({}),
				require("neotest-go")({
					recursive_run = true,
				}),
				require("neotest-rust")({}),
				require("neotest-jest")({}),
				require("neotest-vitest")({}),
			},
		})

		vim.keymap.set("n", "<leader>yy", neotest.run.run, { desc = "Run nearest" })
		vim.keymap.set("n", "<leader>yp", function()
			neotest.run.run(vim.uv.cwd())
		end, { desc = "Run nearest" })
		vim.keymap.set("n", "<leader>yf", function()
			neotest.run.run(vim.fn.expand("%"))
		end, { desc = "Run file" })
		vim.keymap.set("n", "<leader>yk", neotest.output.open, { desc = "Display output" })
		vim.keymap.set("n", "<leader>ye", neotest.summary.toggle, { desc = "Toggle summary" })
	end,
}
