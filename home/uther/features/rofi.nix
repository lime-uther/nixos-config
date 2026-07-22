{ config, ... }:

{
  programs.rofi = {
    enable = true;
    cycle  = true;

    extraConfig = {
      modi                = "window,run,drun";
      display-drun        = "Applications";
      display-window      = "Windows";
      display-run         = "Run";
      drun-display-format = "{icons} {name}";

      kb-remove-to-eol    = "";
      kb-accept-entry     = "Control+n,Control+m,Return,KP_Enter";
      kb-row-up           = "Up,Control+k";
      kb-row-down         = "Down,Control+j";
    };

    theme = let inherit (config.lib.formats.rasi) mkLiteral; in {

      "*" = {
          font                  = "JetBrainsMono 10";
          accent                = mkLiteral "#b8bb25";
          bg-primary            = mkLiteral "#1d2021";
          bg-secondary          = mkLiteral "#2e2e2e";
          fg                    = mkLiteral "#d5c4a1";
          fg-secondary          = mkLiteral "#423e3c";
          error                 = mkLiteral "#fb4934";
          rounding              = mkLiteral "4px";
      };

      "window" = {
          width                 = mkLiteral "450px";
          height                = mkLiteral "355px";
          location              = mkLiteral "center";
          anchor                = mkLiteral "center";
          background-color      = mkLiteral "@bg-primary";
      };

      "mainbox" = {
          spacing               = mkLiteral "0px";
          background-color      = mkLiteral "transparent";
          children              = mkLiteral "[ \"listbox\" ]";
      };

      "listbox" = {
          spacing               = mkLiteral "0px";
          orientation           = mkLiteral "vertical";
          background-color      = mkLiteral "transparent";
          children              = mkLiteral "[ \"inputbar\", \"message\", \"listview\" ]";
      };

      "inputbar" = {
          spacing               = mkLiteral "7px";
          padding               = mkLiteral "15px";
          text-color            = mkLiteral "@fg";
          border-radius         = mkLiteral "@rounding";
          background-color      = mkLiteral "transparent";
          children              = mkLiteral "[ \"textbox-prompt-colon\", \"entry\" ]";
      };

      "textbox-prompt-colon"    = {
          expand                = false;
          str                   = " ";
          background-color      = mkLiteral "transparent";
          text-color            = mkLiteral "@accent";
      };

      "entry" = {
          cursor                = mkLiteral "text";
          padding               = mkLiteral "1px 0px";
          background-color      = mkLiteral "transparent";
          text-color            = mkLiteral "@fg";
          placeholder-color     = mkLiteral "#808080aa";
      };

      "listview" = {
          columns               = mkLiteral "1";
          lines                 = mkLiteral "10";
          cycle                 = true;
          dynamic               = true;
          scrollbar             = false;
          layout                = mkLiteral "vertical";
          fixed-height          = true;
          fixed-columns         = true;
          background-color      = mkLiteral "transparent";
          text-color            = mkLiteral "@fg";
      };

      "element" = {
            padding             = mkLiteral "6px 5px";
            background-color    = mkLiteral "transparent";
            text-color          = mkLiteral "@fg";
            cursor              = mkLiteral "pointer";
      };

      "element normal.normal"   = {
          background-color      = mkLiteral "inherit";
           text-color           = mkLiteral "inherit";
      } ;

      "element normal.urgent"   = {
          background-color      = mkLiteral "@error";
          text-color            = mkLiteral "@fg-secondary";
      };

      "element normal.active"   = {
          background-color      = mkLiteral "@bg-secondary";
          text-color            = mkLiteral "@fg-secondary";
      };

      "element selected.normal" = {
          background-color      = mkLiteral "@bg-secondary";
          text-color            = mkLiteral "inherit";
      };

      "element selected.urgent, element selected.active" = {
          background-color      = mkLiteral "@error";
          text-color            = mkLiteral "@fg";
      };

      "element-text" = {
          background-color      = mkLiteral "transparent";
          text-color            = mkLiteral "inherit";
          cursor                = mkLiteral "inherit";
          vertical-align        = mkLiteral "0.5";
          horizontal-align      = mkLiteral "0.0";
      };

      "message" = {
          background-color      = mkLiteral "transparent";
      };

      "error-message" = {
          padding               = mkLiteral "12px";
          background-color      = mkLiteral "@bg-secondary";
          text-color            = mkLiteral "@fg-secondary";
      };

    };
  };
}
