
local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
--local buttons = require( "buttons_level" )

-- forward declarations and other locals
local W, H, halfW = display.contentWidth, display.contentHeight, display.contentWidth*0.5
local centerX = display.contentCenterX
local centerY = display.contentCenterY

function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view
	

	local background = display.newImageRect("_imagem/backlevel.png",480,320)
	background.anchorX = 0
	background.anchorY = 0
	local displayText = display.newText( "Level select", centerX, 20, "_imagem/Achafexp.ttf", 44 )
	displayText:setFillColor( black )
	local widget = require( "widget" )
function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        if event.target.id == "1" then
            composer.gotoScene("game","fade", 500)
        elseif event.target.id == "voltar" then
        	composer.gotoScene( "menu", "fade",700 )    
        end
    end
end


local button1 = widget.newButton(
    {
        id = "1",
        width = 90,
        height = 90,
        defaultFile = "_imagem/espaco.png",
        overFile = "_imagem/espaco.png",
        label = "1",
        font = "_imagem/Achafexp.ttf",
        fontSize = 30,
        onEvent = handleButtonEvent
    }
)
local button2 = widget.newButton(
    {
        id = "2",
        width = 90,
        height = 90,
        defaultFile = "_imagem/espaco.png",
        overFile = "_imagem/espaco.png",
        label = "2",
        font = "_imagem/Achafexp.ttf",
        fontSize = 30,
        onEvent = handleButtonEvent
    }
)
local button3 = widget.newButton(
    {   
        id = "3",
        width = 90,
        height = 90,
        defaultFile = "_imagem/espaco.png",
        overFile = "_imagem/espaco.png",
        label = "3",
        font = "_imagem/Achafexp.ttf",
        fontSize = 30,
        onEvent = handleButtonEvent
    }
)
local button4 = widget.newButton(
    {   
        id = "4",
        width = 90,
        height = 90,
        defaultFile = "_imagem/espaco.png",
        overFile = "_imagem/espaco.png",
        label = "4",
        font = "_imagem/Achafexp.ttf",
        fontSize = 30,
        onEvent = handleButtonEvent
    }
)
local button5 = widget.newButton(
    {
        id = "5",
        width = 90,
        height = 90,
        defaultFile = "_imagem/espaco.png",
        overFile = "_imagem/espaco.png",
        label = "5",
        font = "_imagem/Achafexp.ttf",
        fontSize = 30,
        onEvent = handleButtonEvent
    }
)
local button6 = widget.newButton(
    {
        id = "6",
        width = 90,
        height = 90,
        defaultFile = "_imagem/espaco.png",
        overFile = "_imagem/espaco.png",
        label = "6",
        font = "_imagem/Achafexp.ttf",
        fontSize = 30,
        onEvent = handleButtonEvent
    }
)
local button7 = widget.newButton(
    {
        id = "voltar",
        width = 40,
        height = 40,
        defaultFile = "_imagem/voltar.png",
        overFile = "_imagem/voltar.png",
        fontSize = 30,
        onEvent = handleButtonEvent
    }
)
button1.x = 110
button1.y = 100

button2.x = 230
button2.y = 100

button3.x = 350
button3.y = 100

button4.x = 110
button4.y = 220

button5.x = 230
button5.y = 220

button6.x = 350
button6.y = 220

button7.x = W - 30
button7.y = H - 30



	sceneGroup:insert( background )
	sceneGroup:insert( button1 )
	sceneGroup:insert( button2 )
	sceneGroup:insert( button3 )
	sceneGroup:insert( button4 )
	sceneGroup:insert( button5 )
	sceneGroup:insert( button6 )
	sceneGroup:insert( button7 )	
	sceneGroup:insert(displayText)

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
		
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
		
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
	
end

function scene:destroy( event )

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	local sceneGroup = self.view
	local j = 1
	for j=1,#buttons do
		self.remove(buttons[j])
		buttons[j] = nil
	end

	
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene