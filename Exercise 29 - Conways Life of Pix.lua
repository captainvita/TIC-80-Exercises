-- title:  Exercise 29 - Conways Life of Pix
-- author: Captain Vita
-- desc:   Conways game of life
-- script: lua

function init()
 W = 240 -- screen width
 H = 136 -- screen hight
 alive = 6 -- color of living cells
 bi = 1 -- current cell grid state
 grid = {{}, {}} -- cells 2D grid table
 
 -- init 3D cell table
 for x = 1, W do
  grid[1][x]={}
  grid[2][x]={}
  for y = 1, H do
   grid[1][x][y] = 0
   grid[2][x][y] = 0
  end -- for
 end -- for
 
 -- generate random living cells
 for r = 0, 50 do
  rx = math.random(110, 130)
  ry = math.random(59, 69)
  grid[1][rx][ry] = 1
 end -- for
end -- init()

function draw(b) -- draw grid
 cls()
 
 for x = 1, W do
  for y = 1, H do
   pix(x - 1, y - 1, grid[b][x][y] * alive)
  end -- for
 end -- for
end -- drawGrid()

function update() -- update grid
 local obi = (bi % 2) + 1 -- future cell grid state
 
 for x = 1, W do
  for y = 1, H do
   local n = get(bi, x - 1, y - 1) + get(bi, x, y - 1)
           + get(bi, x + 1, y - 1) + get(bi, x - 1, y)
           + get(bi, x + 1, y) + get(bi, x - 1, y + 1)
           + get(bi, x, y + 1) + get(bi, x + 1, y + 1)
           
   if n == 3 or (n == 2 and grid[bi][x][y] == 1) then
    grid[obi][x][y] = 1
   else
    grid[obi][x][y] = 0
   end -- if
  end -- for
 end -- for
 
 -- get mouse input
 mx, my, mc = mouse()
 
 -- add living cell at mouse position
 if mc then grid[obi][mx][my] = 1 end
 
 bi = obi -- update future cell grid state to current state
end -- update()

function get(b, x, y) -- check if cells are alive
 if x < 1 or x > W or y < 1 or y > H then
  return 0
 end -- if
 
 return grid[b][x][y]
end -- get

init()

function TIC()
 draw(bi)
 update()
end