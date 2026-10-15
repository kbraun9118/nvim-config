vim.filetype.add({
	pattern = {
		[".*%.cfn%.yaml"] = "yaml.cloudformation",
		[".*%.cfn%.yml"] = "yaml.cloudformation",
		[".*%.cfn%.json"] = "json.cloudformation",
		[".*%.template%.yaml"] = "yaml.cloudformation",
		[".*%.template%.yml"] = "yaml.cloudformation",
		[".*%.template%.json"] = "json.cloudformation",
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "yaml.cloudformation",
	callback = function()
		vim.treesitter.language.register("yaml", "yaml.cloudformation")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "json.cloudformation",
	callback = function()
		vim.treesitter.language.register("json", "json.cloudformation")
	end,
})
