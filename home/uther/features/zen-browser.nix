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
       @-moz-document domain("youtube.com") {
        [dark] {
          --t7f4f2c6d54836ce0:rgba(255,255,255,0.1);
          --t7d8b8e5ee291aec0:rgba(0,0,0,0.05);
          --t4726c68ef6d7b08f:rgba(0,63,13,0.6);
          --tf0a0d1154827847f:rgba(124,41,0,0.6);
          --t3e41d7b17b187f69:#0f0f0f;
          --tff65993384bb4560:initial;
          --te2867b13d771d055:initial;
          --t933d7922f3158dc5:initial;
          --t264e2c9cb87891f9:initial;
          --t206f3fa2e01af22d:initial;
          --t34f46f0f2c13d328:initial;
          --t854c79338d8ca8a7:#f57;
          --t20480717de80f555:rgba(255,255,255,0.2);
          --t2d807bb79e75606d:#3ea6ff;
          --t617db776af0de196:#65b8ff;
          --tb628117fc164ad87:#065fd4;
          --td545df04e2c659d7:#f57;
          --t53991d599b1488f5:#c30027;
          --ta889dfda9605a358:rgba(15,15,15,0.8);
          --t5978da8d584b8fe9:rgba(15,15,15,0.7);
          --tdbe50d27d51f5093:rgba(0,122,101,0.3);
          --t99f774684cbb9703:rgba(127,14,127,0.3);
          --tb8b31ac562fbe9b5:rgba(170,9,170,0.3);
          --tef70ca245445b52b:rgba(255,78,69,0.3);
          --t4f0922e5a3d0c20f:initial;
          --t7dfa6f84c9346edf:initial;
          --tecbdf924b63b27fc:#fbc02d;
          --t1405e70a39276293:#f1f1f1;
          --tad8443faed66c111:#d9d9d9;
          --te6d2b428de68554a:#171c23;
          --tc980c5478124c8c7:#d5e3fc;
          --t965644ecdbe4b7b8:#2b3138;
          --tb14a10c3b43a15a3:#171c23;
          --tb13ff8797829e79e:#2b3138;
          --te5668e6111aba0ed:#42474f;
          --ta7d628facfe84d18:#a0abcb;
          --tbe42269534655e67:#30353b;
          --tab8059236063cadb:#ecf1fb;
          --t735e435a8b7ad67c:#fff;
          --t21af08fdbf6a1406:#fff;
          --tc604113d09fee05d:#c5cbd4;
          --t08a7c6c176cbc5c2:#282828;
          --t8cdc9846a76caf1f:#d9d9d9;
          --te1b64e6971040396:#272727;
          --t416e5931fc464589:rgba(255,255,255,0.2);
          --tb7d74bb3291c951d:rgba(0,0,0,0.1);
          --tf3fc855af2285f5f:rgba(255,255,255,0.2);
          --t0a1249f7c9e82b5e:rgba(0,0,0,0.1);
          --t02c0a2c868c14ce8:#e5e5e5;
          --td8562cdc203bc683:#3f3f3f;
          --t53dda9125e8d1324:rgba(255,255,255,0.15);
          --t544e31714f63d53c:rgba(255,255,255,0.3);
          --tfaae96692cc182e4:initial;
          --t518e925f61bdcb91:#212121;
          --tb927f5c0149004c6:#f03;
          --t832f22ce6618e99e:#e6e6e6;
          --t45b2a38314924357:#0f0f0f;
          --t6931aa1826b373b2:rgba(255,255,255,0.3);
          --ted4236536899e4b3:rgba(255,255,255,0.15);
          --t296c7f81dd09a9c3:#fff;
          --tfa3475c508f5dfef:#263850;
          --t9bc0b740242da017:#515561;
          --t441a0e44e495381a:#def1ff;
          --tde41338fc2bd4ba5:#fff;
          --t4d7776c28db21122:#a4ffa4;
          --t7e34d5baa4ea6277:#717171;
          --tc4b26042d4cb141f:#909090;
          --t5208fd177a788cfa:#ffbfbd;
          --tffc2fd3a644f6275:#f1f1f1;
          --t6216186c28b3834b:#0f0f0f;
          --t4a6da19e16bf221a:#aaa;
          --td9c19f4f8cecd56e:#606060;
          --t3f3bdb4140d3ead7:#ffcd97;
          --t904a88c623ca27ab:#2ba640;
          --t2c3bbff6c15a3eb2:#107516;
          --t0ccd1ace000d5e93:rgba(0,0,0,0.8);
          --tc87f6a7f05e65fc4:rgba(255,255,255,0.1);
          --tc04ba3e73561953c:rgba(0,0,0,0.1);
          --t7c4965c11f8537c0:rgba(255,255,255,0.1);
          --t432fbdbd7f2f3f71:rgba(0,0,0,0.05);
          --taf1bdd961423c15f:rgba(255,255,255,0.05);
          --t9d7bdcaefc975d44:rgba(255,255,255,0.2);
          --t4fb0f67b251e1a42:#fff;
          --ta08e036410c14538:#000;
          --t7f9b7e1603e20b94:#fff
        }
       }
      '';
    };
  };
}
