--------------------
---- DECORATION ----
--------------------

hl.config({
  general = {
    gaps_in     =  5,
    gaps_out    =  10,
    border_size =  2,

    resize_on_border = true,
    allow_tearing    = true,

    layout            = "dwindle",
    no_focus_fallback =      true,
  },

  decoration = {
    rounding       = 12,
    rounding_power =  2,

    shadow = { enabled = false },
    blur = { enabled = false, },
  },

  animations = {
    enabled = true,
  },
})
