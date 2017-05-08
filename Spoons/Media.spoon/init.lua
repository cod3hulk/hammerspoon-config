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

function previous() 
    pressSystemKey("PREVIOUS")
end

function next() 
    pressSystemKey("NEXT")
end

function play() 
    pressSystemKey("PLAY")
end

function mute() 
    pressSystemKey("MUTE")
end

function mod:bindModal(modal)
    modal:bind({}, ';', volumeDown)
    modal:bind({}, "'", volumeUp)
    modal:bind({}, '[', previous)
    modal:bind({}, ']', next)
    modal:bind({}, 'p', play)
    modal:bind({}, 'm', mute)
end

return mod

