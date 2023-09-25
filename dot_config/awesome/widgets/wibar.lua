local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local theme = require("theme.theme")

local launcher = require("widgets.launcher")

local bindings = require("core.bindings")
local tags = require("core.tags")

-- {{{ Wibar
-- Keyboard map indicator and switcher
local mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget
local mytextclock = wibox.widget.textclock("%d\n%m\n%y\n\n%H\n%M")

local battery_widget = require("widgets.battery")
local BAT0 = battery_widget {
  adapter = "BAT0",
  ac = "AC",
  battery_prefix = "",
}

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
  awful.button({}, 1, function(t) t:view_only() end),
  awful.button({ bindings.modkey }, 1, function(t)
    if client.focus then
      client.focus:move_to_tag(t)
    end
  end),
  awful.button({}, 3, awful.tag.viewtoggle),
  awful.button({ bindings.modkey }, 3, function(t)
    if client.focus then
      client.focus:toggle_tag(t)
    end
  end),
  awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
  awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
  awful.button({}, 1, function(c)
    if c == client.focus then
      c.minimized = true
    else
      c:emit_signal(
        "request::activate",
        "tasklist",
        { raise = true }
      )
    end
  end),
  awful.button({}, 3, function()
    awful.menu.client_list({ theme = { width = 250 } })
  end),
  awful.button({}, 4, function()
    awful.client.focus.byidx(1)
  end),
  awful.button({}, 5, function()
    awful.client.focus.byidx(-1)
  end))

local function set_wallpaper(s)
  -- Wallpaper
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == "function" then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
  end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
  set_wallpaper(s)

  -- Each screen has its own tag table.
  awful.tag(tags.tags, s, awful.layout.layouts[1])

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({}, 1, function() awful.layout.inc(1) end),
    awful.button({}, 3, function() awful.layout.inc(-1) end),
    awful.button({}, 4, function() awful.layout.inc(1) end),
    awful.button({}, 5, function() awful.layout.inc(-1) end)))
  -- Create a taglist widget
  local fancy_taglist = require("widgets.fancy_taglist")
  s.mytaglist = fancy_taglist.new {
    screen = s,
    taglist = { buttons = taglist_buttons },
    tasklist = { buttons = tasklist_buttons },
  }

  -- Create the wibox
  function custom_shape(cr, width, height)
    gears.shape.partially_rounded_rect(cr, width, height, false, true, true, false, theme.border_radius)
  end

  -- Create the wibox
  s.mywibox = awful.wibar({
    screen = s,
    position = 'left',
    width = 26,
    -- height = 1180,
    margins = {
      top = 10,
      bottom = 10,
    },
    stretch = true,
    -- height = 24,
    -- stretch = false,
    -- width = 1280,
    -- type = "dock",
    shape = custom_shape,
  })

  -- awful.placement.left(s.mywibox, {margins = 8})

  s.mysystray = wibox.widget.systray()
  s.mysystray:set_horizontal(false)

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.vertical,
    { -- Left widgets
      {
        s.mytaglist,
        direction = 'west',
        widget = wibox.container.rotate
      },
      layout = wibox.layout.fixed.vertical,
    },
    nil,
    { -- Right widgets
      {
        {
          mykeyboardlayout,
          {
            widget = mytextclock,
            align = "center",
          },
          BAT0,
          layout = wibox.layout.fixed.vertical,
          spacing = 10,
        },
        widget = wibox.container.place,
      },
      widget = wibox.container.margin,
      bottom = 20,
    },
  }
end)
-- }}}
