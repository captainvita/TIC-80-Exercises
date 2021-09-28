-- title:  Exercise 6 - Bouncing fireball
-- author: Captain Vita
-- desc:   Bouncing ball with fire tail
-- script: lua

function init()
    t = 0 -- time variable
    DP_W = 239 -- display resolution
    DP_H = 135
    r = 5 -- Ball radious, color, X&Y position and speed
    c = 2
    x = math.random(r, DP_W - r)
    y = math.random(r, DP_H - r)
    dx = (-1)^math.random(1, 2)
    dy = (-1)^math.random(1, 2)
    
    n = 10 -- No of fire particles and particles array
    f = {}

    for i = 1, n do
     f[i] =
     {x = x + math.random(-r, r),
      y = y + math.random(-r, r),
      r = math.random(1, 4)
     }
    end
end -- init()

function draw()
    circ(x, y, r, c)
end -- draw()

function upd()
 x = x + dx
 y = y + dy

 if x < r or x >= DP_W - r then
  dx = dx * (-1)
 end

 if y < r or y >= DP_H - r then
  dy = dy * (-1)
 end
end -- upd()

function draw_fire()
 for i = 1, n do
  circ(f[i].x, f[i].y, f[i].r * 2, 2 + f[i].r / 2)
  circb(f[i].x, f[i].y, f[i].r * 2, 1 + f[i].r / 2)
 end
end -- draw_fire()

function upd_fire()
 for i = 1, n do
  f[i].r = f[i].r - 0.1
  if f[i].r < 0 then
    f[i]=
    {x = x + math.random(-r, r),
    y = y + math.random(-r, r),
    r = math.random(2, 5)
    }
  end
 end
end -- upd_fire()

init()

function TIC()
 cls()
 draw_fire()
 upd_fire()
 draw()
 upd()
 t = t + 1
end
