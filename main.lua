function love.load()
 -- start horiz coord of battlefield
 start_bf_x = 50
 -- start vert coord of battlefield
 start_bf_y = 90
 -- size of tile's lenght in pixels
 tile_size = 48
 -- number of horiz tiles
 x_tiles = 16
 -- number of vert tiles
 y_tiles = 7

 player = {
 	    -- current x on battlefield
	    field_x = 0,
 	    -- current y on battlefield
	    field_y = 3;
 	    -- current mines count
	    mines = 4;
 	    -- turn to this player
	    isTurn = false;
 	    -- image of player
	    pic = nil;
 	    }

 function player:new (color)
 	color = color or {}
	setmetatable (color, self)
	self.__index = self
	return color
 end
 
 player_red = player:new()
 player_blue = player:new()

 player_red.pic = love.graphics.newImage("img/player_red.png")
 player_blue.pic = love.graphics.newImage("img/player_blue.png")
 
 -- blue player starts on right side of battlefield
 player_blue.field_x = (x_tiles - 1)

 function set_battlefield()
	love.graphics.setColor (220,220,220)
	backgr = love.graphics.newImage("img/background.png")

	for bf_x=0,(love.graphics.getWidth() / 20) do
		for bf_y=0,(love.graphics.getHeight() / 20) do
			love.graphics.draw(backgr, bf_x * 20, bf_y * 20)
		end
	end

	ui_exit = love.graphics.newImage("img/ui_exit.png")
	love.graphics.draw(ui_exit, 866, 708)


	love.graphics.setLineWidth (3)
	love.graphics.setColor (30,30,30)

 	love.graphics.line(start_bf_x,start_bf_y, start_bf_x,start_bf_y + tile_size * y_tiles, start_bf_x + tile_size * x_tiles,start_bf_y + tile_size * y_tiles, start_bf_x + tile_size * x_tiles,start_bf_y, start_bf_x,start_bf_y)
	for i=1,(y_tiles - 1) do
		love.graphics.line(start_bf_x, start_bf_y + tile_size * i, start_bf_x + tile_size * x_tiles, start_bf_y + tile_size * i)
	end
	for j=1,(x_tiles - 1) do
		love.graphics.line(start_bf_x + tile_size * j, start_bf_y, start_bf_x + tile_size * j, start_bf_y + tile_size * y_tiles)
	end
 end

 function set_players_on_bf()
	love.graphics.setColor (220,220,220)
	
	love.graphics.draw(player_red.pic, start_bf_x + player_red.field_x * tile_size + 5, start_bf_y + player_red.field_y * tile_size + 5)
	love.graphics.draw(player_blue.pic, start_bf_x + player_blue.field_x * tile_size + 5, start_bf_y + player_blue.field_y * tile_size + 5)
 end

 function set_ui()
	ui_pics = {}
	ui_pics.turn = love.graphics.newImage("img/ui_turn.png")
	ui_pics.turn_red = love.graphics.newImage("img/ui_turn_red.png")
	ui_pics.turn_blue = love.graphics.newImage("img/ui_turn_blue.png")
	ui_pics.turn_curr = ui_pics.turn_blue
	ui_pics.mines = love.graphics.newImage("img/ui_mines.png")
	ui_pics.mine_4 = love.graphics.newImage("img/ui_mine_4.png")
	ui_pics.mine_3 = love.graphics.newImage("img/ui_mine_3.png")
	ui_pics.mine_2 = love.graphics.newImage("img/ui_mine_2.png")
	ui_pics.mine_1 = love.graphics.newImage("img/ui_mine_1.png")
	ui_pics.mine_0 = love.graphics.newImage("img/ui_mine_0.png")
	ui_pics.mine_curr = ui_pics.mine_4

 	love.graphics.draw(ui_pics.turn, 45 + start_bf_x + tile_size * x_tiles, 12 + start_bf_y)
 	love.graphics.draw(ui_pics.turn_curr, 45 + start_bf_x + tile_size * x_tiles, 70 + start_bf_y)
 	love.graphics.draw(ui_pics.mines, 45 + start_bf_x + tile_size * x_tiles, 190 + start_bf_y)
 	love.graphics.draw(ui_pics.mine_curr, 45 + start_bf_x + tile_size * x_tiles, 240 + start_bf_y)
 end

end

function love.draw()
 set_battlefield()
 set_players_on_bf()
 set_ui()
end

function love.mousepressed(x, y)
 if (x > 865) and (y > 708) then
	love.event.quit()
 end
end
