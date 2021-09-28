-- title:  Exercise 16 - Spirale with sine & cosine
-- author: Captain Vita
-- desc:   Spiral with sine & cosine exercise
-- script: lua

sin = math.sin
cos = math.cos
pi = math.pi
t = 0 -- framerate timer
ball = {x = 120, y = 68, r = 5, c = 10} -- ball object

function TIC()
	cls(12)
	
	for i = 1, 115, 0.2 do
	 circ(ball.x + i * sin(t + i / 5), ball.y + i * cos(t + i / 5) / 2, ball.r, ball.c + i * t % 60)
 end
 
	t = t + 1 / 600
end
