_G.vndtta = {
  core = {
    profiles = require('core.profiles'),
  },
  modules = {
    packages = require('modules.packages'),
  },
}

vndtta.core.profiles.load('default')

vndtta.modules.packages.create_capabilities()
vndtta.modules.packages.synchronize()