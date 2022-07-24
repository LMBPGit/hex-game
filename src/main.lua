require('player')
require('hex')
require('init')
require('controls')
require('util')

function love.load()
  Init()
end

function love.update(dt)

end

function love.draw()
  ShowFPS()
  CreateHexGrid(MapTable)
end
