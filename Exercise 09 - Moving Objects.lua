-- title:  Exercise 9 - Moving Objects
-- author: Captain Vita
-- desc:   Moving objects exercise with 2D arrays
-- script: lua

t = 0 -- framerate timer
rows, columns = 6, 12 -- object rows & columns
sOffsetX, sOffsetY = 12, 12 -- object spacing
sSpeed, sDX, sDY = 2, 1, 4 -- object speed and velocity

function initSprites(r, c) -- initialising sprite objects
    sprite = {}
    spriteBase = {}
    spriteBase[1] = {No = 1}
    spriteBase[2] = {No = 1}
    spriteBase[3] = {No = 17}
    spriteBase[4] = {No = 17}
    spriteBase[5] = {No = 33}
    spriteBase[6] = {No = 33}

 for i = 1, r do -- create obecjts with rows x columns
  sprite[i] = {}
  for j = 1, c do
   sprite[i][j] = {
    x = (j - 1) * sOffsetX, -- columns
    y = (i - 1) * sOffsetY, -- rows
    baseSprite = spriteBase[i].No
   }
  end -- for
 end -- for
end -- initSprites()

function drawSprites() -- draw animated sprites with offset
 for i = 1, #sprite do
  for j = 1, #sprite[i] do
   spr(sprite[i][j].baseSprite + t % 60 / 20, sprite[i][j].x, sprite[i][j].y, 0)
  end -- for
 end -- for
end -- drawSprites()

function updSprites()
 if t % 30 == 0 then -- update every 0.5 second
     if spriteAtEdge(0, 240) then
      for i = 1, #sprite do
          for j = 1, #sprite[i] do
           sprite[i][j].y = sprite[i][j].y + (sDY * sSpeed)
          end -- for
      end -- for
      sDX = -sDX
     else
         for i = 1, #sprite do
          for j = 1, #sprite[i] do
           sprite[i][j].x = sprite[i][j].x + (sDX * sSpeed)
          end -- for
         end -- for
        end -- if
    end -- if
end -- updSprites()

function spriteAtEdge(xMin, xMax) -- check if sprite reach the end of the screen
 for i = 1, #sprite do
  for j = 1, #sprite[i] do
   if sDX == 1 then
    if sprite[i][j].x > xMax - 10 then return true end
   elseif sDX == -1 then
    if sprite[i][j].x < xMin + 2 then return true end
   end -- if
  end -- for
 end -- for
 
 return false
end -- spriteAtEdge()

initSprites(rows, columns)

function TIC()
    cls(8)
    drawSprites()
    updSprites()
  
    if t > 60 then t = 0 else t = t + 1 end
end