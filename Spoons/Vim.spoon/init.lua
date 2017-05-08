local event = require("hs.eventtap").event
local mod = {}

function pressKey(modifiers, character)
    event.newKeyEvent(modifiers, string.lower(character), true):post()
    event.newKeyEvent(modifiers, string.lower(character), false):post()
end

-- VI KEYS
function right() 
    pressKey({}, "Right") 
end

function left() 
    pressKey({}, "Left") 
end

function up() 
    pressKey({}, "Up") 
end

function down() 
    pressKey({}, "Down") 
end

function endWord() 
    pressKey({"alt"}, "Right") 
end

function beginWord() 
    pressKey({"alt"}, "Left") 
end

function moveToEOL()
    pressKey({"cmd"}, "Right")
end

function moveToSOL()
    pressKey({"cmd"}, "Left")
end

function mod.bindKeys(modal)
    modal:bind({}, 'h', left)
    modal:bind({}, 'l', right)
    modal:bind({}, 'k', up)
    modal:bind({}, 'j', down)
    modal:bind({}, 'e', endWord)
    modal:bind({}, 'b', beginWord)
    modal:bind({"shift"}, '4', moveToEOL)
    modal:bind({}, '0', moveToSOL)
end

return mod

