---@alias vndtta.input.VimMode
---|> 'n' # The normal mode.
---| 'i' # The insert mode.
---| 'v' # The visual mode.
---| 'V' # The visual line mode.
---| 'x' # The visual block mode.
---| 't' # The terminal mode.

---@class vndtta.input.Keybind
---@field private keymap string
---@field private mode vndtta.input.VimMode
---@field private callback function | string
---@field private description string
---@field private buffer boolean
---@field private options table
---@field private options.noremap boolean
---@field private options.silent boolean
---@field private options.expr boolean
---@field private options.nowait boolean
local Keybind = {}

---Sets the keymap that will trigger the keybind.
---
---@param self vndtta.input.Keybind The object itself.
---@param keymap string The keymap that will trigger the keybind.
---@return vndtta.input.Keybind object The object itself.
Keybind.with_keymap = function(self, keymap)
  assert(type(keymap) == 'string', 'The keymap must be a string')

  self.keymap = keymap

  return self
end

---Sets the mode in which the keybind should be triggered.
---
---@param self vndtta.input.Keybind The object itself.
---@param mode vndtta.input.VimMode The mode in which the keybind should be triggered.
---@return vndtta.input.Keybind object The object itself.
Keybind.with_mode = function(self, mode)
  assert(
    mode == 'n'
      or mode == 'i'
      or mode == 'v'
      or mode == 'V'
      or mode == 'x'
      or mode == 't',
    'The mode must be a valid vim mode'
  )

  self.mode = mode

  return self
end

---Sets the callback to execute when the keybind is triggered.
---
---@param self vndtta.input.Keybind The object itself.
---@param callback function | string The callback to execute when the keybind is triggered.
---@return vndtta.input.Keybind object The object itself.
Keybind.with_callback = function(self, callback)
  assert(
    type(callback) == 'function' or type(callback) == 'string',
    'The callback must be a function or a string'
  )

  self.callback = callback

  return self
end

---Sets the buffer in which the keybind should be local.
---
---@param self vndtta.input.Keybind The object itself.
---@param buffer integer The buffer in which the keybind should be local.
---@return vndtta.input.Keybind object The object itself.
Keybind.with_buffer = function(self, buffer)
  assert(type(buffer) == 'number', 'The buffer must be a boolean or a number')

  self.options.buffer = buffer

  return self
end

---Sets the description of the keybind.
---
---@param self vndtta.input.Keybind The object itself.
---@param description string The description of the keybind.
---@return vndtta.input.Keybind object The object itself.
Keybind.with_description = function(self, description)
  assert(type(description) == 'string', 'The description must be a string')

  self.description = description

  return self
end

---Sets the keybind as non-remappable.
---
---@param self vndtta.input.Keybind The object itself.
---@return vndtta.input.Keybind object The object itself.
Keybind.non_remappable = function(self)
  self.options.noremap = true

  return self
end

---Sets the keybind as silent.
---
---@param self vndtta.input.Keybind The object itself.
---@return vndtta.input.Keybind object The object itself.
Keybind.silent = function(self)
  self.options.silent = true

  return self
end

---Sets the keybind as an expression.
---
---@param self vndtta.input.Keybind The object itself.
---@return vndtta.input.Keybind object The object itself.
Keybind.expressive = function(self)
  self.options.expr = true

  return self
end

---Sets the keybind as not waiting for other keys.
---
---@param self vndtta.input.Keybind The object itself.
---@return vndtta.input.Keybind object The object itself.
Keybind.non_blocking = function(self)
  self.options.nowait = true

  return self
end

---Builds the keybind.
---
---@param self vndtta.input.Keybind The object itself.
Keybind.build = function(self)
  vim.keymap.set(self.mode, self.keymap, self.callback, self.options)
end

---Creates a new keybind builder.
---
---@return vndtta.input.Keybind builder The keybind builder.
return function()
  local object = {}
  local behaviour = {}

  object.options = {}

  for key, value in pairs(Keybind) do
    if type(value) == 'function' then
      object[key] = value
    end
  end

  return setmetatable(object, behaviour)
end
