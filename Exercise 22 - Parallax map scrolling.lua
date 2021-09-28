-- title:  Exercise 22 - Parallax map scrolling
-- author: Captain Vita
-- desc:   Drawing maps with parallax scrolling
-- script: lua

function init() -- initialize variables
 t = 0
 mapX = 0
 mapSpd = 1
 nearBGX = 0
 nearBGSpd = 0.5
 farBGX = 0
 farBGSpd = 0.25
 cls()
end -- init()

function draw() -- draw map & background on screen
 cls(11)
 
 -- draw near background
 map(30, 0, 30, 17, nearBGX, 0, 0)
 map(30, 0, 30, 17, nearBGX + 240, 0, 0)
 
 -- draw far background
 map(60, 0, 30, 17, farBGX, 0, 0)
 map(60, 0, 30, 17, farBGX + 240, 0, 0)

 -- draw platform background
 map(0, 0, 30, 17, mapX, 0, 0)
 map(0, 0, 30, 17, mapX + 240, 0, 0)
 
 -- draw spirites
 spr((t % 60 // 30) + 16, 6 * 8 + (t / 3), (13 * 8) + 6, 0)
 spr(32, 6 * 8 + (t / 3), 14 * 8, 0)
 spr((t % 60 // 30) + 18, 4 * 8 + (t / 3), (13 * 8) + 6, 0)
 spr(32, 4 * 8 + (t / 3), 14 * 8, 0)
end -- draw()

function update() -- Update map & background positions 
 farBGX = farBGX - farBGSpd
 
 if farBGX <= -240 then farBGX = 0 end
 
 nearBGX = nearBGX - nearBGSpd
 
 if nearBGX <= -240 then nearBGX = 0 end
 
 mapX = mapX - mapSpd
 
 if mapX <= -240 then mapX = 0 end
end -- update()

init()

function TIC()
 draw()
 update()
	t = t + 1
end