local apple, snake, direction, width, height, delay

function love.load()
	width = love.graphics.getWidth() / 10
	print("Width " .. width)
	height = love.graphics.getHeight() /10
	print("Height " .. height)
	apple = { x = math.random(width);
			  y = math.random(height); }
	snake = { }
	for i = 1, 10 do
		point = { x = 10;
				  y = 10 + i; }
		table.insert(snake, point)
	end
	direction = "up"
	delay = 0
end

function love.update(dt)
	for k, v in pairs(snake) do
		if k ~= 1 and snake[1].x == v.x and
					  snake[1].y == v.y then
			print("You died :3")
			love.event.quit()
		end
	end
	if delay % 2 == 0 then
		if apple.x == snake[1].x and
		   apple.y == snake[1].y then
				apple = { x = math.random(width);
						  y = math.random(height); }
		else
			table.remove(snake, table.getn(snake))
		end

		if direction == "up" then
			table.insert(snake, 1, { x = snake[1].x;
									 y = (snake[1].y - 1) % height; })
		elseif direction == "down" then
			table.insert(snake, 1, { x = snake[1].x;
									 y = (snake[1].y + 1) % height; })
		elseif direction == "left" then
			table.insert(snake, 1, { x = (snake[1].x - 1) % width;
									 y = snake[1].y; })
		else
			table.insert(snake, 1, { x = (snake[1].x + 1) % width;
									 y = snake[1].y; })
		end
	end
	delay = delay + 1
end

function love.keypressed(key)
	if key == "up" then
		direction = "up"
	elseif key == "down" then
		direction = "down"
	elseif key == "left" then
		direction = "left"
	elseif key == "right" then
		direction = "right"
	elseif key == "escape" then
		love.event.quit()
	end
end

function love.draw()
	love.graphics.setBackgroundColor(0, 0, 0)
	love.graphics.setColor(0, 0, 255)
	for k, v in pairs(snake) do
		love.graphics.rectangle("fill", v.x * 10, v.y * 10, 10, 10)
	end
	love.graphics.setColor(255, 255, 0)
	love.graphics.rectangle("fill", apple.x * 10, apple.y * 10, 10, 10)
end