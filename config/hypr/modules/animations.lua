local beziers = {

  { "durma",        { points = { {1.00, 1.00}, {1.00, 1.00} } } },
  { "firlat",       { points = { {0.25, 1.00}, {0.50, 1.00} } } },
  { "firlama",      { points = { {0.05, 0.90}, {0.10, 1.05} } } },
  { "wind",         { points = { {0.05, 0.90}, {0.10, 1.00} } } },
  { "winIn",        { points = { {0.05, 0.90}, {0.10, 1.01} } } },
  { "winOut",       { points = { {0.70, 0.00}, {0.10, 1.00} } } },
  { "linear",       { points = { {0.00, 0.00}, {1.00, 1.00} } } },
  { "liner",        { points = { {1.00, 1.00}, {1.00, 1.00} } } },
  { "almostLinear", { points = { {0.50, 0.50}, {0.75, 1.00} } } },

}

local animations = {

  { leaf = "windows"          , speed = 10.0, bezier = "wind"   , style = "slide"         },
  { leaf = "layersOut"        , speed = 10.0, bezier = "wind"   , style = "slide"         },
  { leaf = "layersIn"         , speed = 4.00, bezier = "winIn"  , style = "slide"         },
  { leaf = "windowsIn"        , speed = 4.00, bezier = "winIn"  , style = "slide"         },
  { leaf = "windowsMove"      , speed = 4.00, bezier = "wind"   , style = "slide"         },
  { leaf = "borderangle"      , speed = 60.0, bezier = "durma"  , style = "loop"          },
  { leaf = "workspaces"       , speed = 5.00, bezier = "wind"   , style = "slide"         },
  { leaf = "specialWorkspace" , speed = 5.00, bezier = "wind"   , style = "slidefadevert" },

  { leaf = "border"           , speed = 1.00, bezier = "liner"        },
  { leaf = "fadeIn"           , speed = 1.73, bezier = "almostLinear" },
  { leaf = "fadeOut"          , speed = 1.46, bezier = "almostLinear" },
  { leaf = "fade"             , speed = 3.03, bezier = "almostLinear" },

}

for _, bezier in ipairs(beziers) do
  bezier[2].type = "bezier"
  hl.curve( bezier[1], bezier[2] )
end

for _, animation in ipairs(animations) do
  animation.enabled = true
  hl.animation(animation)
end

