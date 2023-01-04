local double_press = require("altDoublePress")

hs.loadSpoon("ReloadConfiguration")

local open_wezterm = function()
    local appName = "WezTerm"
    local app = hs.application.get(appName)

    if app == nil or app:isHidden() or not(app:isFrontmost()) then
        hs.application.launchOrFocus(appName)
    else
        app:hide()
    end
end

double_press.timeFrame = 0.5
double_press.action = open_wezterm

spoon.ReloadConfiguration:start()
