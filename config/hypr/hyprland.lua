local HOME = os.getenv("HOME");

local XDG = os.getenv("XDG_CONFIG_HOME") or (HOME .. "/.config")
local PUBLIC = HOME .. "/Projects/nixos-dotfiles/config/hypr/"


package.path = package.path
  .. ";" .. XDG .. "/hypr" .. "/?.lua"
  .. ";" .. PUBLIC         .. "/?.lua"

require('modules.monitors'   )
require('modules.programs'   )
require('modules.env'        )
require('modules.autostart'  )
require('modules.layout'     )
require('modules.decoration' )
require('modules.animations' )
require('modules.keybindings')
require('modules.rules'      )
