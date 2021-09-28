-- title:  Exercise 19 - Sprite animation
-- author: Captain Vita
-- desc:   Simple button imput & spirite movement exercise
-- script: lua

-- t=time,X&Y coords, s=sprite no, left=moving left
t = 0
x = 10
y = 24
s = 1
move = false
left = 0

function draw() -- draw sprite
 cls()
 spr(s, x, y, 0,1, left)
end -- draw()

function update() -- check input & update sprite position
	if btn(2) then
	 x = x - 1
		move = true
		left = 1
	end -- if
	
	if btn(3) then
	 x = x + 1
		move = true
		left = 0
	end -- if
	
	screenEdge()
	moveSpr(move)
	move = false
end -- update()

function moveSpr(moving) -- animate sprite movement
 if t > 20 then
  if moving then s = s + 1
			if s > 2 then s = 1 end
		end -- if
		
		if not moving then s = s - 1
			if s < 0 then s = 1 end
		end -- if
		
	 t = 0
	end
	
	t = t + 1
end -- moveSpr()

function screenEdge() -- carry sprite over the edge
 if x < -5 then x = 237 end
 if x > 237 then x = -5 end
end -- screenEdge()

function TIC()
 draw()
 update()
end