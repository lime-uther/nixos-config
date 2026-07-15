{ inputs, ... }:

{
  imports = [ inputs.zen-browser.homeModules.twilight ];

  programs.zen-browser = {
    enable = true;

    policies = {

      ExtensionSettings = with builtins; let
        extension = shortId: uuid: defaultArea: {
          name = uuid;
          value = {
            install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
            installation_mode = "force_installed";
            default_area = defaultArea;
            blocked_install_message = "Fucking forget it.";
          };
        };
      in
      listToAttrs [

        {
          name = "*";
          value = {
            installation_mode = "blocked";
            allowd_types = [ "extension" ];
          };
        }

        (extension "sponsorblock" "sponsorBlocker@ajay.app" "menupanel")
        (extension "vimium-c" "vimium-c@gdh1995.cn" "menupanel")

        (extension "ublock-origin" "uBlock0@raymondhill.net" "navbar")

      ];
    };

    profiles.uther = {
      spacesForce = true;
      spaces = {
        "Personal" = {
          id = "c630b383-fef2-4afa-b560-d758caaf682b";
          position = 1000;

          
          theme = {
            type = "gradient";
            colors = [
              {
                red = 29;
                green = 32;
                blue = 33;
                algorithm = "floating";
                type = "explicit-lightness";
                lightness = 50;
              }
            ];
          };
        };
      };
      keyboardShortcuts = [
        {
          id = "zen-compact-mode-toggle";
          key = "-";
          modifiers = {
            control = true;
            alt = true;
          };
        }
        {
          id = "zen-toggle-sidebar";
          key = "q";
          modifiers = {
            control = true;
            alt = true;
          };
        }
        {
          id = "key_quitApplication";
          disabled = true;
        }
      ];

      keyboardShortcutsVersion = 19;

      userChrome = ''
      :root {
        } 
      '';
    };
  };
}
