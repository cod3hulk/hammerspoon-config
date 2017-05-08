-- load plugins
hs.loadSpoon("Hyper")
hs.loadSpoon("Vim")

-- Toggle command mode
spoon.Vim:bindViKeys(spoon.Hyper:commandMode())
spoon.Vim:bindMediaKeys(spoon.Hyper:commandMode())

spoon.Hyper.start()
