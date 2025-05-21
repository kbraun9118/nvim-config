return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "enter",
				["<C-e>"] = {},
				["<C-c>"] = { "hide" },
				["<C-n>"] = {
					function(cmp)
						if cmp.is_menu_visible() then
							print("nexting")
							return cmp.select_next()
						else
							print("showing")
							return cmp.show()
						end
					end,
					"fallback_to_mappings",
				},
				["<Tab>"] = {
					function(cmp)
						if cmp.is_menu_visible() then
							return cmp.select_next()
						end
						if cmp.snippet_active() then
							return cmp.snippet_forward()
						end
					end,
					"fallback",
				},

				["<S-Tab>"] = {
					function(cmp)
						if cmp.is_menu_visible() then
							return cmp.select_prev()
						end
						if cmp.snippet_active() then
							return cmp.snippet_backward()
						end
					end,
					"fallback",
				},
			},
			completion = {
				menu = {
					border = "rounded",
				},
				documentation = {
					auto_show = true,
					window = {
						border = "rounded",
					},
				},
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
