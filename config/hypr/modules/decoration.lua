--------------------
---- DECORATION ----
--------------------

hl.config({
  general = {
    gaps_in     =  5,
    gaps_out    =  10,
    border_size =  3,

    col = {
      active_border   = "#ebdbb2",
      inactive_border = "#928374",
    },

    resize_on_border = true,
    allow_tearing    = true,

    layout            = "dwindle",
    no_focus_fallback =      true,
  },

  decoration = {
    rounding       = 0,

    shadow = { enabled = false },
    blur = { enabled   =  false, },
  },

  animations = {
    enabled = true,
  },
})
