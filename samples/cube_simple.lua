local raylib = require 'raylib'
local rl = raylib.raylib
local rlcolor = raylib.rlcolor
local ffi = require 'ffi'

-- window
local win = {}
win.w = 600
win.h = 400
win.title = "Cube"

-- cube
local c = {}
c.w = 1.0
c.h = 1.0
c.len = 1.0
c.position = {0.0, 0.0, 0.0}
c.color = rlcolor.BLUE
c.scale = 1.0

local create_cube_model = function()
  local mesh = rl.GenMeshCube(c.w, c.h, c.len)
  local model = rl.LoadModelFromMesh(mesh)

  return model
end

-- camera
local camera = {}
camera.position = {3.0, 3.0, 3.0}
camera.target = {0.0, 0.0, 0.0}
camera.up = {0.0, 1.0, 0.0}
camera.fovy = 30.0
camera.projection = rl.CAMERA_PERSPECTIVE

local draw = function(model)
  rl.BeginDrawing()
  rl.ClearBackground(rlcolor.RAYWHITE)

  rl.BeginMode3D(camera)
  rl.DrawModel(model, c.position, c.scale, c.color)
  rl.EndMode3D()

  rl.EndDrawing()
end

local main = function()
  rl.InitWindow(win.w, win.h, win.title)

  local model = create_cube_model()

  while not rl.WindowShouldClose() do
    draw(model)
  end

  rl.CloseWindow()
end

main()

