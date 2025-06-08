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
        local registry = require 'mason-registry'
        local installed_packages = registry.get_installed_package_names()
        local packages_outdated = 0

        for _, pkg_name in ipairs(installed_packages) do
          local pkg = registry.get_package(pkg_name)
          if pkg then
            local ok_installed, installed_version = pcall(pkg.get_installed_version, pkg)
            local ok_latest, latest_version = pcall(pkg.get_latest_version, pkg)
            if ok_installed and ok_latest and installed_version ~= latest_version then
              packages_outdated = packages_outdated + 1
            end
          end
        end

        return packages_outdated > 0 and tostring(packages_outdated) or ''
      end

      lualine.setup({
        options = {
          globalstatus = true,
        },
        extensions = { "lazy", "mason" },
        sections = {
          lualine_c = {
            { "filename" },
          },
          lualine_x = {
            { "harpoon2" },
            {
              lazy_status.updates,
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
