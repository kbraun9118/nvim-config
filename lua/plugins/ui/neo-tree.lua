return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	---@module "neo-tree"
	---@type neotree.Config?
	opts = {
		filesystem = {
			follow_current_file = {
				enabled = true,
			},
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)

		local function on_move(data)
			Snacks.rename.on_rename_file(data.source, data.destination)
		end
		local events = require("neo-tree.events")
		opts.event_handlers = opts.event_handlers or {}
		vim.list_extend(opts.event_handlers, {
			{ event = events.FILE_MOVED, handler = on_move },
			{ event = events.FILE_RENAMED, handler = on_move },
		})

		vim.keymap.set("n", "<leader>e", "<cmd>Neotree<cr>", { desc = "Open NeoTree" })
	end,
}
