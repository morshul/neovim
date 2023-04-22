local manifest = {
  'nvim-treesitter/nvim-treesitter',
  lazy = true,
  event = { 'CursorHold', 'CursorHoldI' },
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    { 'mrjones2014/nvim-ts-rainbow' },
    { 'JoosepAlviste/nvim-ts-context-commentstring' },
    require('modules.packages.treesitter.nvim-treesitter-context'),
  },
}

manifest.config = function()
  local plugin = require('nvim-treesitter.configs')

  plugin.setup({
    ensure_installed = vndtta.core.helpers.dependencies.get_treesitter(),
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    indent = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          [']['] = '@function.outer',
          [']m'] = '@class.outer',
        },
        goto_next_end = {
          [']]'] = '@function.outer',
          [']M'] = '@class.outer',
        },
        goto_previous_start = {
          ['[['] = '@function.outer',
          ['[m'] = '@class.outer',
        },
        goto_previous_end = {
          ['[]'] = '@function.outer',
          ['[M'] = '@class.outer',
        },
      },
    },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = 2000,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  })
end

manifest.build = function()
  if #vim.api.nvim_list_uis() ~= 0 then
    vim.api.nvim_command('TSUpdate')
  end
end

return manifest
