local event = require("hs.eventtap").event
local mod = {}

local pressSystemKey = function(key)
    return function()
        event.newSystemKeyEvent(key, true):post()
        event.newSystemKeyEvent(key, false):post()
    end
end

function mod.bindKeys(modal)
    modal:bind({}, ';', pressSystemKey("SOUND_DOWN"))
    modal:bind({}, "'", pressSystemKey("SOUND_UP"))
    modal:bind({}, '[', pressSystemKey("PREVIOUS"))
    modal:bind({}, ']', pressSystemKey("NEXT"))
    modal:bind({}, 'p', pressSystemKey("PLAY"))
    modal:bind({}, 'm', pressSystemKey("MUTE"))
end

return mod

