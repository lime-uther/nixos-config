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

hl.layer_rule({
  match = {
    namespace = "awww-daemon"
  },
  animation = "popin",
})

for _, no_anim

  in pairs({
    "taskbar",
    "selection",
  }) do

  hl.layer_rule({
    match = {
      namespace = no_anim
    },
    no_anim = true
  })

end

