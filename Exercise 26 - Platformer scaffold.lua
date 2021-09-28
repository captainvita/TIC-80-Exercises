-- title:  Exercise 26 - Platformer scaffold
-- author: Captain Vita
-- desc:   Scaffold for platformer game
-- script: lua

function init() -- initialize objects
 -- solid sprites
 solidSpr = {[1] = true, [2] = true}
 
 -- player object: x&Y coords, X&Y velocity, sprite number
 pl={x = 120, y = 100, vx = 0, vy = 0, s = 0}
 
 -- gravity
 g = 0.2
end -- init

function isSolid(x, y) -- check map collision with solidSprites
 return solidSpr[mget(x // 8, y // 8)]
end -- isSolid()

function draw() -- draw map & sprite
 cls(15)
 map(0, 0, 30, 17, 0, 0, 0)
 spr(pl.s, pl.x, pl.y, 0)
end -- draw()

function update() -- get input, check collision & update player position
	if btn(2) then pl.vx = -1
	 elseif btn(3) then pl.vx = 1
	 else pl.vx = 0
	end -- if
	
	if isSolid(pl.x + pl.vx, pl.y + pl.vy)
 	or isSolid(pl.x + pl.vx + 7, pl.y + pl.vy)
	 or isSolid(pl.x + pl.vx, pl.y + pl.vy + 7)
	 or isSolid(pl.x + pl.vx + 7, pl.y + pl.vy + 7) then
	 pl.vx = 0
	end -- if
 
 if pl.vy == 0 and btnp(4) then pl.vy = -3 end
 
 if pl.vy < 0
  and (isSolid(pl.x + pl.vx, pl.y + pl.vy)
	 or isSolid(pl.x + pl.vx + 7, pl.y + pl.vy)) then
  pl.vy = 0
 end -- if
 
 if isSolid(pl.x, pl.y + pl.vy + 8)
	 or isSolid(pl.x + 7, pl.y + pl.vy + 8) then
  pl.vy = 0
 else
  pl.vy = pl.vy + g
 end -- if
 
	pl.x = pl.x + pl.vx
	pl.y = pl.y + pl.vy
end -- update()

init()

function TIC()
 draw()
 update()
end