--- @type LazySpec
return {
	{
		"folke/lazydev.nvim",
		dependencies = { "justinsgithub/wezterm-types" },
		ft = "lua",
		---@module "lazydev"
		---@type lazydev.Config
		opts = {
			library = {
				{ "lazy.nvim" },
				{ path = "wezterm-types", mods = { "wezterm" } },
				{ path = "snacks.nvim", words = { "Snacks" } },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"williamboman/mason-lspconfig.nvim",
			"antosha417/nvim-lsp-file-operations",
			"folke/snacks.nvim",
			"b0o/schemastore.nvim",
		},
		config = function()
			require("lspconfig")

			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				pattern = "*.gitlab-ci*.{yml,yaml}",
				callback = function()
					vim.bo.filetype = "yaml.gitlab"
				end,
			})

			require("mason-lspconfig").setup()

			local setkey = function(keys, cmd, desc)
				vim.keymap.set("n", keys, cmd, { noremap = true, silent = true, desc = desc })
			end
			vim.lsp.inlay_hint.enable(true)

			setkey("gr", Snacks.picker.lsp_references, "Show LSP references")
			setkey("gD", Snacks.picker.lsp_declarations, "Goto Declaration")
			setkey("gd", Snacks.picker.lsp_definitions, "Show LSP definitions")
			setkey("gi", Snacks.picker.lsp_implementations, "Show LSP implementations")
			setkey("gt", Snacks.picker.lsp_type_definitions, "Show LSP type definitions")
			setkey("<leader>la", vim.lsp.buf.code_action, "See available code actions")
			setkey("<leader>lr", vim.lsp.buf.rename, "Smart rename")
			setkey("<leader>lD", Snacks.picker.diagnostics_buffer, "Show buffer diagnostics")
			setkey("<leader>ld", function()
				vim.diagnostic.open_float({ border = "rounded" })
			end, "Show line diagnostics")
			setkey("<leader>lR", "<cmd>LspRestart<cr>", "Restart LSP")
			setkey("[d", function()
				vim.diagnostic.jump({ count = -1 })
			end, "Goto previous diagnostic")
			setkey("]d", function()
				vim.diagnostic.jump({ count = 1 })
			end, "Goto next diagnostic")
			setkey("K", function()
				vim.lsp.buf.hover({ border = "rounded" })
			end, "Show documentation")

			vim.diagnostic.config({
				update_in_insert = true,
				virtual_text = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = "󰠠 ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
			})

			vim.lsp.enable("ocamllsp")
			vim.lsp.enable("hls")
			vim.lsp.enable("gleam")

			vim.lsp.config("gopls", {
				settings = {
					gopls = {
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							ignoredError = true,
							rangeVariableTypes = true,
						},
					},
				},
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						workspace = { checkThirdParty = false },
					},
				},
			})

			vim.lsp.config("pylsp", {
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								ignore = { "E501" },
							},
						},
					},
				},
			})

			vim.lsp.config("tailwindcss", {
				settings = {
					tailwindCSS = {
						classFunctions = { "tw", "twMerge" },
					},
				},
			})

			vim.lsp.config("basedpyright", {
				settings = {
					basedpyright = {
						reportAny = false,
					},
				},
			})

			vim.lsp.config("ts_ls", {
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vim.fn.stdpath("data")
								.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
							languages = { "vue" },
						},
					},
					preferences = {
						includeInlayVariableTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
					},
				},
			})

			vim.lsp.config("vue_ls", {
				init_options = {
					vue = { hybridMode = false },
				},
			})

			vim.lsp.config("yamlls", {
				settings = {
					yaml = {
						customTags = {
							"!reference sequence",
						},
					},
				},
			})

			vim.lsp.config("svelte", {
				on_attach = function(client)
					vim.api.nvim_create_autocmd("BufWritePost", {
						pattern = { "*.js", "*.ts" },
						callback = function(ctx)
							print("here")
							vim.notify("Here")
							client:notify("$/onDidChangeTsOrJsFile", {
								uri = ctx.match,
							})
						end,
					})
				end,
			} --[[@as vim.lsp.Config]])

			vim.lsp.config("jsonls", {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
					},
				},
			}--[[@as vim.lsp.Config]])
		end,
	},
}
