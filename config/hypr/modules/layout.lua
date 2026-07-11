----------------
---- LAYOUT ----
----------------

hl.config({ dwindle   = { preserve_split = true,                } })
hl.config({ master    = { new_status = "inherit", mfact = 0.58, } })
hl.config({ scrolling = { fullscreen_on_one_column = true,      } })

----------------
----  MISC  ----
----------------

hl.config({
  misc = {
    on_focus_under_fullscreen = 0,
    force_default_wallpaper = 0,
    disable_hyprland_logo   = true,
    initial_workspace_tracking = 2,
    vrr = 1
  },
})

