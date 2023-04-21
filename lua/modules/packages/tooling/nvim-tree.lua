local manifest = {
  'nvim-tree/nvim-tree.lua',
  lazy = true,
  cmd = {
    'NvimTreeToggle',
    'NvimTreeOpen',
    'NvimTreeFindFile',
    'NvimTreeFindFileToggle',
    'NvimTreeRefresh',
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
}

manifest.config = function()
  local plugin = require('nvim-tree')

  local icons = vndtta.utils.icons

  plugin.setup({
    filters = {
      dotfiles = false,
      exclude = { '.git', 'node_modules' },
    },
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = false,
    },
    view = {
      adaptive_size = false,
      side = 'left',
      width = 30,
      preserve_window_proportions = true,
    },
    git = {
      enable = false,
      ignore = true,
    },
    filesystem_watchers = {
      enable = true,
    },
    actions = {
      open_file = {
        resize_window = true,
      },
    },
    renderer = {
      root_folder_label = false,
      highlight_git = false,
      highlight_opened_files = 'none',
      indent_markers = {
        enable = false,
      },
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = false,
        },
        glyphs = {
          default = icons.get('documents')['Default'],
          symlink = icons.get('documents')['Symlink'],
          folder = {
            default = '',
            empty = '',
            empty_open = '',
            open = '',
            symlink = '',
            symlink_open = '',
            arrow_open = icons.get('ui')['ArrowOpen'],
            arrow_closed = icons.get('ui')['ArrowClosed'],
          },
          git = {
            unstaged = icons.get('git')['Unstaged'],
            staged = icons.get('git')['Staged'],
            unmerged = icons.get('git')['Unmerged'],
            renamed = icons.get('git')['Rename'],
            untracked = icons.get('git')['Untracked'],
            deleted = icons.get('git')['Remove'],
            ignored = icons.get('git')['Ignore'],
          },
        },
      },
    },
  })
end

return manifest
