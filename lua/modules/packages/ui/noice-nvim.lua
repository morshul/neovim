local manifest = {
  'folke/noice.nvim',
  lazy = false,
  dependencies = {
    { 'MunifTanjim/nui.nvim' },
  },
}

manifest.config = function()
  local plugin = require('noice')

  plugin.setup({
    lsp = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = false,
    },
    views = {
      cmdline_popup = {
        position = {
          row = 5,
          col = '50%',
        },
        size = {
          width = 60,
          height = 'auto',
        },
        border = {
          style = 'none',
          padding = { 1, 2 },
        },
        filter_options = {},
        win_options = {
          winhighlight = {
            NormalFloat = 'NormalFloat',
            FloatBorder = 'FloatBorder',
          },
        },
      },
      popupmenu = {
        relative = 'editor',
        position = {
          row = 8,
          col = '50%',
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = 'none',
          padding = { 1, 2 },
        },
        win_options = {
          winhighlight = {
            Normal = 'NormalFloat',
            FloatBorder = 'DiagnosticInfo',
          },
        },
      },
    },
  })
end

return manifest
