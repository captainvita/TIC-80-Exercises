-- title:  Exercise 5 - Rotating Solar System
-- author: Captain Vita
-- desc:   Simple solar system animation
-- script: lua

function init()
    pi = math.pi
    sin = math.sin
    cos = math.cos
    DISP_W = 240 -- display width
    DISP_H = 136 -- display hieght
    d1 = 50 -- planet distance
    d2 = 13 -- planet distance
    t = 0 -- framerate timer
    n = 25 -- number of asteroids
    a = {} -- asteroids table

    -- initialize ateroids table
    for i = 1, n do
        a[i] = -- asteroid distance, angle, speed, radius & color
        {d = math.random(18, 30),
        a= 2 * pi * math.random(0, 99) / 100,
        sp = math.random(1, 3),
        r = math.random(1, 2),
        c = math.random(1, 2)
        }
    end
end -- init()

function upd_ast() -- update asteroids
    for i = 1, n do
        a[i].a = a[i].a + a[i].sp / 60
    end
end -- upd_ast()

function draw_ast() -- draw asteroids
    for i = 1, n do
        circ((DISP_W / 2) + a[i].d * cos(a[i].a),
        (DISP_H / 2) + a[i].d * sin(a[i].a), a[i].r, a[i].c)
    end
end -- draw_ast()

init()

function TIC()
    cls(8)
    draw_ast()
    upd_ast()

    -- update and draw planets to screen
    x1 = (DISP_W / 2) + d1 * cos(t) -- planet rotation with sinus & cosinus function
    y1 = (DISP_H / 2) + d1 * sin(t)
    x2 = x1 + d2 * cos(t * 5)
    y2 = y1 + d2 * sin(t * 5)
    
    circ(DISP_W / 2, DISP_H / 2, 12, 2)
    circb(DISP_W / 2, DISP_H / 2, 12, 3)
    circ(x1, y1, 6, 5)
    circb(x1, y1, 6, 9)
    circ(x2, y2, 2, 13)
    
    t = t + 1 / 60
end