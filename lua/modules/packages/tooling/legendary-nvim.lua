local manifest = {
  'mrjones2014/legendary.nvim',
  lazy = false,
}

manifest.config = function()
  local plugin = require('legendary')

  plugin.setup({
    keymaps = vim.tbl_extend(
      'force',
      require('legendary.keymaps.general'),
      require('legendary.keymaps.file-explorer')
    ),
  })
end

return manifest
