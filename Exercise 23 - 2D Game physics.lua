-- title:  Exercise 23 - 2D Game physics
-- author: Captain Vita
-- desc:   Simple physics engine with gravity & friction
-- script: lua

function init()
 cls()
	t = 0 -- framerate timer
	x, y = 120, 64 -- X&Y coordinates
	vx, vy = 0, 0 -- X & Y velocity
	vMax = 4 -- maximum velocity
	f = 0.98 -- friction
	g = 0.04 -- gravity
end -- init()

function draw()
 cls()
 rectb(0, 0, 240, 136, 4)
 circ(x, y, 5, 2)
 print((math.floor(vx * 100) / 100) .. (math.floor(vy * 10) / 10), 2, 2, 11)
end -- draw()

function update()
 -- check input and limit max velocity
 if btn(2) and math.abs(vx) <= vMax then vx = vx - 0.1 end
 if btn(3) and math.abs(vx) <= vMax then vx = vx + 0.1 end
 if btn(0) and math.abs(vy) <= vMax then vy = vy - 0.1 end
 if btn(1) and math.abs(vy) <= vMax then vy = vy + 0.1 end

 -- add gravity & friction to velocity
 vx = vx * f
 vy = (vy + g) * f

 -- debounce ball at ground position
 if y >= 129 and math.abs(vy) < 0.3 then
  g = 0
  y = 130
 elseif y < 129 then
 	g = 0.04
 end -- if

 -- check for screen collision
 if x < 6 or x > 234 then vx = -vx end
 if y < 6 or y > 130 then vy = -vy end

 -- add velocity to X&Y position
 x = x + vx
 y = y + vy
 
 -- update framerate timer
 t = t + 1
end

init()

function TIC()
 draw()
 update() 
end