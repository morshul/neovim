local manifest = {
  'akinsho/bufferline.nvim',
  lazy = true,
  event = { 'ColorScheme' },
}

manifest.config = function()
  local plugin = require('bufferline')
  local highlights = require('rose-pine.plugins.bufferline')

  local icons = vndtta.utils.icons.get('ui')

  plugin.setup({
    options = {
      number = nil,
      modified_icon = icons['Modified'],
      buffer_close_icon = icons['Close'],
      left_trunc_marker = icons['Left'],
      right_trunc_marker = icons['Right'],
      max_name_length = 14,
      max_prefix_length = 13,
      tab_size = 20,
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      enforce_regular_tabs = true,
      always_show_bufferline = true,
      separator_style = 'thin',
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(count)
        return string.format('(%s)', count)
      end,
      offsets = {
        {
          filetype = 'NvimTree',
          text = 'File Explorer',
          text_align = 'center',
          padding = 1,
        },
      },
    },
    highlights = highlights,
  })
end

return manifest
