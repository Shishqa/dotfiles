local awful = require("awful")

awful.spawn.with_shell("xset r rate 300 50")

awful.spawn.with_shell("killall picom")
awful.spawn.with_shell("picom &")

awful.spawn.with_shell("feh --no-fehbg --bg-scale /home/shishqa/.config/wallpaper.png")
