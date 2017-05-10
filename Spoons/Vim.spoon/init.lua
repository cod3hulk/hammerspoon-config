local event = require("hs.eventtap").event
local mod = {}

local pressKey = function(modifiers, character)
    return function()
        event.newKeyEvent(modifiers, string.lower(character), true):post()
        event.newKeyEvent(modifiers, string.lower(character), false):post()
    end
end

function mod.bindKeys(modal)
    modal:bind({}, 'h', pressKey({}, "Left"))
    modal:bind({}, 'l', pressKey({}, "Right"))
    modal:bind({}, 'k', pressKey({}, "Up"))
    modal:bind({}, 'j', pressKey({}, "Down"))
    modal:bind({}, 'e', pressKey({"alt"}, "Right"))
    modal:bind({}, 'b', pressKey({"alt"}, "Left"))
end

return mod

