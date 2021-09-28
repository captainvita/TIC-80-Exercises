-- title: Exercise 12 - Ying & Yang circle animation
-- author: Captain Vita
-- desc: Circle animation using TIC-80 overlay function
-- script: lua

r1 = 20 -- radius 1
r2 = 5 -- radius 2
t = 0 -- framerate timer
sin = math.sin
cos = math.cos
pi = math.pi

function OVR() -- Overriding rotating circles
 circ(120 + r1 * cos(t), 68 + r1 * sin(t), 5, 12)
 circ(120 - r1 * cos(t), 68 - r1 * sin(t), 5, 8)
 circ(120 + 60 * cos(-t), 68 + 60 * sin(-t), 2, 12)
 circ(120 - 60 * cos(-t), 68 - 60 * sin(-t), 2, 8)
end -- OVR()

function drawCircle() -- Draw main rotating circles
 circ(120 + r1 * cos(t), 68 + r1 * sin(t), r1, 8)
 circ(120 - r1 * cos(t), 68 - r1 * sin(t), r1, 12)
 circ(120 + 60 * cos(-t), 68 + 60 * sin(-t), r2, 8)
 circ(120 - 60 * cos(-t), 68 - 60 * sin(-t), r2, 12)
end -- drawCircle()

cls()

function TIC()
 drawCircle()
 
 t = t + 1 / 30
end