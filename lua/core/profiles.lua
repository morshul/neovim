local profiles = {}

---Loads the options from a profile.
---
---@param profile 'default' | string | table The profile to load.
profiles.load = function(profile)
  if type(profile) == 'string' then
    profile = require('core.profiles.' .. profile)
  end

  assert(type(profile) == 'table', 'The profile must be a table')

  for key, value in pairs(profile) do
    if type(value) == 'function' then
      value(vim.opt[key])
    else
      vim.opt[key] = value
    end
  end
end

return profiles
