local manager = nil

local packages = {}

---Checks whether the plugin manager is installed.
---
---@return boolean installed Whether the plugin manager is installed.
packages.is_installed = function()
  return manager ~= nil
end

---Creates the capabilities for the plugin manager.
---
---It will install the plugin manager if it is not installed.
packages.create_capabilities = function()
  if not packages.is_installed() then
    manager = require('core.helpers.ensure-manager')()
  end
end

---Synchronizes the plugins.
packages.synchronize = function()
  manager.setup({
    require('modules.packages.ui.rose-pine'),
    require('modules.packages.ui.lualine-nvim'),
    require('modules.packages.ui.bufferline-nvim'),
    require('modules.packages.tooling.nvim-tree'),
    require('modules.packages.tooling.legendary-nvim'),
    require('modules.packages.treesitter.nvim-treesitter'),
  })
end

return packages
