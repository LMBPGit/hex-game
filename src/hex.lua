HexSize = 50

function DrawHex(hex, hexSize, fillMode)
  local x, y = HexToPixel(hex)
  local vertices = {}
  table.insert(vertices, x + hexSize)
  table.insert(vertices, y)
  for i = 1, 5 do
    table.insert(vertices, x + hexSize * math.cos(i * math.pi / 3))
    table.insert(vertices, y + hexSize * math.sin(i * math.pi / 3))
  end
  love.graphics.polygon(fillMode, vertices)
end

function DrawGridHex(hex)
  if IsPlayerPos(Player, hex) then
    DrawPlayerHex(hex)
  else
    DrawHex(hex, HexSize, 'line')
  end
end

function DrawPlayerHex(hex)
  DrawHex(hex, HexSize, 'line')
  DrawHex(hex, HexSize - 15, 'fill')
end

function HexToPixel(hex)
  local x = HexSize * (3 / 2 * hex.q) + love.graphics.getWidth() / 2
  local y = HexSize * (math.sqrt(3) / 2 * hex.q + math.sqrt(3) * hex.r) + love.graphics.getHeight() / 2
  return x, y
end

-- Moved to init.lua
-- function CreateHexMapTable(mapRadius)
--   local mapTable = {  }
--   local index = 0
--   for q = -mapRadius, mapRadius do
--     local r1 = math.max(-mapRadius, -q - mapRadius);
--     local r2 = math.min(mapRadius, -q + mapRadius);
--     for r = r1, r2 do
--       mapTable[index] = { q = q, r = r }
--       index = index + 1
--     end
--   end
--   return mapTable
-- end

function CreateHexGrid(mapTable)
  for key,value in pairs(mapTable) do
    local hex = { q = value.q, r = value.r }
    DrawGridHex(hex)
  end
end
