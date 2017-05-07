local mod = {}

local commandMode = hs.hotkey.modal.new()

function pressKey(modifiers, character)
    local event = require("hs.eventtap").event
    event.newKeyEvent(modifiers, string.lower(character), true):post()
    event.newKeyEvent(modifiers, string.lower(character), false):post()
end

-- VI bindings
function volumeDown() 
    hs.eventtap.event.newSystemKeyEvent("SOUND_DOWN", true):post()
    hs.timer.usleep(200000)
    hs.eventtap.event.newSystemKeyEvent("SOUND_DOWN", false):post()
end
commandMode:bind({}, ';', volumeDown, nil, volumeDown)

function volumeUp() 
    hs.eventtap.event.newSystemKeyEvent("SOUND_UP", true):post()
    hs.timer.usleep(200000)
    hs.eventtap.event.newSystemKeyEvent("SOUND_UP", false):post()
end
commandMode:bind({}, "'", volumeUp, nil, volumeUp)

function previous() 
    hs.eventtap.event.newSystemKeyEvent("PREVIOUS", true):post()
end
commandMode:bind({}, '[', previous, nil, previous)

function next() 
    hs.eventtap.event.newSystemKeyEvent("NEXT", true):post()
end
commandMode:bind({}, ']', next, nil, next)

function play() 
    hs.eventtap.event.newSystemKeyEvent("PLAY", true):post()
end
commandMode:bind({}, 'p', play, nil, play)

function right() pressKey({}, "Right") end
commandMode:bind({}, 'l', right, nil, right)

function left() pressKey({}, "Left") end
commandMode:bind({}, 'h', left, nil, left)

function up() pressKey({}, "Up") end
commandMode:bind({}, 'k', up, nil, up)

function down() pressKey({}, "Down") end
commandMode:bind({}, 'j', down, nil, down)

function endWord() pressKey({"alt"}, "Right") end
commandMode:bind({}, 'e', endWord, nil, endWord)

function beginWord() pressKey({"alt"}, "Left") end
commandMode:bind({}, 'b', beginWord, nil, beginWord)

commandMode:bind({"shift"}, '4', function()
    hs.eventtap.keyStroke({"cmd"}, "Right")
end)

commandMode:bind({}, '0', function()
    hs.eventtap.keyStroke({"cmd"}, "Left")
end)

-- Toggle command mode
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

function mod:start()
    leaveCommandMode:start()
    enterCommandMode:start()
end

return mod

