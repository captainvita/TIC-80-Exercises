-- title:  Exercise 24 - Snake Clone
-- author: Captain Vita
-- desc:   Simple snake clone
-- script: lua

function init()
 cls()
 t = 0
 delay = 15
 score = 0
 snake = {
  {x = 15, y = 8}, -- tail
  {x = 14, y = 8}, -- neck
  {x = 13, y = 8} -- head
 }
 food = {x = 20, y = 12}
 dirs = {
  [0] = {x = 0, y = -1}, -- up
  [1] = {x = 0, y = 1}, -- down
  [2] = {x = -1, y = 0}, -- left
  [3] = {x = 1, y = 0} -- right
 }
 dir = dirs[2]
end -- init()

function draw() -- draw snake & food
 cls(15)
 circ(food.x * 8 + 3, food.y * 8 + 3, 3, 2)
 for i, v in pairs(snake) do
  rect(v.x * 8, v.y * 8, 8, 8, 6)
 end -- for
end -- draw()

function update() -- get input & update snake position
 t = t + 1
 if t > 60 then t = 0 end
 head = snake[#snake]
 neck = snake[#snake - 1]
 tail = snake[1]
 local lastDir = dir
 
 if btn(0) then dir = dirs[0]
  elseif btn(1) then dir = dirs[1]
  elseif btn(2) then dir = dirs[2]
  elseif btn(3) then dir = dirs[3]
 end -- of
 
 if head.x + dir.x == neck.x and head.y + dir.y == neck.y then
  dir = lastDir
 end -- if
end -- update()

function gotFood() -- check if snake head got food
 if head.x == food.x and head.y == food.y then
  return true
 end -- if
end -- gotFood()

function spawnFood() -- randomly spawn food
 food.x = math.random(29)
 food.y = math.random(16)
 for i, v in pairs(snake) do
  if v.x == food.x and v.y == food.y then
   spawnFood()
  end -- if
 end -- for
end -- spawnFood()

function logic()
 if t % delay == 0 then
  for i, v in pairs(snake) do
  
  	-- end game when snake head touches body
   if i ~= #snake and v.x == head.x and v.y == head.y then
    trace("GAME OVER - SCORE: " .. score)
    exit()
   end -- if
  end -- for
  
  table.insert(snake,
  #snake + 1, {x = (head.x + dir.x) % 30, y = (head.y + dir.y) % 17})
  
  if not gotFood() then
   table.remove(snake, 1)
  else
   spawnFood()
   score = score + 1
  end -- if
  
  -- increase gamespeed with higher score
  if score >= 5 then delay = 12
  elseif score >= 10 then delay = 10
  elseif score > 25 then delay = 8
  elseif score > 50 then delay = 5
  else delay = 15 end
 end -- if
end -- logci()

init()

function TIC()
 update()
 logic()
 draw()
end