function love.load()
 function set_battlefield()
	love.graphics.setColor (220,220,220)
	backgr = love.graphics.newImage("img/background.png")

	for bf_x=0,(love.graphics.getWidth() / 20) do
		for bf_y=0,(love.graphics.getHeight() / 20) do
			love.graphics.draw(backgr, bf_x * 20, bf_y * 20)
		end
	end

	start_bf_x = 50
	start_bf_y = 90
	tile_size = 48
	x_tiles = 7
	y_tiles = 16

	love.graphics.setLineWidth (3)
	love.graphics.setColor (30,30,30)

 	love.graphics.line(start_bf_x,start_bf_y, start_bf_x,start_bf_y + tile_size * x_tiles, start_bf_x + tile_size * y_tiles,start_bf_y + tile_size * x_tiles, start_bf_x + tile_size * y_tiles,start_bf_y, start_bf_x,start_bf_y)
	for i=1,(x_tiles - 1) do
		love.graphics.line(start_bf_x, start_bf_y + tile_size * i, start_bf_x + tile_size * y_tiles, start_bf_y + tile_size * i)
	end
	for j=1,(y_tiles - 1) do
		love.graphics.line(start_bf_x + tile_size * j, start_bf_y, start_bf_x + tile_size * j, start_bf_y + tile_size * x_tiles)
	end
 end

 player = {}

 player.red = {}
 -- current x on battlefield
 player.red.field_x = 0 
 -- current y on battlefield
 player.red.field_y = 3 
 -- current mines count
 player.red.mines = 4 
 -- image of player
 player.red.pic = love.graphics.newImage("img/player_red.png")
 -- turn to this player
 player.red.isTurn = false
 
 -- all comments for player.red are true for player.blue
 player.blue = {}
 player.blue.field_x = 11
 player.blue.field_y = 3 
 player.blue.mines = 4 
 player.blue.pic = love.graphics.newImage("img/player_blue.png")
 player.blue.isTurn = false

end

function love.draw()
 set_battlefield()
end
