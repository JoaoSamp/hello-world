local mode = require "modes/mode"
local kcfg = require "config/keyconfig"
local gamestatus = require "config/gamestatus"
local dtime

function love.load()	
	gameMode = mode:new()
end

function love.keypressed (key)
	if gameMode.status ~= gamestatus.gameRun then
		if key == kcfg.kUp and gameMode.selected > 1 then
			gameMode.selected = gameMode.selected - 1
		elseif (key == kcfg.kDown) and (gameMode.selected < gameMode.maxItem[gameMode.status]) then
			gameMode.selected = gameMode.selected + 1
		elseif key == kcfg.kConfirm then
			gameMode:confirmMenu()
		end
	else 
		if key == kcfg.kEsc then
			gameMode:changeStatus(gamestatus.gameMenu)
		end
	end
end

function love.update(dt)
	if gameMode.status == gamestatus.gameRun then
		gameMode.scene:update(dt)
	end
	dtime = dt
end


function love.draw()
	gameMode:draw(dtime)
end
