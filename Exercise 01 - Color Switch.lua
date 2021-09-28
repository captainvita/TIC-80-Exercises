-- title:  Exercise 1 - Color switch
-- author: Captain Vita
-- desc:   Basic Color switching
-- script: lua

color = 1
time_var = 0
time_count = 0

function TIC()
	cls(color)
	
	time_var = time_var + 1	
	
	-- change screen color every 60 frames  or when button pressed
	if time_var % 60 == 0 then
		color = color + 1
		time_count = time_count + 1
	elseif color == 15 then
	 color = 0
	elseif btnp(0) then
	 color = color - 1
	elseif btnp(1) then
	 color = color + 1
	elseif btnp(2) then
	 color = color - 8
	elseif btnp(3) then
	 color = color + 8
	elseif color <= 0 then
	 color = 0
	end
	
	-- print variables to screen
	print('Color: ', 0, 0)
	print(color, 33, 0)
	print('Timer: ', 0, 8)
	print(time_var, 33, 8)
	print('Time Counter: ', 0, 16)
	print(time_count, 72, 16)
end