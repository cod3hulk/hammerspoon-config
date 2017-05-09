local event = require("hs.eventtap").event
local mod = {}

function pressSystemKey(key)
    event.newSystemKeyEvent(key, true):post()
    event.newSystemKeyEvent(key, false):post()
end

-- MEDIA KEYS
function volumeDown() 
    pressSystemKey("SOUND_DOWN")
end

function volumeUp() 
    pressSystemKey("SOUND_UP")
end

function previousTitle() 
    pressSystemKey("PREVIOUS")
end

function nextTitle() 
    pressSystemKey("NEXT")
end

function play() 
    pressSystemKey("PLAY")
end

function mute() 
    pressSystemKey("MUTE")
end

function mod.bindKeys(modal)
    modal:bind({}, ';', volumeDown)
    modal:bind({}, "'", volumeUp)
    modal:bind({}, '[', previousTitle)
    modal:bind({}, ']', nextTitle)
    modal:bind({}, 'p', play)
    modal:bind({}, 'm', mute)
end

return mod

