local raylib = require 'raylib'
local rl = raylib.raylib
local rlcolor = raylib.rlcolor
local ray3d = require 'ray3d'

-- window
local win = {}
win.w = 600
win.h = 400
win.title = "Cube"

local draw = function(schene)
  rl.BeginDrawing()
  rl.ClearBackground(rlcolor.RAYWHITE)

  local cube = schene.object[1]
  local camera = schene.camera

  rl.BeginMode3D(camera)
  cube:draw()
  rl.EndMode3D()

  rl.EndDrawing()
end

local main = function()
  rl.InitWindow(win.w, win.h, win.title)

  -- cube
  local c = {}
  c.w = 1.0
  c.h = 1.0
  c.len = 1.0
  c.position = {0.0, 0.0, 0.0}
  c.color = rlcolor.BLUE

  local cube = ray3d.Cube.new(c.w, c.h, c.len)
  cube:setPosition(c.position.x, c.position.y, c.position.z)
  cube:setColor(c.color)

  -- camera
  local cam = {}
  cam.x = 3.0
  cam.y = 3.0
  cam.z = 3.0

  local camera = ray3d.Camera.new(cam.x, cam.y, cam.z)
  camera:setTarget(0.0, 0.0, 0.0)
  camera:setUp(0.0, 1.0, 0.0)
  camera:setFovy(30.0)
  camera:setProjection(rl.CAMERA_PERSPECTIVE)

  local schene = ray3d.Schene.new()
  schene:addObject(cube)
  schene:setCamera(camera)

  while not rl.WindowShouldClose() do
    draw(schene)
  end

  rl.CloseWindow()
end

main()

