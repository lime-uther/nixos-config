---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout  = "us",
    kb_variant =   "",
    kb_model   =   "",
    kb_options =   "",
    kb_rules   =   "",

    follow_mouse = 1,

    sensitivity = 0.7,

    touchpad = {
      natural_scroll = true,
    },
  },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.device({ name = "elan07b9:00-04f3:3276-touchpad", sensitivity = 0.7, })
hl.device({ name = "2.4g-mouse", sensitivity = 1 })

---------------------
---- KEYBINDINGS ----
---------------------


local mainMod = "SUPER"

hl.bind(mainMod .. " + ALT + R", function ()
  hl.notification.create({ text = "shoji mode", duration = "1000"})
  hl.dispatch(hl.dsp.submap("shoji"))
end);

hl.define_submap("shoji", function ()
  hl.bind(mainMod .. " + ALT + R", function ()
    hl.notification.create({ text = "exited shoji mode", duration = "1000"})
    hl.dispatch(hl.dsp.submap("reset"))
  end);
end)

hl.bind("SUPER + CONTROL + ALT + SHIFT + SPACE", hl.dsp.exec_cmd(Terminal))

hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd(FileManager)                             )
hl.bind(mainMod .. " + V",         hl.dsp.window.float({ action = "toggle" })               )
hl.bind(mainMod .. " + F",         hl.dsp.window.fullscreen({ mode = "maximized"})                               )
hl.bind(mainMod .. " + SHIFT + F",         hl.dsp.window.fullscreen()                               )
hl.bind(mainMod .. " + D",     hl.dsp.exec_cmd("pkill " .. Menu .. " || " .. Launchmenu))

hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("pkill slurp || grim -g \"$(slurp)\" - | wl-copy"))
hl.bind("CONTROL + PRINT",     hl.dsp.exec_cmd("pkill slurp || grim -g \"$(slurp)\" - | swappy -f -"))
hl.bind("PRINT",               hl.dsp.exec_cmd("grim -c - | wl-copy"))

hl.bind(mainMod .. " + CONTROL + B", hl.dsp.exec_cmd("sh ~/.local/bin/birthday.sh"))

local window_states = {}

local function toggle_lock()
  local win = hl.get_active_window()
  if not win or not win.address then return end

  if window_states[win.address] == nil then
    window_states[win.address] = { lock = false }
  end

  window_states[win.address].lock = not window_states[win.address].lock
  hl.notification.create({ text = tostring(window_states[win.address].lock), duration = "1000"})
end

hl.bind(mainMod .. " + GRAVE", toggle_lock)
hl.bind(mainMod .. " + W", function()

  local win = hl.get_active_window()
  if not win or not win.address then return end

  if not window_states[win.address] or not window_states[win.address].lock then
    return hl.dispatch(hl.dsp.window.close())
  end

  hl.notification.create({ text = "Active window is locked", duration = "1000"})

end)

-- hl.bind("SUPER_L", function ()
--   hl.notification.create({ text = "on", duration = "1000"})
-- end, { transparent = true, non_consuming = true })
--
-- hl.bind(mainMod .. " + SUPER_L", function ()
--   hl.notification.create({ text = "off", duration = "1000"})
-- end, { release = true, non_consuming = true, transparent = true })

local floatables = {
  ["firefox"] = true,
  ["kitty"] = true,
  ["spotify"] = true
}

local windowsOfWorkspace = {}

hl.on('window.open_early', function (window)
  if window.class ~= "" then return end

  hl.dispatch(hl.dsp.window.tag({ tag = "no_class", window = window }));
end)

hl.on('window.open', function (window)

  if not floatables[window.class] then return end

  hl.dispatch(hl.dsp.window.float({ action = "on", window = window }))
  hl.dispatch(hl.dsp.window.resize({ x = 800, y = 600, false, window = window }))
  hl.dispatch(hl.dsp.window.move({ x = 1920/2 - 800/2, y = 1080/2 - 600/2, false, window = window }))

end)

hl.bind(mainMod .. " + C", hl.dsp.window.move({ x = 1920/2 - 800/2, y = 1080/2 - 600/2, false }))

local directions = {
  { key = "H", direction = "left"  },
  { key = "L", direction = "right" },
  { key = "K", direction = "up"    },
  { key = "J", direction = "down"  },
}

for _, v in ipairs(directions) do
  hl.bind(mainMod .. " + " .. v.key,           hl.dsp.focus({ direction = v.direction })      )
  hl.bind(mainMod .. " + SHIFT + " .. v.key,   hl.dsp.window.move({ direction = v.direction }))
end

for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i})       )
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S",          hl.dsp.workspace.toggle_special("magic")           )
hl.bind(mainMod .. " + SHIFT + S",  hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272",            hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273",            hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + CONTROL + mouse:272",  hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

