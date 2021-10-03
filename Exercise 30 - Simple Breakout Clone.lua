-- title:  Exercise 30 - Simple Breakout Clone
-- author: Captain Vita
-- desc:   Basic breakout clone
-- script: lua

function init()
	t = 0 -- framerate timer
	screenWidth = 240
	screenHeight = 136
	bgColor = 0 -- background color
	lives = 3 -- player lives
	score = 0 -- player score
	
	-- player object
	player = {
		width = 24,
		height = 4,
		color = 3,
		x = (screenWidth / 2) - 24,
		y = 120,
		speed = {
			x = 0,
			max = 4
		}
	}
	
	-- ball object
	ball = {
		width = 3,
		height = 3,
		color = 4,
		inactive = true, -- flag for ball movement
		x = player.x +(player.width / 2) - 1.5,
		y = player.y - 4,
		speed = {
			x = 0,
			y = 0,
			max = 1.5
		}
	}
	
	-- brick objects
	bricks = {}
	brickColumns = 12
	brickRows = 19
	
	-- initialize bricks
	for i = 1, brickColumns do
		for j = 1, brickRows do
			local brick = {
				x = 6 + j * 11,
				y = 10 + i * 5,
				width = 10,
				height = 4,
				color = i + 1
			}
			table.insert(bricks, brick)
		end -- for
	end -- for
end -- init()

function input()
 -- move player to the left
	if btn(2) then
		if player.speed.x > -player.speed.max then
			player.speed.x = -player.speed.max
		end -- if
		
		player.speed.x = -player.speed.max
	end -- if
	
	-- move player to the right
	if btn(3) then
		if player.speed.x < player.speed.max then
			player.speed.x = player.speed.max
		end -- if
		
		player.speed.x = player.speed.max
	end -- if
	
	-- shoot ball
	if ball.inactive then
		ball.x = player.x +(player.width / 2) - 1.5
		ball.y = player.y - 4
		
		if btnp(5) then
			ball.speed.x = math.floor(math.random(0, 1)) * 2 - 1
			ball.speed.y = -1.5
			ball.inactive = false
		end -- if
	end -- if
end -- input()

function update()
	-- update player position
	player.x = player.x + player.speed.x
	
	-- update ball position
	ball.x = ball.x + ball.speed.x
	ball.y = ball.y + ball.speed.y
	
 -- reduce player speed
	if player.speed.x > 0 then
		player.speed.x = player.speed.x - 1
	elseif player.speed.x <0 then
		player.speed.x = player.speed.x + 1
	end -- if
	
	-- limit max ball speed
	if ball.speed.x > ball.speed.max then
		ball.speed.x = ball.speed.max
	end -- if
	
	collisions() -- check for object collision
	t = t + 1
end -- update()

function collisions()
	playerWallCollision()
	ballWallCollision()
	ballGroundCollision()
	playerBallCollision()
	ballBrickCollision()
end -- collisions()

function playerWallCollision()
	if player.x < 0 then
		player.x = 0
	elseif	player.x > screenWidth - player.width then
		player.x = screenWidth - player.width
	end -- if
end -- playerWallCollision()

function playerBallCollision()
	if collided(player, ball) then
		ball.speed.x = ball.speed.x + 0.3 * ball.speed.x
		ball.speed.y = -ball.speed.y
		sfx(0, 'C-4', 5, 0) -- play sound at collision
	end -- if
end -- playerBallCollision()

function ballWallCollision()
	if ball.x < 0 or ball.x > screenWidth - ball.width then
		ball.speed.x = -ball.speed.x
		sfx(0, 'C-3', 5, 0) -- play sound at collision
	elseif ball.y < 0 then
		ball.speed.y = -ball.speed.y
		sfx(0, 'C-3', 5, 0) -- play sound at collision
	end -- if
end -- ballWallCollision()

function ballGroundCollision()
 if ball.y > screenHeight - ball.height then
		ball.inactive = true
		if lives > 0 then
		 lives = lives - 1
			sfx(2, 'C-2', 15, 0) -- play sound at collision
		elseif lives == 0 then
			sfx(2, 'C-2', 15, 0) -- play sound at collision
		end -- if
	end -- if
end -- ballGroundCollision()

function 	ballBrickCollision()
	for i, brick in pairs(bricks) do
	
		-- remove brick & change ball direction when ball collides with brick
		if collided(ball, bricks[i]) then
			sfx(0, 'F-3', 2, 0) -- play sound at collision
			
			-- change x direction if left or right collision
			if bricks[i].y < ball.y
			and ball.y < bricks[i].y + bricks[i].height
			and ball.x < bricks[i].x
			or bricks[i].x + bricks[i].width < ball.x then
				ball.speed.x = -ball.speed.x
			end -- if
			
			-- change y direction if top or bottom collision
			if ball.y < bricks[i].y
			or ball.y > bricks[i].y
			and bricks[i].x < ball.x
			and ball.x < bricks[i].x + bricks[i].width then
		  ball.speed.y = -ball.speed.y
			end -- if
			
			table.remove(bricks, i)
			score = score + 1
			
			if score == 100 then
				lives = lives + 1
				sfx(1, 'C-8', 10, 0) -- play sound at level up
			end
		end -- if
	end -- for
end -- ballBrickCollision()

-- collision box returning true when 2 objects collide
function collided(obj1, obj2)
	if obj1.x < obj2.x + obj2.width
	and obj1.x + obj1.width > obj2.x
	and obj1.y < obj2.y + obj2.height
	and obj1.y + obj1.height > obj2.y then
		return true
	end -- if
	
	return false
end -- collided()

function gameOver()
 cls()
 
 for i = 1, 5 do
		print('GAME OVER', (screenWidth / 2) - 27 + i, (screenHeight / 2) + i, 2 * i)
	end -- for
	
	print('Press X to restart', (screenWidth / 2) - 50, (screenHeight / 2) + 12, 4)
	
	if btnp(5) then
		init()
	end -- if
end -- gameOver()

function draw()
	cls(bgColor)
	drawGameObjects()
	drawGUI()
end -- draw()

function drawGameObjects()
	rect(player.x, player.y, player.width, player.height, player.color)
	rect(ball.x, ball.y, ball.width, ball.height, ball.color)
	
	for i, brick in pairs(bricks) do
		rect(bricks[i].x, bricks[i].y, bricks[i].width, bricks[i].height, bricks[i].color)
	end -- for
end -- drawGameObjects()

function drawGUI()
	rectb(0, 0, screenWidth, screenHeight, 1)
	
	if ball.inactive and lives == 3 then
 		print('Press X to start', (screenWidth / 2) - 50, (screenHeight / 2) + 12, 4)
	end -- if
	
	print('SCORE: '..score, 5, 128)
	print('LIVES: '..lives, 192, 128)
end -- drawGUI()

init()

function TIC()
	input()
	
	if lives > 0  then
		update()
		draw()
	elseif lives == 0 then
		gameOver()
	end -- if
end -- TIC()