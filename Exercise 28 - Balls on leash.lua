-- title:  Exercise 28 - Balls on leash
-- author: Captaib Vita
-- desc:   Balls on a leash
-- script: lua

function init() -- Init objects
	p = {}
	for i = 1, 5 do
		-- object properties: X&Y coords, velocity, selector, radius, color
	 p[i] = {
	  x = math.random(20, 220),
	  y = math.random(20, 116),
	  dx = 0,
	  dy = 0,
			select = false,
			r = 2,
	  c = 2
	 }
	end -- for
	
	selected = true
	notSelected = false
	indexSelected = 1
	p[1].select = selected
	p[1].c = 4
end -- init()

function draw() -- draw objects & text to screen
 cls()
 
 print("Press Z to change Ball", 0, 0)
 print("Press X to stop Balls", 0, 8)
 
 for i = 1, #p - 1 do
  line(p[i].x, p[i].y, p[i + 1].x, p[i + 1].y, 14)
 end -- for
 
 for i = 1, #p do
  circ(p[i].x, p[i].y, p[i].r, p[i].c)
 end -- for
end -- draw()

function update() -- get input & update objects positions
	-- select next object when Z key is pressed
 if btnp(4) then
  for i = 1, #p do
   p[i].select = notSelected
   p[i].c = 2
  end -- for
  
  if indexSelected >= #p then indexSelected = 1
  else indexSelected = indexSelected + 1 end
  
  p[indexSelected].select = selected
  p[indexSelected].c = 4
 end -- of

	-- stop all objects movement when X key is pressed
 if btnp(5) then
  for i = 1, #p do
   p[i].dx = 0
   p[i].dy = 0
  end -- for
 end -- if
 
 -- change selected objects direction with arrow keys
	if btnp(0) then
	 for i = 1, #p do
	  if p[i].select == selected then
			 p[i].dy = p[i].dy + 1
	   p[i].dx = 0
			end -- if
		end -- for
	end -- if
	
	if btnp(1) then
	 for i = 1, #p do
	  if p[i].select == selected then
			 p[i].dy = p[i].dy - 1
	   p[i].dx = 0
			end -- if
		end -- for
	end -- if
	
	if btnp(2) then
	 for i = 1, #p do
	  if p[i].select == selected then
			 p[i].dx = p[i].dx + 1
	   p[i].dy = 0
			end -- if
		end -- for
	end -- if
	
	if btnp(3) then
	 for i = 1, #p do
	  if p[i].select == selected then
			 p[i].dx = p[i].dx - 1
	   p[i].dy = 0
			end -- if
		end -- for
	end -- if

	for i = 1, #p do
	 p[i].x = p[i].x - p[i].dx
	 p[i].y = p[i].y - p[i].dy
	end -- for
	
	-- bounce back objects when collided with screen limits
	for i = 1, #p do
	 if p[i].x < p[i].r or p[i].x > 239 - p[i].r then
		 p[i].dx = -p[i].dx
		end -- if
		
	 if p[i].y < p[i].r or p[i].y > 135 - p[i].r then
		 p[i].dy = -p[i].dy
		end -- if
	end -- for
end -- update()

init()

function TIC()
 update()
 draw()
end