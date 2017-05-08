-- load plugins
hs.loadSpoon("Hyper")
hs.loadSpoon("Vim")
hs.loadSpoon("Media")

-- bind plugins to modal
local commandMode = spoon.Hyper:commandMode()
spoon.Vim:bindModal(commandMode)
spoon.Media:bindModal(commandMode)

