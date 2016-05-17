local widget = require( "widget" )
function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        if event.target.id == 1 then
            composer.gotoScene("game","fade", 500)
        end
    end
end

buttons = {}

local button1 = widget.newButton(
    {
        id = "1",
        width = 90,
        height = 90,
        defaultFile = "_imagem/numfase.png",
        overFile = "_imagem/numfase.png",
        label = "1",
        fontSize = 30,
        onEvent = handleButtonEvent
    }
)
local button2 = widget.newButton(
    {
        id = "2",
        width = 90,
        height = 90,
        defaultFile = "_imagem/numfase.png",
        overFile = "_imagem/numfase.png",
        label = "2",
        fontSize = 30,
        onEvent = handleButtonEvent
    }
)
local button3 = widget.newButton(
    {   
        id = "3",
        width = 90,
        height = 90,
        defaultFile = "_imagem/numfase.png",
        overFile = "_imagem/numfase.png",
        label = "3",
        fontSize = 30,
        onEvent = handleButtonEvent
    }
)
local button4 = widget.newButton(
    {   
        id = "4",
        width = 90,
        height = 90,
        defaultFile = "_imagem/numfase.png",
        overFile = "_imagem/numfase.png",
        label = "4",
        fontSize = 30,
        onEvent = handleButtonEvent
    }
)
local button5 = widget.newButton(
    {
        id = "5",
        width = 90,
        height = 90,
        defaultFile = "_imagem/numfase.png",
        overFile = "_imagem/numfase.png",
        label = "5",
        fontSize = 30,
        onEvent = handleButtonEvent
    }
)
local button6 = widget.newButton(
    {
        id = "6",
        width = 90,
        height = 90,
        defaultFile = "_imagem/numfase.png",
        overFile = "_imagem/numfase.png",
        label = "6",
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

return buttons