local manifest = {
  'nvim-treesitter/nvim-treesitter-context',
}

manifest.config = function()
  local plugin = require('treesitter-context')

  plugin.setup({
    enable = true,
  })
end

return manifest
