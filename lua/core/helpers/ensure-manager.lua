---The options to use when cloning the plugin manager.
---
---@class vndtta.modules.LazyOptions
---@field public repository string The repository to clone the plugin manager from.
---@field public branch string The branch to clone the plugin manager from.

---Ensures that the plugin manager is installed.
---
---@param options? vndtta.modules.LazyOptions The options to use when cloning the plugin manager.
return function(options)
  options = options
    or {
      repository = 'folke/lazy.nvim',
      branch = 'stable',
    }

  local path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

  if not vim.loop.fs_stat(path) then
    print('Installing plugin manager...')

    vim.fn.system({
      'git',
      'clone',
      'https://github.com/' .. options.repository,
      '--filter=blob:none',
      '--branch=' .. options.branch,
      path,
    })
  end

  vim.opt.rtp:prepend(path)

  return require('lazy')
end
