-----------------------------------------------------------------------------------------
--
-- Game.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include library
local physics = require "physics"
physics.start(); physics.pause();physics.setGravity( 0, 0 )
local particleDesigner = require( "particleDesigner" )
local physics = require("physics")
local dusk = require("Dusk.Dusk")
local button = require("buttons")
--------------------------------------------

-- forward declarations and other locals
local W, H, halfW = display.contentWidth, display.contentHeight, display.contentWidth*0.5
local centerX = display.contentCenterX
local centerY = display.contentCenterY

map = dusk.buildMap("maps/level_1.json")
map.setCameraBounds( { xMin = map.data.width - W, 
                       xMax = map.data.width, 
                       yMin = display.contentHeight * 0.5, 
                       yMax = map.data.height - display.contentHeight * 0.5 } )



local function chegadaGame( event )
	if event.phase == "began" then
		map:setMask(nil)
	    darkness= nil
	end
end
local function morrer( event )
    
end
-- Player
playerGroup = display.newGroup( )


function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view

	-- create map
	

	local sheetData = { width=45, height=63, numFrames=12 }
	local playerSheet = graphics.newImageSheet("_imagem/gaara.png",sheetData)
	local playerSequenceData ={
	{name = "moveRigth",start = 8,	count = 2,time = 300,loopCount = 0},
	{name = "moveLeft",start = 5,	count = 2,time = 300,loopCount = 0},
	{name = "moveUp",start = 11,  count = 2,time = 300,loopCount = 0},
	{name = "moveDown",start = 2,  count = 2,time = 300,loopCount = 0},
	{name = "idleRigth",start = 7,count = 1,time = 0,loopCount = 1},
	{name = "idleLeft",start = 4,count = 1,time = 0,loopCount = 1},
	{name = "idleUp",start = 10,count = 1,time = 0,loopCount = 1},
	{name = "idleDown",start = 1,count = 1,time = 0,loopCount = 1}
	}

	local bricks = {}
    local n = 0

	local function throwBrick()
	n = n + 1
	bricks[n] = display.newImage( "brick.png",map.data.width - 20 , map.data.height/2)
	bricks[n].rotation = 90
	physics.addBody( bricks[n], { density=3.0, friction=0.5, bounce=0.05 } )
	map.layer[1]:insert(bricks[n])
	-- remove the "isBullet" setting below to see the brick pass through cans without colliding!
	bricks[n].isBullet = true

	bricks[n].angularVelocity = 100
	bricks[n]:applyForce( 0, - 1200, bricks[n].x, bricks[n].y )
	end

	local function start()
	-- throw 3 bricks
		timer.performWithDelay( 360, throwBrick, 1 )
	end


	player = display.newSprite(playerSheet,playerSequenceData)
	player:setSequence("idleRigth")
	playerGroup:insert( player )
	
	local darkness = graphics.newMask( "maps/circlemask.png" )
	map:setMask(darkness )
	map.maskX = centerX
	map.maskY = centerY
	map.maskScaleX = 1
	map.maskScaleY = 1
	emitter = particleDesigner.newEmitter( "fire.json" )
	emitter.x = 30
	playerGroup:insert( emitter )
	physics.addBody( playerGroup,"dinamic",{density=3.0, friction=0.5, bounce=0.3})
	playerGroup.isFixedRotation = true
	playerGroup.x = 50
	playerGroup.y = 10
	map.layer[1]:insert(playerGroup)
	
 	local chegada = display.newImage("_imagem/chegada.png")
 	chegada.x = map.data.width - 20
 	chegada.y = map.data.height - 61
 	physics.addBody(chegada,"static",{isSensor = true})
    chegada:addEventListener("collision", chegadaGame)

 	map.layer[1]:insert(chegada)
	timer.performWithDelay( 800, start )	
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
		physics.start()
		physics.setGravity( 0, 0 )
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
		physics.stop()
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
	
	package.loaded[physics] = nil
	physics = nil
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene