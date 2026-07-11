--------------------
---- DECORATION ----
--------------------

hl.config({
  general = {
    gaps_in     =  5,
    gaps_out    =  10,
    border_size =  0,

    col = {
      active_border   = "#394956",
      inactive_border = "#394956",
    },

    resize_on_border = false,
    allow_tearing    = false,

    layout            = "dwindle",
    no_focus_fallback =      true,
  },

  decoration = {
    rounding       = 15,
    rounding_power =  2,

    active_opacity   = 1.0,
    inactive_opacity = 0.7,

    shadow = { enabled = false },

    blur = {
      enabled   =  true,
      size      =    20,
      passes    =     3,
      vibrancy  = .2696,
      noise     =     0,
    },
  },

  animations = {
    enabled = true,
  },
})

