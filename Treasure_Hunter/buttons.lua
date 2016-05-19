local W, H, halfW = display.contentWidth, display.contentHeight, display.contentWidth*0.5


buttons = {}
    buttons[1] = display.newImage("_imagem/left.png",387,260) --left
	buttons[1].myName = "left"

	buttons[2] = display.newImage("_imagem/rigth.png",453,260) --rigth
	buttons[2].myName = "rigth"

	buttons[3] = display.newImage("_imagem/up.png",420,225) --Up
	buttons[3].myName = "up"

    buttons[4] = display.newImage("_imagem/down.png",420,295) --Down
    buttons[4].myName = "down"

    buttons[5] = display.newImage("_imagem/espaco.png",420,260) --center
    buttons[5].myName = "espaco"

    local yAxis = 0
	local xAxis = 0
touchFunction = function(e)
eventName = e.phase
direction = e.target.myName
	if eventName == "began" or eventName == "moved" then
        if direction == "rigth" then
            player:setSequence("moveRigth")
            emitter.x = 30
            xAxis = 5
            yAxis = 0   
        elseif direction == "left" then
            player:setSequence("moveLeft")
            emitter.x = -30
            xAxis = -5
            yAxis = 0
        elseif direction == "up" then
            player:setSequence("moveUp")
            emitter.x = 30
            xAxis = 0
            yAxis = -5
        elseif direction == "down" then
            player:setSequence("moveDown")
            emitter.x = -30
            xAxis = 0
            yAxis = 5
        end
     else
        if e.target.myName == "rigth" then
            player:setSequence("idleRigth")
        elseif e.target.myName == "left" then
            player:setSequence("idleLeft")
        elseif e.target.myName == "up" then
            player:setSequence("idleUp")
        elseif e.target.myName == "down" then
            player:setSequence("idleDown")
        end
        yAxis = 0
        xAxis = 0
    end
end
	local j = 1
for j=1 , #buttons do
    buttons[j].anchorX = 0
    buttons[j].anchorY = 0
    buttons[j].alpha = 1
    buttons[j]:scale(.2,.2)
    buttons[j]:addEventListener("touch",touchFunction)
end

update = function()
    playerGroup.x = playerGroup.x + xAxis
    playerGroup.y = playerGroup.y + yAxis
    
    if playerGroup.x <= playerGroup.width * .5 then
        playerGroup.x = playerGroup.width * .5
    elseif playerGroup.x >=(W + 5000)- playerGroup.width * .5 then
        playerGroup.x = W - playerGroup.width * .5
    end
    
    if playerGroup.y <= playerGroup.height * .5 then
        playerGroup.y = playerGroup.height * .5
    elseif playerGroup.y >= (H + 5000) - playerGroup.height * .5 then
        playerGroup.y = H - playerGroup.height * .5
	end
	map.setViewpoint(playerGroup.x,playerGroup.y)
    player:play()
    map.updateView()
    radar(playerGroup,chegada)
end
Runtime:addEventListener("enterFrame",update)

return buttons