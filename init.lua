_G.vndtta = {
  core = {
    helpers = {
      dependencies = require('core.helpers.dependencies'),
    },
    profiles = require('core.profiles'),
  },
  modules = {
    packages = require('modules.packages'),
  },
  utils = {
    icons = require('utils.icons'),
  },
}

_G.Keybind = require('core.keybind')

vndtta.core.profiles.load('default')

vndtta.modules.packages.create_capabilities()
vndtta.modules.packages.synchronize()

require('shared.keymaps.general')
require('shared.keymaps.file-explorer')
