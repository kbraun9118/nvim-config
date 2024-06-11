return {
	{
		"letieu/harpoon-lualine",
		dependencies = {
			{ "ThePrimeagen/harpoon", branch = "harpoon2" },
		},
	},
	{

		"nvim-lualine/lualine.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons", opt = true },
		},
		event = "VeryLazy",
		config = function()
			local lualine = require("lualine")
			local lazy_status = require("lazy.status")

			local function lualine_mason_updates()
				local registry = require("mason-registry")
				local installed_packages = registry.get_installed_packages()
				local upgrades_available = false
				local pacakges_outdated = 0

				local function check_new_version(success, _)
					if success then
						upgrades_available = true
						pacakges_outdated = pacakges_outdated + 1
					end
				end

				for _, pkg in pairs(installed_packages) do
					local p = registry.get_package(pkg.name)
					if p then
						p:check_new_version(check_new_version)
					end
				end

				if upgrades_available then
					return pacakges_outdated
				else
					return ""
				end
			end

			lualine.setup({
				options = {
					globalstatus = true,
				},
				sections = {
					lualine_c = {
						{ "filename" },
					},
					lualine_x = {
						{ "harpoon2" },
						{
							lazy_status.updates,
							icon = "🦥",
							cond = lazy_status.has_updates,
							color = { fg = "#ff9e64" },
						},
						{
							lualine_mason_updates,
							icon = "🧱",
							color = { fg = "#aa4a44" },
						},
						{ "fileformat" },
						{ "filetype" },
					},
				},
			})
		end,
	},
}
