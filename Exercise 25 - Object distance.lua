-- title:  Exercise 25 - Object distance
-- author: Captain Vita
-- desc:   Measuring object distances with pythagoras
-- script: lua

-- object constructor --
object = {}
object.__index = object

function object:new(x, y)
 local self = {}
 setmetatable(self, object)
 self.x = x
 self.y = y
 return self
end -- object:new()

function distance(obj1, obj2) -- calculate distance between 2 objects
 local distance = 0
 local xD = obj2.x - obj1.x
 local yD = obj2.y - obj1.y

 distance = math.sqrt((xD * xD) + (yD * yD))
 return distance
end -- distance()

-- create objects from constructor
a = object:new(20, 40)
b = object:new(120, 80)
c = object:new(180, 110)

function TIC()
	cls()

	-- check input and update object position
	if btn(0) then a.y = a.y - 1 end
	if btn(1) then a.y = a.y + 1 end
	if btn(2) then a.x = a.x - 1 end
	if btn(3) then a.x = a.x + 1 end

	-- draw objects
	circ(a.x, a.y, 2, 2)
	circ(b.x, b.y, 2, 4)
	circ(c.x, c.y, 2, 6)
	
	-- print object distances
	print('A', a.x - 8, a.y + 3, 2)
	print('B', b.x - 8, b.y + 3, 4)
	print('C', c.x - 8, c.y + 3, 6)
 print('Distance between points')
	print('A-B: ' .. math.floor(distance(a, b))..
							'\nA-C: ' .. math.floor(distance(a, c)), a.x + 4, a.y - 13)
end