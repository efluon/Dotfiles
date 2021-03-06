-- override stuff
require('overrides').init()

-- requires
bindings                    = require('bindings')
controlplane                = require('utils.controlplane')
notify                      = require('utils.notify')
watchers                    = require('utils.watchers')
window                      = require('ext.window')

-- extensions
window.fixEnabled           = false
window.fullFrame            = true
window.highlightBorder      = true
window.highlightMouseCenter = true
window.historyLimit         = 50
window.margin               = 6

-- hs
hs.window.animationDuration = 0.0

hs.hints.fontName           = 'Helvetica-Bold'
hs.hints.fontSize           = 22
hs.hints.showTitleThresh    = 0
hs.hints.hintChars          = { 'A', 'S', 'D', 'F', 'J', 'K', 'L', 'Q', 'W', 'E', 'R', 'Z', 'X', 'C' }

-- bindings
bindings.mode               = 'mixed' -- ('kwm', 'grid')

-- controlplane
controlplane.enabled        = { 'automount', 'bluetooth', 'displays', 'persistvpn' }
controlplane.persistVPN     = 'PIA'

-- notifications
notify.enabled              = { 'battery', 'wifi' }

-- watchers
watchers.enabled            = { 'application', 'reload', 'urlevent' }
watchers.urlPreference      = { 'Safari', 'Google Chrome' }

-- start modules
hs.fnutils.each({
  bindings,
  controlplane,
  notify,
  watchers
}, function(module) module.start() end)

-- stop modules on shutdown
hs.shutdownCallback = function()
  -- save window positions in hs.settings
  window.persistPosition('store')

  -- stop modules
  hs.fnutils.each({
    bindings,
    controlplane,
    notify,
    watchers
  }, function(module) module.stop() end)
end

-- ensure IPC is there
hs.ipc.cliInstall()
