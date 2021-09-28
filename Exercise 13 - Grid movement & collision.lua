-- title:  Exercise 13 - Grid movement & collision
-- author: Captain Vita
-- desc:   Simple movement & collision exercise
-- script: lua

t = 0 -- framerate timer

-- player table
spr1 = {sprNo = 1, x = 120, y = 56, dx = 8, dy = 8, w = 8, h = 8}

-- enemy table
spr2 = {sprNo = 17, x = 120, y = 88, dx = 8, dy = 8, w = 8, h = 8}


function drawBoard() -- draw playboard
 for r = 0, 16 do
  for c = 0, 29 do
   if (r + c) % 2 == 0 then
    rect((c * 8), (r * 8), 8, 8, 13)
   else
    rect((c * 8), (r * 8), 8, 8, 14)
   end -- if
  end -- for
 end -- for
end -- drawBoard

function sprCollision(obj1, obj2)
 local Xs = (obj1.w * 0.5) + (obj2.w * 0.5)
 local Ys = (obj1.h * 0.5) + (obj2.h * 0.5)
 local Xd = math.abs((obj1.x + (obj1.w * 0.5)) - (obj2.x + (obj2.w * 0.5)))
 local Yd = math.abs((obj1.y + (obj1.h * 0.5)) - (obj2.y + (obj2.h * 0.5)))
 
 if Xd < Xs and Yd < Ys then return true end
 
 return false
end -- sprCollision()

function plMove() -- Check input, update player & enemy posotion
 if btnp(0) then
  spr1.y = spr1.y - spr1.dy
  spr2.y = spr2.y + (spr2.dy * math.random(-1, 1))
 end -- if
 
 if btnp(1) then
  spr1.y = spr1.y + spr1.dy
  spr2.y = spr2.y + (spr2.dy * math.random(-1, 1))
 end -- if
 
 if btnp(2) then
  spr1.x = spr1.x - spr1.dx
  spr2.y = spr2.x + (spr2.dx * math.random(-1, 1))
 end -- if 
 
 if btnp(3) then
  spr1.x = spr1.x + spr1.dx
  spr2.y = spr2.x + (spr2.dx * math.random(-1, 1))
 end -- if
end -- plMove()

function TIC()
 cls()
 drawBoard()
 plMove()
 
 spr(spr1.sprNo, spr1.x, spr1.y, 0)
 spr(spr2.sprNo, spr2.x, spr2.y, 0)
 
 if sprCollision(spr1, spr2) then
  print('Collision', 0, 0, 2)
  spr(spr2.sprNo + 1, spr2.x, spr2.y, 0)
  spr(spr1.sprNo + 1, spr1.x, spr1.y, 0)
 end -- if
 
	t = t + 1
end