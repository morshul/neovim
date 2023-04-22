_G.vndtta = {
  core = {
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
