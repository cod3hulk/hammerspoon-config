local mod = {}

hs.grid.setGrid('4x4')

local gridset = function(x, y, w, h)
    return function()
        local window = hs.window.focusedWindow()
        hs.grid.set(
            window,
            {x=x, y=y, w=w, h=h},
            window:screen()
        )
    end
end


local hyper = {"ctrl", "cmd"}

function mod.bindKeys()
    hs.hotkey.bind(hyper, "k", function()
        local window = hs.window.focusedWindow()
        local grid = hs.grid.get(window)
        if grid.x == 0.0 and grid.y == 0.0 and grid.w == 4 and grid.h == 4 then
            local screen = window:screen()
            if screen:toEast() then
                window:moveOneScreenEast()
            else
                window:moveOneScreenWest()
            end
        end
        hs.grid.maximizeWindow(window)
    end)
    -- Left 1/2 of the screen
    hs.hotkey.bind(hyper, "h", gridset(0, 0, 2, 4))
    -- Right 1/2 of the screen
    hs.hotkey.bind(hyper, "l", gridset(2, 0, 2, 4))
end

return mod
