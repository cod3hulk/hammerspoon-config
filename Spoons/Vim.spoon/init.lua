local mod = {}
local event = require("hs.eventtap").event

-- Toggle command mode
local commandMode = hs.hotkey.modal.new()

leaveCommandMode = hs.eventtap.new({ hs.eventtap.event.types.keyUp }, function(e)
    local keyCode = e:getKeyCode()
    if keyCode == 79 then
        print("Leave command mode...")
        commandMode:exit()
    end
    return false
end)

enterCommandMode = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(e)
    local keyCode = e:getKeyCode()
    if keyCode == 79 then
        print("Enter command mode...")
        commandMode:enter()
    end
    return false
end)

-- key functions
function pressSystemKey(key)
    hs.eventtap.event.newSystemKeyEvent(key, true):post()
    hs.timer.usleep(50000)
    hs.eventtap.event.newSystemKeyEvent(key, false):post()
end

function pressKey(modifiers, character)
    event.newKeyEvent(modifiers, string.lower(character), true):post()
    hs.timer.usleep(50000)
    event.newKeyEvent(modifiers, string.lower(character), false):post()
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

function bindMediaKeys(modal)
    modal:bind({}, ';', volumeDown)
    modal:bind({}, "'", volumeUp)
    modal:bind({}, '[', previous)
    modal:bind({}, ']', next)
    modal:bind({}, 'p', play)
    modal:bind({}, 'm', mute)
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

function bindViKeys(modal)
    modal:bind({}, 'h', left)
    modal:bind({}, 'l', right)
    modal:bind({}, 'k', up)
    modal:bind({}, 'j', down)
    modal:bind({}, 'e', endWord)
    modal:bind({}, 'b', beginWord)
    modal:bind({"shift"}, '4', moveToEOL)
    modal:bind({}, '0', moveToSOL)
end

function mod:start()
    bindMediaKeys(commandMode)
    bindViKeys(commandMode)
    leaveCommandMode:start()
    enterCommandMode:start()
end

return mod

