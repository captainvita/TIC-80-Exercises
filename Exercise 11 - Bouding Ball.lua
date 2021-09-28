-- title:  Exercise 11 - Bouding Ball
-- author: Captain Vita
-- desc:   Simple circle collision detection exercise
-- script: lua

t = 0 -- Framerate timer

-- Player array
p = {x = 5, y = 5, dx = 2, dy = 2, r = 5, c = 9}

-- Enemy array
e = {x = 110, y = 58, dx = 2, dy = 2, r = 10, c = 5}

function hasCol(obj1, obj2) -- check object collision
 local minDistSq =(obj1.r + obj2.r) * (obj1.r + obj2.r)
 local xSep = obj1.x - obj2.x
 local ySep = obj1.y - obj2.y
 local sepSq =(xSep * xSep)+(ySep * ySep)
 
 if sepSq <= minDistSq then return true
 else return false end
end -- function hasCol()


function TIC()
    -- check player input & update position
	if btn(0) then p.y = p.y - p.dy end
	if btn(1) then p.y = p.y + p.dy end
	if btn(2) then p.x = p.x - p.dx end
	if btn(3) then p.x = p.x + p.dx end
 
	cls(0)
	
	print('Move blue circle with arrow keys', 0, 130)
	
 if hasCol(p, e) then
  print('~~COLLISION~~', 75, 20, 2)
  p.c = 2
  e.c = 2
  t = t + 1
  
  if t % 30 == 0 then -- move enemy if collided > 0.5 sec
   e.x = math.random(20, 220)
   e.y = math.random(20, 118)
   t = 0
  end -- if
 else
  p.c = 9
  e.c = 5
 end -- if
 
 -- draw balls on screen
 circb(p.x, p.y, p.r, p.c)
 circb(e.x, e.y, e.r, e.c)
end