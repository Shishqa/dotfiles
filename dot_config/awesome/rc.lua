-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")

require("awful.autofocus")

-- Theme handling library
local beautiful = require("beautiful")


-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme/theme.lua")
-- }}}

require("core.errors")
require("core.layouts")
require("core.bindings")
require("core.rules")

require("widgets.launcher")
require("widgets.wibar")

require("signals")

require("core.autostart")
