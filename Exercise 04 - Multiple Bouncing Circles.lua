-- title:  Exercise 4 - Multiple Bouncing Circles
-- author: Captain Vita
-- desc:   Many bouncing circles
-- script: lua

function init()
    r = 5 -- ball radius

    -- empty table for ball X & Y position, dX & dY speed, color
    ball = {x, y, dx, dy, c}
    
    -- Generate balls table with random properties
    for i = 1, 100 do
     ball[i] =
     {x = math.random(r, 239 - r),
      y = math.random(r, 135 - r),
      dx = (-1)^math.random(0, 1),
      dy = (-1)^math.random(0, 1),
      c = math.random(0, 15)}
    end
end -- init()

function draw_ball()
 for i = 1, #ball do
  circ(ball[i].x, ball[i].y, r, ball[i].c)
  circb(ball[i].x, ball[i].y, r, ball[i].c + 1)
 end
end -- draw_ball()

function upd_ball()
 for i=1, #ball do

  -- update balls positioon
  ball[i].x = ball[i].x + ball[i].dx
  ball[i].y = ball[i].y + ball[i].dy

  -- change color & direction when balls collide with screen limits
  if ball[i].x < r then
   ball[i].x = r
   ball[i].dx = -ball[i].dx
   ball[i].c = math.random(0, 15)
  elseif ball[i].y < r then
   ball[i].y = r
   ball[i].dy = -ball[i].dy
   ball[i].c = math.random(0, 15)
  elseif ball[i].x > 239 - r then
   ball[i].x = 239 - r
   ball[i].dx = -ball[i].dx
   ball[i].c = math.random(0, 15)
  elseif ball[i].y > 135 - r then
   ball[i].y = 135 - r
   ball[i].dy = -ball[i].dy
   ball[i].c = math.random(0, 15)
  end -- if
 end -- for
end -- upd_ball()

init()

function TIC()
 cls(10)
 draw_ball()
 upd_ball()
end
