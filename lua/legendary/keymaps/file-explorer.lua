return {
  Keybind()
    :with_keymap('<C-n>')
    :with_mode('n')
    :with_description('Toggle file explorer')
    :with_callback(vim.cmd.NvimTreeToggle)
    :non_remappable()
    :silent()
    :build(),
}
