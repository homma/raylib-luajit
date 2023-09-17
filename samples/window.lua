local raylib = require 'raylib'
local rl = raylib.raylib
local rlcolor = raylib.rlcolor

-- window
local win = {}
win.w = 600
win.h = 400
win.title = 'My Raylib Window'

local draw = function()
  rl.BeginDrawing()
  rl.ClearBackground(rlcolor.RAYWHITE)

  local x = 110
  local y = 170
  local h = 30
  local c = rlcolor.BLACK
  local t = 'This is a raylib window'
  rl.DrawText(t, x, y, h, c)

  rl.EndDrawing()
end

local main = function()
  rl.InitWindow(win.w, win.h, win.title)

  while not rl.WindowShouldClose() do
    draw()
  end

  rl.CloseWindow()
end

main()
