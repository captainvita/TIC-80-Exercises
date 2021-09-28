-- title:  Exercise 15 - TIC-80 clip function
-- author: Captain Vita
-- desc:   Simple clip() with bouncing ball exercise
-- script: lua

ball = {x = 50, y = 25, dx = -1, dy = 1, sp = 1, r = 5} -- ball object

function drawBall(ballColor) -- draw ball on screen
  circ(ball.x, ball.y, ball.r, ballColor)
  circb(ball.x, ball.y, ball.r, ballColor + 1)
end --drawBall

function updBall() -- update ball position & check edge collision
 if ball.x <= ball.r or ball.x >= 240 - ball.r then
  ball.dx = -ball.dx
 end -- if
 
 if ball.y <= ball.r or ball.y >= 136 - ball.r then
  ball.dy = -ball.dy
 end -- if
 
 ball.x = ball.x + ball.dx * ball.sp
 ball.y = ball.y + ball.dy * ball.sp
end -- updBall

function TIC()
 cls()
 updBall()

 clip(0, 0, 120, 68) -- clip top left
 rect(0, 0, 240, 136, 2)
 drawBall(3)
 
 clip(120, 0, 120, 68) -- clip top right
 rect(0, 0, 240, 136, 5)
 drawBall(6)
 
 clip(0, 68, 120, 68) -- clip bottom left
 rect(0, 0, 240, 136, 8)
 drawBall(9)
 
 clip(120, 68, 120, 68) -- clip bottom right
 rect(0, 0, 240, 136, 11)
 drawBall(12)
end
