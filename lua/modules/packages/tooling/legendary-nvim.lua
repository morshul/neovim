local manifest = {
  'mrjones2014/legendary.nvim',
  lazy = false,
}

manifest.config = function()
  local plugin = require('legendary')

  plugin.setup({
    keymaps = (function()
      local keymaps = {}
      local sections = { 'general', 'file-explorer' }

      for _, section in pairs(sections) do
        local mappings = require('legendary.keymaps.' .. section)

        for _, keybind in pairs(mappings) do
          table.insert(keymaps, keybind)
        end
      end

      return keymaps
    end)(),
  })
end

return manifest
