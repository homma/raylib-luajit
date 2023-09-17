local raylib = require 'raylib'
local rl = raylib.raylib
local rlcolor = raylib.rlcolor

local M = {}

-- Schene class
local Schene = {}

function Schene:addObject(obj)
  table.insert(self.object, obj)
end

function Schene:setCamera(camera)
  self.camera = camera
end

function Schene.new()
  local obj = {}
  setmetatable(obj, { __index = Schene })

  obj.object = {}

  return obj
end

M.Schene = Schene

-- Cube class
local Cube = {}

function Cube:_setSize(width, height, length)
  self.width = width
  self.height = height
  self.length = length
end

function Cube:setPosition(x, y, z)
  self.position = {}
  self.position.x = x
  self.position.y = y
  self.position.z = z
end

function Cube:setScale(scale)
  self.scale = scale
end

function Cube:setColor(color)
  self.color = color
end

function Cube:update(width, height, length)
  self.mesh = rl.GenMeshCube(width, height, length)
  self.model = rl.LoadModelFromMesh(self.mesh)

  self:_setSize(width, height, length)
end

function Cube:draw()
  rl.DrawModel(self.model, self.position, self.scale, self.color)
end

function Cube.new(width, height, length)
  local obj = {}
  setmetatable(obj, { __index = Cube })

  obj.mesh = rl.GenMeshCube(width, height, length)
  obj.model = rl.LoadModelFromMesh(obj.mesh)

  obj:_setSize(width, height, length)
  obj:setPosition(0.0, 0.0, 0.0)
  obj:setScale(1.0)
  obj:setColor(rlcolor.GRAY)

  return obj
end

M.Cube = Cube

-- Camera class
local Camera = {}

function Camera:setPosition(x, y, z)
  self.position = {}
  self.position.x = x
  self.position.y = y
  self.position.z = z
end

function Camera:setTarget(x, y, z)
  self.target = {}
  self.target.x = x
  self.target.y = y
  self.target.z = z
end

function Camera:setUp(x, y, z)
  self.up = {}
  self.up.x = x
  self.up.y = y
  self.up.z = z
end

function Camera:setFovy(fovy)
  self.fovy = fovy
end

function Camera:setProjection(projection)
  self.projection = projection
end

function Camera.new(x, y, z)
  local obj = {}
  setmetatable(obj, { __index = Camera })

  obj:setPosition(x, y, z)
  obj:setTarget(0.0, 0.0, 0.0)
  obj:setUp(0.0, 1.0, 0.0)
  obj:setFovy(30.0)
  obj:setProjection(rl.CAMERA_PERSPECTIVE)

  return obj
end

M.Camera = Camera

return M
