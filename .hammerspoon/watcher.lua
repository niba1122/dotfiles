-- from https://github.com/naoya/hammerspoon-init/

-- --------------------------------------
-- Watcher to load the configuration in case of changes
-- --------------------------------------
function reload_config(files)
   hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/init.lua", reload_config):start()
hs.alert.show("Config loaded")
Contact GitHub API Training Shop Blog About
