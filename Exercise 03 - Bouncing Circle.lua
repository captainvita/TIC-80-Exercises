-- title:  Exercise 3 - Bouncing Circle
-- author: Captain Vita
-- desc:   Bouncing circle
-- script: lua

t = 0 -- frame timer
r, c = 10, 10 -- circle radius & color
dx, dy = 1, 1 -- circ X & Y velocity

-- generate random circ X & Y position
x, y = math.random(r, 239-r), math.random(r, 136-r)

cls(12)

function upd_ball() -- update circ position
 x = x + dx
 y = y + dy
 
 -- check if circ reaches screen limit, change direction & color on collision
 if x > 240 - r then
  x = 240 - r
  dx = -dx
  c = math.random(1, 15)
 elseif y > 136 - r then
  y = 136 - r
  dy = -dy
  c = math.random(1, 15)
 elseif x < r then
  x = r
  dx = -dx
  c = math.random(1, 15)
 elseif y < r then
  y = r
  dy = -dy
  c = math.random(1, 15)
 end -- if
end -- upd_ball()

function TIC()
 t = t + 1
 circ(x, y, r, c)
 circb(x, y, r + 1, c + 2)
 upd_ball()
end