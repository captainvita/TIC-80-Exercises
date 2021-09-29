-- title:  Exercise 27 - 2D Vectors & rotation
-- author: Captain Vita
-- desc:   Vectors for 2d games
-- script: lua

function init() -- initialize vector properties
 x = 120 -- objects X position
 y = 64  -- objects Y position
 a = 0 -- objects orienttation/angle
 aD = 0.1 -- angle rotation interval
 x1 = 0
 y1 = 0
 dotX = 0 -- objects tip X position
 dotY = 0 -- objects tip Y position
 follower = 0 -- followers initial angle
 d = 0 -- followers rotation direction
 xf = 0 -- followers X position
 yf = 0 -- followers Y position
 speed = 0.1 -- follower rotation speed
end -- init()

-- draw objects and text to screen
function draw()
    cls()
    print('Angle: ' .. angle(x1, y1), 0, 0)
    line(x, y, dotX, dotY, 13)
    circb(x, y, 2, 2)
    pix(dotX, dotY, 4)
    pix(x + xf, y + yf, 5)
end -- draw()

function update()
    -- rotate object with left & right arrow
    if btn(2) then a = angleAdd(a, -aD) end
    if btn(3) then a = angleAdd(a, aD) end
 
 -- move object forwards & backwards with up & down arrow
 if btn(0) then
  x = x + x1 / 25
  y = y + y1 / 25
 end -- if
 
 if btn(1) then
  x = x - x1 / 50
  y = y - y1 / 50
 end -- if
 
    x1, y1 = rotate(0, -20, a)
    dotX = x + x1
    dotY = y + y1
    d = angleDir(follower, a)
    follower = angleAdd(follower, d * 0.05)
    xf, yf = vector(10, follower)
end -- update()

-- rotate object
function rotate(x, y, a)
 return x * math.cos(a) - y * math.sin(a), x * math.sin(a) + y * math.cos(a)
end -- rotate()

function angle(x, y)
 return math.pi - math.atan2(x, y)
end -- angle()

-- ensure that the angle is between 0 and 2xpi
function angleAdd(a, d)
 a = a + d
 if a < 0 then
  a = a + (math.pi * 2)
 elseif a >= math.pi * 2 then
  a = a - (math.pi * 2)
 end -- if
 
 return a
end -- angleAdd()

-- rotate vector on the given angle
function vector(l, a)
 return rotate(0, -l, a)
end -- vector()

-- calculate the angle between two points
function angle2(fromX, fromY, toX, toY)
 return angle(toX - fromX, toY - fromY)
end -- angle2()

-- determin which direction the follower should go to reach the object faster
function angleDir(from, to)
 local diff = to - from
 
 if math.abs(diff) < 0.00001 then return 0 end
 if diff > math.pi then
  return -1
 elseif diff < -math.pi then
  return 1
 else
  return diff > 0 and 1 or -1
 end -- if
end -- angleDir()

init()

function TIC()
 draw()
 update()
end