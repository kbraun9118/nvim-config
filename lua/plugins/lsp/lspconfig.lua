return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"nvim-lua/plenary.nvim",
		"williamboman/mason-lspconfig.nvim",
		"folke/neodev.nvim",
	},
	config = function()
		require("neodev").setup({})
		local lspconfig = require("lspconfig")

		vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
			pattern = "*.gitlab-ci*.{yml,yaml}",
			callback = function()
				vim.bo.filetype = "yaml.gitlab"
			end,
		})

		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local mason_lspconfig = require("mason-lspconfig")

		local on_attach = function(client, bufnr)
			local setkey = function(keys, cmd, desc)
				vim.keymap.set("n", keys, cmd, { noremap = true, silent = true, desc = desc, buffer = bufnr })
			end

			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

			setkey("gr", "<cmd>Telescope lsp_references<CR>", "Show LSP references")
			setkey("gD", vim.lsp.buf.declaration, "Goto Declaration")
			setkey("gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions")
			setkey("gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations")
			setkey("gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions")
			setkey("<leader>la", vim.lsp.buf.code_action, "See available code actions")
			setkey("<leader>lr", vim.lsp.buf.rename, "Smart rename")
			setkey("<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics")
			setkey("<leader>ld", vim.diagnostic.open_float, "Show line diagnostics")
			setkey("<leader>lR", "<cmd>LspRestart<cr>", "Restart")
			setkey("[d", function()
				vim.diagnostic.jump({ count = 1, float = true })
			end, "Goto previous diagnostic")
			setkey("]d", function()
				vim.diagnostic.jump({ count = -1, float = true })
			end, "Goto next diagnostic")
			setkey("K", function()
				vim.lsp.buf.hover({ border = "rounded" })
			end, "Show documentation")
			setkey("<leader>ls", "<cmd>LspRestart<CR>", "Restart LSP")
			setkey("<leader>lf", function()
				vim.lsp.buf.format({ async = true })
			end, "Format buffer")

			vim.diagnostic.config({ update_in_insert = true })

			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ async = false })
					end,
				})
			end
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()
		vim.diagnostic.config({
			update_in_insert = true,
			virtual_lines = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
		})
		-- end

		-- let opam installed lsp take over
		lspconfig["ocamllsp"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig["hls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig["gleam"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig["angularls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		-- lspconfig["basedpyright"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		--
		-- 	settings = {
		-- 		basedpyright = {
		-- 			reportAny = false,
		-- 		},
		-- 	},
		-- })
		--
		local mason_registry = require("mason-registry")
		local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
			.. "/node_modules/@vue/language-server"

		mason_lspconfig.setup_handlers({
			function(server)
				lspconfig[server].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end,
			["lua_ls"] = function(server)
				lspconfig[server].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							workspace = { checkThirdParty = false },
						},
					},
				})
			end,
			["pylsp"] = function(server)
				lspconfig[server].setup({
					capabilities = capabilities,
					on_attach = on_attach,
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
			end,
			["ts_ls"] = function(server)
				lspconfig[server].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					init_options = {
						plugins = {
							{
								name = "@vue/typescript-plugin",
								location = vue_language_server_path,
								languages = { "vue" },
							},
						},
					},
				})
			end,
			["volar"] = function(server)
				lspconfig[server].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					init_options = {
						vue = { hybridMode = false },
					},
				})
			end,
			["tailwindcss"] = function(server)
				lspconfig[server].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = {
						tailwindCSS = {
							classFunctions = { "tw", "twMerge" },
						},
					},
				})
			end,
		})
	end,
}
