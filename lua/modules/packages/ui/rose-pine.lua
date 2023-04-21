local manifest = {
  'rose-pine/neovim',
  lazy = false,
}

manifest.config = function()
  local plugin = require('rose-pine')

  plugin.setup({
    variant = 'auto',
    dark_variant = 'main',
    highlight_groups = {
      StatusLine = { fg = 'love', bg = 'love', blend = 10 },
      StatusLineNC = { fg = 'subtle', bg = 'surface' },
    },
  })

  vim.cmd.colorscheme('rose-pine')
end

return manifest
