-- title:  Exercise 20 - Easing object movement
-- author: Captain Vita
-- desc:   Easing movement for objects
-- script: lua

function init()
	ball = {
	 x = 20,
	 y = 50,
	 r = 2,
	 c = 2
	}
	
	t = 0
	b = ball.x
	c = 200
	d = 60
end -- init()

-- easing mode funtions selector variables
easing_mode = {[1] = 'Linear', [2] = 'Cubic In', [3] = 'Cubic In & Out'} 
easing_selector = 1

function linear(t, b, c, d) -- linear easing
 return c * t / d + b
end -- linear()

function cubicIn(t, b, c, d) -- cubic in easing
 t = t / d
 return c * t * t * t + b
end -- cubicIn()

function cubicInOut(t, b, c, d) -- cubic in & out easing 
 t = t / d / 2
 if t < 1 then return c / 2 * t * t * t + b end
 t = t - 2
 return c / 2 * (t * t * t + 2) + b
end -- cubicInOut()

function draw()
 circ(ball.x, ball.y, ball.r, ball.c)
end -- draw()

function update()
	if easing_mode[easing_selector] == 'Linear' then
 	ball.x = linear(t, b, c, d)
	elseif easing_mode[easing_selector] == 'Cubic In' then
 	ball.x = cubicIn(t, b, c, d)
	elseif easing_mode[easing_selector] == 'Cubic In & Out' then
 	ball.x = cubicInOut(t, b, c, d)
 end -- if
 
 if ball.x >= 220 then ball.x = 220 end
end -- update()

function easing_picker()
 if btnp(2)  then easing_selector  = easing_selector - 1 end
 if btnp(3) then easing_selector  = easing_selector + 1 end
	
	if easing_selector > 3 then easing_selector = 1 end
	if easing_selector < 1 then easing_selector = 3 end
 
 print('Left & right arrow: Select Easying Mode\nX Key: Restart', 0, 0)
 print('Mode: ' .. easing_mode[easing_selector], 0, 14)
end -- easing_picker()

init()

function TIC()
 cls()
 easing_picker()
	draw()
	update()
	
	-- reset ball when x key is pressed
	if btnp(5) and ball.x == 220 then init() end
	
	t = t + 2
end