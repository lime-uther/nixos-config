--------------------
---- DECORATION ----
--------------------

hl.config({
  general = {
    gaps_in     =  0,
    gaps_out    =  0,
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
    rounding = 0,

    shadow = { enabled = false },
    blur   = { enabled = false },
  },

  animations = { enabled = true, },
})

