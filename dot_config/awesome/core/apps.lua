local m = {}

m.terminal = os.getenv("TERMINAL") or "alacritty"
m.editor = os.getenv("EDITOR") or "vim"
m.editor_cmd = m.terminal .. " -e " .. m.editor
m.screenshot_cmd = "flameshot gui"
m.launcher_cmd = "rofi -show combi"
m.explorer = "vifm"
m.explorer_cmd = m.terminal .. " -e " .. m.explorer
m.password_cmd = "rofi-pass"
m.emoji_cmd = "rofimoji"

return m
