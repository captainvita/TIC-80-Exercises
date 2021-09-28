-- title:  Exercise 17 - Pixel art painter
-- author: Captain Vita
-- desc:   Simple pixel painter with array
-- script: lua

function init()
	DP_W = 240
	DP_H = 136
	pix = 8
	debounce = false -- Mouseclick debouncer
	a={} -- Displaygrid table
	
	-- init displaygrid
	for i = 1, (DP_W / pix) do
	 a[i] = {}
	 for j = 1, (DP_H / pix) do
	  a[i][j] = 0
	 end -- for
	end -- for
end -- init()

init()

function TIC()
 cls(12)
 mx, my, ml = mouse() -- get mouse input
 
 -- draw grid on screen
 for i = 1, #a do
  for j = 1, #a[i] do
   if a[i][j] == 0 then
	   rect(pix * (i - 1), pix * (j - 1), pix, pix, 12)
	   rectb(pix * (i - 1), pix * (j - 1), pix, pix, 13)
   else
	   rect(pix * (i - 1), pix * (j - 1), pix, pix, 9)
	   rectb(pix * (i - 1), pix * (j - 1), pix, pix, 8)
   end -- if
  end -- for
 end -- for
 
 -- draw mouse position
 rectb(pix * (mx // pix), pix * (my // pix), pix, pix, 2)
 
 -- draw pixel when mouseclick left
 if ml and debounce then
  if 	a[(mx + pix) // pix][(my + pix) // pix] == 0 then
   a[(mx + pix) // pix][(my + pix) // pix] = 1
  else
   a[(mx + pix) // pix][(my + pix) // pix] = 0
  end -- if
  
  debounce  = false
 elseif not ml and not debounce then
  debounce = true 
 end -- if
end
