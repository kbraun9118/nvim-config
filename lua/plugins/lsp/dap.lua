--- @type LazySpec
return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dap_widgets = require("dap.ui.widgets")
			vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debugger continue " })
			vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debugger step over" })
			vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debugger step into" })
			vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debugger step out" })
			vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
			vim.keymap.set("n", "<Leader>dl", function()
				dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end, { desc = "Toggle log point" })
			vim.keymap.set("n", "<leader>ds", dap.stop, { desc = "Stop" })
			-- vim.keymap.set("n", "<Leader>dr", function()
			-- 	dap.repl.open()
			-- end)
			vim.keymap.set("n", "<Leader>dr", dap.run_last, { desc = "Run last" })
			vim.keymap.set({ "n", "v" }, "<Leader>dh", dap_widgets.hover, { desc = "Hover" })
			vim.keymap.set({ "n", "v" }, "<Leader>dp", dap_widgets.preview, { desc = "Preview" })
			-- vim.keymap.set("n", "<Leader>df", function()
			-- 	local widgets = require("dap.ui.widgets")
			-- 	widgets.centered_float(widgets.frames)
			-- end, { desc = "Open float"})
			-- vim.keymap.set("n", "<Leader>ds", function()
			-- 	local widgets = require("dap.ui.widgets")
			-- 	widgets.centered_float(widgets.scopes)
			-- end)
			--
			vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require("mason-nvim-dap").setup({
				handlers = {},
			})
		end,
	},
	{
		dependencies = {
			"nvim-neotest/nvim-nio",
		},
		"rcarriga/nvim-dap-ui",
		config = function()
			local dapui = require("dapui")
			dapui.setup({})

			vim.keymap.set("n", "<leader>du", function()
				dapui.toggle()
			end, { desc = "Toggle UI" })
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup({})
		end,
	},
	{
		"leoluz/nvim-dap-go",
		config = function()
			require("dap-go").setup()
		end,
	},
}
