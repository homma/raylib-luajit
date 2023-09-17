local ffi = require 'ffi'

local M = {}

local init_ffi = function()
  -- initialize ffi
  local f = io.open('ext/raylib.cdef', 'r')
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
