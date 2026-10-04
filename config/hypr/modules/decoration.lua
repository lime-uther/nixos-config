--------------------
---- DECORATION ----
--------------------

hl.config({
  general = {
    -- gaps_in     =  5,
    -- gaps_out    = 10,
    gaps_in     =  3,
    gaps_out    =  6,
    border_size =  2,

    col = {
      active_border   = "#89b4fa",
      inactive_border = "#1e1d2d",
    },

    resize_on_border = true,
    allow_tearing    = true,

    layout            = "dwindle",
    no_focus_fallback =      true,
  },

  decoration = {
    rounding = 4,

    shadow = { enabled = false },

    blur   = {
      enabled = true,
      size    = 8,
      passes  = 3,

      new_optimizations = true,
      ignore_opacity = true,
      contrast = 1.2,
      brightness = 0.8,
      vibrancy = 0.2,
      noise = 0.02,

    },
  },

  animations = { enabled = true, },
})

