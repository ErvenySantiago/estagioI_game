-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"

--------------------------------------------



-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease(e)
	local eventName = e.phase
	local targetName = e.target.myName
	-- go to level1.lua scene
	if eventName == "began" then
		if targetName == "play" then
			composer.gotoScene( "level_game", "fade", 500 )  
		elseif	targetName == "opicoes" then
			composer.gotoScene( "opicoes", "fade", 500 )  
		end
            
    end
	
end

function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- display a background image
	-- create/position logo/title image on upper-half of the screen

local displayText = display.newText( "Relic Hunter", 300, 80, "_imagem/Achafexp.ttf", 60 )

	-- create buttons
local background = display.newImageRect("_imagem/tela_inicio.png",480,320)
background.anchorX = 0
background.anchorY = 0
--Play
local btnPlay = display.newImageRect("_imagem/play.png",50,50) 
btnPlay.x = 30
btnPlay.y = 50
btnPlay.myName = "play"
btnPlay:addEventListener("touch",onPlayBtnRelease)

local btnOpicoes = display.newImageRect("_imagem/configuracao.png",50,50) 
btnOpicoes.x = 30
btnOpicoes.y = 100
btnOpicoes.myName = "opicoes"
btnOpicoes:addEventListener("touch",onPlayBtnRelease)

local btnSound = display.newImageRect("_imagem/sound.png",50,50) 
btnSound.x = 30
btnSound.y = 150
btnSound.myName = "sound"
btnSound:addEventListener("touch",onPlayBtnRelease)

sceneGroup:insert(background)
sceneGroup:insert(btnPlay)
sceneGroup:insert(btnOpicoes)
sceneGroup:insert(btnSound	)
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
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.


end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene