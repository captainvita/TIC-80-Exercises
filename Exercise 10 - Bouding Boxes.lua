-- title:  Exercise 10 - Bouding Boxes
-- author: Captain Vita
-- desc:   Simple bouding box collision exercise
-- script: lua

function init()
	box = {}
	boxP = {x = 0, y = 0, w = 8, h = 8, c = 6}
	boxE={x = 104, y = 52, w = 16, h = 16, c = 9}
	t = 0
end -- init()

function updPl() -- check input and update player position
 if btn(0) then boxP.y = boxP.y - 1 end
	if btn(1) then boxP.y = boxP.y + 1 end
	if btn(2) then boxP.x = boxP.x - 1 end
	if btn(3) then boxP.x = boxP.x + 1 end
end -- updPl()

function hasCollision(obj1,obj2) -- check object collision
 local obj1TopLeft={x = obj1.x, y = obj1.y}
 local obj1BottomRight=
  {x = obj1.x + obj1.w - 1, y = obj1.y + obj1.h - 1}
 
 local obj2TopLeft = {x = obj2.x, y = obj2.y}
 local obj2BottomRight=
  {x = obj2.x + obj2.w - 1, y = obj2.y + obj2.h - 1}
  
  if obj2BottomRight.x >= obj1TopLeft.x
   and obj2BottomRight.y >= obj1TopLeft.y
   and obj2TopLeft.x <= obj1BottomRight.x
   and obj2TopLeft.y <= obj1BottomRight.y
   then return true
			else return false
  end -- if
end -- has Collision()

init()

function TIC()
	updPl()
	cls(0)
	
	print('Move green cube with arrow keys', 0, 130)
	
	-- when objects collide then change their colors
 if hasCollision(boxP, boxE) then
  print("~~COLLISION~~", 80, 10, 2)
  boxP.c = 2
  boxE.c = 2
  boxP.y = boxP.y + 1
	 boxP.y = boxP.y - 1
	 boxP.x = boxP.x + 1
	 boxP.x = boxP.x - 1 
 else
  boxP.c = 6
  boxE.c = 9
 end
 
	rectb(boxP.x, boxP.y, boxP.w, boxP.h, boxP.c)
	rectb(boxE.x, boxE.y, boxE.w, boxE.h, boxE.c)
end
