{ config, pkgs, lib, ... }:
let thm = config.scheme;
in {
  home-manager.users.sencho.programs.alacritty = {
    enable = true;
    settings = {
      draw_bold_text_with_bright_colors = true;

      font = with builtins; let
        splitted = split "([0-9]+)" (elemAt config.fonts.fontconfig.defaultFonts.monospace 0);
      in {
        font = elemAt splitted 0;
        size = lib.strings.toInt (elemAt (elemAt splitted 1) 0);
        bold = { style = "Bold"; };
      };

      window.padding = {
        x = 2;
        y = 2;
      };
      
      shell.program = "${pkgs.zsh}/bin/zsh";

      cursor = {
        # When alacritty is not in vi-mode, the cursor is set by ZSH to be
        # able to change between beam and block in zsh viins and vicmd modes.
        vi_mode_style = "Block";
      };

      colors = with config.scheme.withHashtag;
        let default = {
            black = base00; white = base07;
            inherit red green yellow blue cyan magenta;
          };
        in  {
          primary = {
            background = base00;
            foreground = base07;
          };
          cursor = {
            text = base02;
            cursor = base07;
          };
          normal = default;
          bright = default;
          dim = default;
        };
    };
  };
}