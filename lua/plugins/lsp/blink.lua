--- @type LazySpec
return {
	{
		"saghen/blink.cmp",
		dependencies = { "folke/lazydev.nvim", "rafamadriz/friendly-snippets" },
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
							return cmp.select_next()
						else
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
				ghost_text = {
					enabled = true,
				},
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						source_offset = 100,
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
