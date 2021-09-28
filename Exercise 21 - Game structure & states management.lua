-- title:  Exercise 21 - Game structure & states management
-- author: Captain Vita
-- desc:   Game structure & states with functions
-- script: lua

function init()
 x = 96
 y = 24
 r = 5
 c = 4
 game = {}
 showMenu()
end -- init()

function upd()
 game.upd()
end -- upd()

function drw()
 game.drw()
end -- drw()

function showMenu()
 game.upd = updateMenu
 game.drw = drawMenu
end -- showMenu()

function updateMenu()
 if btn(4) then showGame() end
end -- updateMenu()

function drawMenu()
 cls(0)
 print('Press Z to start game', 0, 0, 12)
end -- drawMenu()

function showGame()
 game.upd = updateGame
 game.drw = drawGame
end -- showGame()

function updateGame()
 updatePlayer()
	if x <= r or y <= r or x >= 240 - r or y >= 136 - r then
	 showGameOver()
	end -- if
end -- updateGame()

function drawGame()
 cls(2)
 circ(x, y, r, c)
end -- drawGame()

function showGameOver()
 game.upd = updateGameOver
 game.drw = drawGameOver
end -- showGameOver()

function updateGameOver()
 if btn(4) then 
  x = 96
  y = 24
  showGame()
 end -- if
end -- updateGameOver()

function drawGameOver()
 cls(4)
 print('GAME OVER', 90, 64, 2)
 print('Press Z to restart game', 0, 120)
end -- drawGameOver()

function updatePlayer()
	if btn(0) then y = y - 1 end
	if btn(1) then y = y + 1 end
	if btn(2) then x = x - 1 end
	if btn(3) then x = x + 1 end
end -- updatePlayer()

init()

function TIC()
 upd()
 drw()
end