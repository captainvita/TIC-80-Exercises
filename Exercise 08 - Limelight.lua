-- title:  Exercise 8 - Limelight 
-- author: Captain Vita
-- desc:   Limelight controlled by mouse input
-- script: lua

function init()
	t = 0 -- framerate timer
	n = 20 -- number of particles
	mouseX, mouseY = mouse()
	sqrt = math.sqrt --squre root function
	sin = math.sin -- sinus function
	
	f = {} -- fire particle table

	for i = 1, n do
	 f[i] = {
	  x = mouseX + math.random(-4, 4),
	  y = mouseY + math.random(-4, 4),
	  dy = -math.random(1, 3) / 3,
	  r = math.random(1, 2)
	 }
	end
end -- init()

function updFire()
 for i = 1, n do
  f[i].y = f[i].y + f[i].dy
  f[i].r = f[i].r - 1 / 10
  if f[i].r < 0 then
	  f[i] = {
	 	 x = mouseX + math.random(-4, 4),
	 	 y = mouseY + math.random(-4, 4),
	 	 dy = -math.random(1, 3) / 3,
	 	 r = math.random(1, 2)
		 }
		end -- if
 end -- fire
end -- updFire()

function drawFire()
 for i = 1, n do
  circ(f[i].x, f[i].y, f[i].r * 2.5, 0)
  circb(f[i].x, f[i].y, f[i].r * 2.5, 1)
 end -- for
end -- drawFire()

init()

function TIC()
 cls(2)
 mouseX, mouseY = mouse() -- get mouse position
 
 updFire()
 drawFire()
 
 -- draw rechtlanges along x and y 
 for xLine = 0, 10 do
  for yLine = 0, 10 do
   -- shift every other line  by 12 pixels -(yLine%2)*12
   rectb(24 * xLine - (yLine % 2) * 12, 16 * yLine, 25, 17, 13)
  end -- for
 end -- for
 
 -- draw pixels alone the mouse position
 -- use square root to create roudings
 -- use sine function to create pumping with speed depending on t variable
 for i = mouseX - 40 - 5 * sin(t), mouseX + 40 + 5 * sin(t) do
  for j = mouseY - 40 - 5 * sin(t), mouseY + 40 + 5 * sin(t) do
   if sqrt((mouseX - i)^2 + (mouseY - j)^2) <= 40 + 5 * sin(t) then
    pix(i, j, 2 + pix(i, j))
   end -- if
  end -- for
 end -- for
 
 for i = mouseX - 25 + 5 * sin(t), mouseX + 25 - 5 * sin(t) do
  for j = mouseY - 25 + 5 * sin(t), mouseY + 25 - 5 * sin(t) do
   if sqrt((mouseX - i)^2 + (mouseY - j)^2) <= 25 - 5 * sin(t) then
    pix(i, j, 1 + pix(i, j))
   end -- if
  end -- for
 end -- for
 
 if t <= 60 then t = t + 1 / 20 else t = 0 end 
end
