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

packages.synchronize = function()
  manager.setup({})
end

return packages
