local module = {}
local cache  = {}

-- set Thunderbolt Display as primary when available
local screenWatcher = function()
  local thunderboltDisplay = hs.screen.findByName('Thunderbolt Display')
  local laptopDisplay      = hs.screen.findByName('Color LCD')

  if not thunderboltDisplay then
    laptopDisplay:setPrimary()
  else
    thunderboltDisplay:setPrimary()
  end
end

module.start = function()
  cache.watcher = hs.screen.watcher.new(screenWatcher):start()

  -- run on start
  screenWatcher()
end

module.stop = function()
  if cache.watcher then cache.watcher:stop() end
end

return module