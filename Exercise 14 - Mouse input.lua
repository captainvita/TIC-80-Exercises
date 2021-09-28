-- title:  Exercise 14 - Mouse input
-- author: Captain Vita
-- desc:   Basic Mouse imput
-- script: lua

sprNo = 1 -- sprite number
rotate = 0 -- sprite rotation
mkCheck = false -- Mouse debouncer check

function TIC()
	cls()
	mx, my, mk = mouse() -- get mouse input states x,y, left button

	if mk and not mkCheck then -- check if mouse has been clicked since last loop
	 	rotate = rotate + 1
		
		if rotate > 3 then rotate = 0 end
			sprNo = 3
			mkCheck = true
	elseif not mk and mkCheck then
		mkCheck = false sprNo = 1 -- reset check
	end -- if
	
	spr(sprNo, mx - 30, my - 30, 14, 2, 0, rotate, 2, 2)
end