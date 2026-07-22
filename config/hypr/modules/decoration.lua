--------------------
---- DECORATION ----
--------------------

hl.config({
  general = {
    gaps_in     =  3,
    gaps_out    =  6,
    border_size =  1,

    col = {
      active_border   = "#d4c4a1",
      inactive_border = "#484442",
    },

    resize_on_border = true,
    allow_tearing    = true,

    layout            = "dwindle",
    no_focus_fallback =      true,
  },

  decoration = {
    rounding = 0,

    shadow = { enabled = false },
    blur   = { enabled = false, },
  },

  animations = {
    enabled = true,
  },
})
