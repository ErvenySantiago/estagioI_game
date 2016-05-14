-- Shade
-- Shades the background group and makes it impossible to touch.
-- Used to show the sidebar or the end level popup.

local W, H, halfW = display.contentWidth, display.contentHeight, display.contentWidth*0.5
local centerX,centerY  = display.contentCenterX,display.contentCenterY 

local _M = {}

function _M.newShade(group)
	local shade = display.newRect(group, centerX, centerY, W, H)
	shade:setFillColor(0)
	shade.alpha = 0
	transition.to(shade, {time = 200, alpha = 0.5})

	-- Prevent tapping
	function shade:tap()
		return true
	end
	shade:addEventListener('tap')

	-- Prevent touching
	function shade:touch()
		return true
	end
	shade:addEventListener('touch')

	function shade:hide()
		transition.to(self, {time = 200, alpha = 0, onComplete = function(object)
			object:removeSelf()
		end})
	end



	return shade
end

return _M
