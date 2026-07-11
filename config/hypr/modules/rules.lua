--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
  name  = "fix-xwayland-drags",
  match = {
    class      =  "^$",
    title      =  "^$",
    xwayland   =  true,
    float      =  true,
    fullscreen = false,
    pin        = false,
  },

  no_focus = true,
})

hl.window_rule({
    name = "unblur-noclass",
    match = {
        tag = "no_class",
    },
    no_blur = true
})

hl.layer_rule({ match = { namespace = "taskbar" },   blur    = true, ignore_alpha = 0.5, })
hl.layer_rule({ match = { namespace = "selection" }, no_anim = true,                     })

