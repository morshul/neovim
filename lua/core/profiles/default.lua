return {
  backup = false,
  writebackup = false,
  swapfile = false,
  showmode = false,
  showcmd = false,
  ruler = false,
  wrap = false,
  foldenable = false,
  undofile = true,
  hlsearch = true,
  ignorecase = true,
  smartcase = true,
  smartindent = true,
  splitright = true,
  splitbelow = true,
  termguicolors = true,
  expandtab = true,
  relativenumber = true,
  clipboard = 'unnamedplus',
  fileencoding = 'utf-8',
  guifont = 'JetBrainsMono Nerd Font:h12',
  signcolumn = 'yes',
  mouse = 'a',
  cmdheight = 1,
  conceallevel = 0,
  pumheight = 10,
  showtabline = 0,
  timeoutlen = 1000,
  updatetime = 300,
  shiftwidth = 2,
  tabstop = 2,
  laststatus = 3,
  scrolloff = 8,
  sidescrolloff = 8,
  completeopt = { 'menuone', 'noselect' },
  shortmess = function(self)
    self:append('c')
  end,
  whichwrap = function(self)
    self:append('<,>,[,],h,l')
  end,
  iskeyword = function(self)
    self:append('-')
  end,
  formatoptions = function(self)
    self:remove({ 'c', 'r', 'o' })
  end,
}
