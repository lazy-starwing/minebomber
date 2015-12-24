function love.load()
 battlefield = {
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
 }

 player = {}

 player.red = {}
 -- current x on battlefield
 player.red.field_x = 3
 -- current y on battlefield
 player.red.field_y = 0
 -- current mines count
 player.red.mines = 4
 -- image of player
 player.red.pic = love.graphics.newImage("images/player_red.png")

 -- all comments for player.red true for player.blue
 player.blue = {}
end

function love.update(dt)
end

function love.draw()
end
