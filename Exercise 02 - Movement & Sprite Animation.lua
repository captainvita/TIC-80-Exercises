-- title:  Exercise 2 - Movement & Sprite Animation
-- author: Captain Vita
-- desc:   Movement & basic sprite animation
-- script: lua

t = 0 -- frame timer

-- balls spride ID, X&Y coord, speed, velocity
ball = {c = 0, x = 0, y = 0, s = 1 , v = 0}

-- check button input and update ball position & animation
function moveBall()
 spr(ball.c,ball.x, ball.y)
 if t % 10 == 0 then ball.c = ball.c + 1 end
 if ball.c > 5 then ball.c = 0 end
 
 if btn(3) then ball.v = ball.s
 elseif btn(2) then ball.v = -1 * ball.s
 else ball.v = 0 end
 
 ball.x = ball.x + ball.v
end -- moveBall()

-- check if object reach edges of screen
function screenLimit()
 if ball.x <= -2 then  ball.x = -2 end
 if ball.x >= 234 then  ball.x = 234 end
 if ball.y <= -2 then  ball.y = -2 end
 if ball.y >= 128 then  ball.y = 128 end
end -- screenLimit()

function TIC()
 cls()
 moveBall()
 screenLimit()
 t = t + 1
end
