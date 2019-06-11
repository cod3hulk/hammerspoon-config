-- load plugins
hs.loadSpoon("Hyper")
hs.loadSpoon("Vim")
hs.loadSpoon("Media")
hs.loadSpoon("Window")
hs.loadSpoon("App")

-- bind plugins to modal
local commandMode = spoon.Hyper.commandMode()

local apps = {
    Mail = {'Airmail Beta', 'm'}, 
    Calendar = {'Fantastical 2', 'c'}, 
    Terminal = {'iTerm', 't'}, 
    Slack = {'Slack', 's'}, 
    IntelliJ = {'IntelliJ IDEA', 'i'}, 
    Editor = {'VimR', 'e'}, 
    Browser = {'Google Chrome', 'b'}  
}
spoon.App.bindKeys(commandMode, apps)

spoon.Vim.bindKeys(commandMode)
spoon.Media.bindKeys(commandMode)
spoon.Window.bindKeys()

