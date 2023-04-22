local manifest = {
  'lukas-reineke/indent-blankline.nvim',
  lazy = true,
  event = { 'BufReadPost' },
}

manifest.config = function()
  local plugin = require('indent_blankline')

  plugin.setup({
    char = '▏',
    show_first_indent_level = true,
    filetype_exclude = {
      'NvimTree',
      'TelescopePrompt',
      'dashboard',
      'git',
      'gitcommit',
      'vimwiki',
      'help',
      'fugitive',
    },
    buftype_exclude = { 'terminal', 'nofile' },
    show_trailing_blankline_indent = false,
    show_current_context = true,
    context_patterns = {
      '^if',
      '^table',
      'block',
      'class',
      'for',
      'function',
      'if_statement',
      'import',
      'list_literal',
      'method',
      'selector',
      'type',
      'var',
      'while',
    },
    space_char_blankline = ' ',
  })
end

return manifest
