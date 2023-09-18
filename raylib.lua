local ffi = require 'ffi'

local basename = function(path)
  local p = {}
  for w in string.gmatch(path, '[^/]+') do
    table.insert(p, w)
  end
  table.remove(p)
  local base = table.concat(p, '/')
  return base
end

local script_dir = basename(debug.getinfo(1).short_src) .. '/'

local M = {}

local init_ffi = function()
  -- initialize ffi
  local f = io.open(script_dir .. 'ext/raylib.cdef', 'r')
  local cdefs = f:read 'a'
  ffi.cdef(cdefs)

  M.raylib = ffi.load 'raylib'
  M.rlcolor = require 'ext.rlcolor'
end

local init_module = function()
  init_ffi()
end

init_module()

return M
