{ pkgs, ... }:

let
  pokefetch = (pkgs.writeShellApplication {
    name = "pokefetch";

    runtimeInputs = with pkgs; [

      fastfetch
      pokeget-rs

      coreutils
      gawk
      gnused

    ];

    text = ''
      # by discomanfulanito - modified by me lol
      # for everyone - as code should be

      FETCHER="${pkgs.fastfetch}/bin/fastfetch --logo none"

      FETCHER_HEIGHT=13

      EXTRA_PADDING_H=2
      EXTRA_PADDING_W=0

      WIDTH=38

      sprite=$(pokeget random --hide-name)

      read -r height sprite_width <<< "$(awk '{
          gsub(/\x1b\[[0-9;]*m/, "")
          if (length > max) max = length
      } END { print NR, max+0 }' <<< "$sprite")"

      pad_top=$(( (FETCHER_HEIGHT - height) / 2 + EXTRA_PADDING_H ))
      (( pad_top < 0 )) && pad_top=0

      pad_Left=$(( (WIDTH - sprite_width) / 2 + EXTRA_PADDING_W ))
      pad_Right=$(( (WIDTH - sprite_width + 1) / 2 + EXTRA_PADDING_W ))

      (( pad_Left < 0 )) && pad_Left=0
      (( pad_Right < 0 )) && pad_Right=0

      $FETCHER --file-raw - --logo-padding-top "$pad_top" --logo-padding-left "$pad_Left" --logo-padding-right "$pad_Right" <<< "$sprite"
    '';
  });


  mkModule = { name, type, format ? "{1}", ... } @ args: 
  let
    padName = builtins.substring 0 13 "${name}      ";
    extraArgs = builtins.removeAttrs  args [ "name" "format"];
  in 
    extraArgs // {
      key = "│ ${padName}{#37}││{$2}C│{$2}D";
      format = "{#37}${format}";
    };
in
{
  home.packages = with pkgs; [

    pokeget-rs
    pokefetch

  ];

  programs.fastfetch = {
    enable = true;
    # package = pokefetch;
    settings = {
      display = {
        color = {
          keys = "37";
        };
        separator = "";
        constants = [
          "─────────────────────────"
          "${builtins.fromJSON ''"\u001b"''}[25"
        ];
      };
      modules = [
        { key = "┌─────────┐┌{$1}┐"; type = "custom"; }
      ] ++ map mkModule [
        { name = "{#34}user";   type = "title";   format = "{user-name}"; }
        { name = "{#34}device"; type = "host";    format = "{2}";         }
        { name = "{#34}distro"; type = "os";      format = "{3}";         }
        { name = "{#34}kernel"; type = "kernel";  format = "{2}";         }
        { name = "{#34}uptime"; type = "uptime";  format = "{1}h {2}m";   }
      # { name = "{#34}shell";  type = "shell";                           }
        { name = "{#34}term";   type = "terminal";                        }
      # { name = "{#34}wm";     type = "wm";      format = "{2}";         }
        { name = "{#34}cpu";    type = "cpu";                             }
        { name = "{#34}gpu";    type = "gpu";     format = "{2}";         }
        { name = "{#34}memory"; type = "memory";  format = "{1} / {2}";   }
        { name = "{#34}disk";   type = "disk";    format = "{1} / {2}";   }
        { name = "{#34}battery";type = "battery"; format = "{4} [{5}]";   }
        { name = "{#34}apps";   type = "packages";                        }
        { name = "{#34}network";type = "localip";                         }
      ] ++ [
        { key = "└─────────┘└{$1}┘"; type = "custom"; }
        { key = " "; type = "colors"; }
      ];
    };
  };
}
