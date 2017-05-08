-- load plugins
hs.loadSpoon("Hyper")
hs.loadSpoon("Vim")
hs.loadSpoon("Media")
hs.loadSpoon("Window")

-- bind plugins to modal
local commandMode = spoon.Hyper.commandMode()
spoon.Vim.bindKeys(commandMode)
spoon.Media.bindKeys(commandMode)
spoon.Window.bindKeys()
