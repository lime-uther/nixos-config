--------------------
---- DECORATION ----
--------------------

hl.config({
  general = {
    gaps_in     =  3,
    gaps_out    =  6,
    border_size =  1,

    col = {
      active_border   = "#ebdbb2",
      inactive_border = "#504945",
    },

    resize_on_border = true,
    allow_tearing    = true,

    layout            = "dwindle",
    no_focus_fallback =      true,
  },

  decoration = {
    rounding = 4,

    shadow = { enabled = false },
    blur = { enabled   =  false, },
  },

  animations = {
    enabled = true,
  },
})
