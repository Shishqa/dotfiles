local awful = require("awful")

awful.spawn.with_shell("xset r rate 300 50")

awful.spawn.with_shell("killall picom")
awful.spawn.with_shell("picom &")
awful.spawn.with_shell("git-auto-sync-daemon &")

awful.spawn.with_shell("feh --no-fehbg --bg-fill /home/shishqa/.config/wallpaper.png")
