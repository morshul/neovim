local manifest = {
  'nvim-lualine/lualine.nvim',
  event = { 'ColorScheme' },
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' },
  },
}

manifest.config = function()
  local plugin = require('lualine')

  plugin.setup({
    options = {
      theme = 'rose-pine',
    },
  })
end

return manifest
