-- load plugins
hs.loadSpoon("Hyper")
hs.loadSpoon("Vim")
hs.loadSpoon("Media")
hs.loadSpoon("Window")
hs.loadSpoon("App")

-- bind plugins to modal
local commandMode = spoon.Hyper.commandMode()

local apps = {
    iTerm = {'iTerm', 't'}, 
    Slack = {'Slack', 's'}, 
    IntelliJ = {'IntelliJ IDEA', 'i'}, 
    DataGrip = {'DataGrip', 'd'}, 
    Chrome = {'Google Chrome', 'c'}  
}
spoon.App.bindKeys(commandMode, apps)

spoon.Vim.bindKeys(commandMode)
spoon.Media.bindKeys(commandMode)
spoon.Window.bindKeys()

