-- title:  Exercise 18 - Waves on mouseclick
-- author: Captain Vita
-- desc:   Waves with circ() function on mouse position
-- script: lua

waves = {}
t = 0

function addWaves() -- appand waves to waves table
 table.insert(waves, {x = mx, y = my, r = 0})
end -- addWaves()

function updWaves() -- update waves radius & check if reach end of screen
 for i = 1, #waves do
  if waves[i] ~= nil then
	  waves[i].r = waves[i].r + 1
	  if waves[i].r > 275 then
	   table.remove(waves, i)
	  end -- if
		end -- if
 end -- for
end -- updWaves()

function drawWaves() -- draw waves to screen
 for i = 1, #waves do
  circb(waves[i].x, waves[i].y, waves[i].r, 9)
 end -- for
end -- drawWaves()

function TIC()
 cls(10)
 mx, my, ml = mouse()
 
 -- check mouse click every 3 frames
 if ml and t % 3 == 0 then addWaves() end
 
 updWaves()
 drawWaves()
 
 print(#waves)
 t = t + 1
end
