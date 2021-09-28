-- title:  Exercise 7 - Cube Pattern
-- author: Captain Vita
-- desc:   Create funky cube pattern on screen
-- script: lua

t = 0 -- framerate timer
cls(0)

function TIC()
 t = t + 1
 
 -- color, X&Y coords, lenght & height of cubes
	c = math.random(0, 15)
	x = 8 * math.random(1, 29)
	y = 8 * math.random(1, 16)
	l = 8 * math.random(1, 2)
	h = 8 * math.random(1, 3)
	
	-- draw cube pattern on screen
	for i = 0, 29 do
	 for j = 0, 16 do
		 if t % 240 == 0 then
	   rect(i * 8, j * 8, 8, 8, ((i + j) % 16))
		  rectb(i * 8, j * 8, 8, 8, 1 + ((i + j) % 16))
			end -- if
			
			t = t + 1
		end -- for
		
		t = t + 1
	end -- for
end