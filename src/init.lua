ScreenWidth = 720
ScreenHeight = 720

function Init()
  local font = love.graphics.newFont('SpaceMono-Bold.ttf', 16)
  love.graphics.setFont(font)
  love.graphics.setDefaultFilter("nearest", "nearest")
  love.graphics.setColor(240 / 255, 246 / 255, 240 / 255)
  love.graphics.setBackgroundColor(34 / 255, 35 / 255, 35 / 255)
  love.graphics.setLineWidth(5)
  love.window.setTitle("Hex")
  love.window.setMode(ScreenWidth, ScreenHeight, { fullscreen = false, resizable = false, vsync = true })

  MapTable = InitHexMap(3)
end

function InitHexMap(mapRadius)
  local table = {}
  local index = 0
  for q = -mapRadius, mapRadius do
    local r1 = math.max(-mapRadius, -q - mapRadius);
    local r2 = math.min(mapRadius, -q + mapRadius);
    for r = r1, r2 do
      table[index] = { q = q, r = r }
      index = index + 1
    end
  end
  return table
end