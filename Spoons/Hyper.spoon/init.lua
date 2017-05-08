local mod = {}

-- Toggle command mode
commandMode = hs.hotkey.modal.new()

local leaveCommandMode = hs.eventtap.new({ hs.eventtap.event.types.keyUp }, function(e)
    local keyCode = e:getKeyCode()
    if keyCode == 79 then
        print("Leave command mode...")
        commandMode:exit()
    end
    return false
end)

local enterCommandMode = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(e)
    local keyCode = e:getKeyCode()
    if keyCode == 79 then
        print("Enter command mode...")
        commandMode:enter()
    end
    return false
end)

function mod:commandMode()
    return commandMode
end

function mod:start()
    leaveCommandMode:start()
    enterCommandMode:start()
end

return mod
