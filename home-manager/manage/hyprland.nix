{pkgs, ...}: let
  wallpaper = ./forest.png;
in {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mod" = "SUPER";
      monitor = [
        "DP-1, 1920x1080@60, 0x0, 1"
        "HDMI-A-1, 1366x768@60, auto-left, 1, transform, 3"
        ", preferred, auto, 1"
      ];

      decoration = {
        rounding = 2;
      };

      general = {
        border_size = 1;
        gaps_out = [0 10 10 10];
        "col.active_border" = "0xff006400";
        animation = [
          "workspaces, 1, 2.5, easeOutQuart"
          "windows, 1, 2.5, easeOutQuart, slide"
          "fade, 1, 2, easeOutQuart"
        ];
        snap = {
          enabled = true;
        };
      };

      cursor = {
        enable_hyprcursor = false;
        no_hardware_cursors = true;
        # allow_dumb_copy = false;
      };

      curves = {
        bezier = "easeOutQuart, 0.25, 1, 0.5, 1";
      };

      bindm = [
        # mouse movements
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      input = {
        repeat_delay = 180;
        repeat_rate = 60;
        accel_profile = "flat";
        kb_options = "compose:menu";
        kb_layout = "de";
              };

      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        " __GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];

      exec-once =
      [
        "${pkgs.hyprpaper}/bin/hyprpaper --file ${wallpaper}"
        "sleep 20 && ${pkgs.waybar}/bin/waybar"
        "nicotine -n"
        "${pkgs.clipse}/bin/clipse -listen"
        "firefox"
        "vesktop"
        "${pkgs.xorg.xsetroot}/bin/xsetroot -cursor_name left_ptr"
        "${pkgs.mako}/bin/mako"
      ];


      windowrulev2 =
       [
        "opacity 0.80 0.80,class:(libreoffice)$"
        "opacity 0.80 0.80,class:(rofi)$"
        "opacity 0.80 0.80,class:^(dolphin)$"
        "opacity 0.80 0.80,class:^(firefox)$"
        "opacity 0.80 0.80,class:^(Eclipse)$"
        "opacity 0.80 0.80,class:^(kitty)$"
        "opacity 0.80 0.80,class:^(VSCodium)$"
        "workspace 3 silent, class:(steam)"
        "workspace 2 silent, class:(vesktop)"
        "workspace 1 silent, class:(firefox)"
        "float,class:(clipse)"
        "size 622 652,class:(clipse)"
        "noblur, class:^(plugdata)$"

      ];

      workspace = [
        "1, monitor:DP-1"
        "2, monitor:HDMI-A-1"
        "3, monitor:HDMI-A-1"
      ];

      bind =
        [
          "$mod, Return, exec, kitty"
          "$mod, R, exec, kitty --class ${pkgs.clipse}/bin/clipse -e 'clipse'"

          "$mod, D, exec, rofi -show drun"
          "$mod, C, exec, rofi -show calc -modi calc -no-show-match -no-sort"
          "$mod, Period, exec, rofi -modi emoji -show emoji"

          "$mod, E, exec, dolphin" # File manager

          "$mod, Q, killactive"
          "$mod, TAB, workspace, previous"
          "$mod, J, cyclenext"
          "$mod, K, cyclenext, prev"
          "$mod, P, togglefloating"
          "$mod, F, fullscreen"


                  ", XF86AudioMute, exec, ${pkgs.pulsemixer}/bin/pulsemixer --toggle-mute"
          ",XF86AudioLowerVolume, exec, ${pkgs.pulsemixer}/bin/pulsemixer --change-volume -5"
          ",XF86AudioRaiseVolume, exec, ${pkgs.pulsemixer}/bin/pulsemixer --change-volume +5 --max-volume 100"

          ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
          ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"

          ",XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"

          ", Print, exec, ${pkgs.grimblast}/bin/grimblast copy area"
          "SHIFT, Print, exec, ${pkgs.grimblast}/bin/grimblast copy output"
        ]
        ++ (
          # Workspaces
          builtins.concatLists (builtins.genList (i: let
              ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod CONTROL, code:1${toString i}, movetoworkspace, ${toString ws}"
            ])
            9)
        );
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["${wallpaper}"];
      wallpaper = [",${wallpaper}"];
    };
  };

}
