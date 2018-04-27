local mod = {}

function mod.bindKeys(modal, apps)
    for k,v in pairs(apps) do
        modal:bind({}, v[2], function()
            hs.application.launchOrFocus(v[1])
        end)
        hs.hotkey.bind({"ctrl", "alt", "cmd", "shift"}, v[2], function()
            hs.application.launchOrFocus(v[1])
        end)
    end
end

return mod

