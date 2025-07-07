{ config, lib, pkgs, ... }:

let
  inherit (lib) mkOption mkIf types;
in
{
  options.dwm.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable the DWM window manager and related setup.";
  };

  config = mkIf config.dwm.enable {
    home.packages = with pkgs; [
      dwm
      slstatus
      xorg.xinit
      xorg.xauth
      dbus
      networkmanagerapplet
      blueman
      feh
    ];

    xsession.enable = true;

    # .xsession script
    home.file.".xsession" = {
      text = ''
        #!/bin/sh
        # Start dbus session if not already started
        if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
          eval "$(dbus-launch --exit-with-session --sh-syntax)"
        fi

        # Import environment variables for systemd user services
        systemctl --user import-environment DISPLAY XAUTHORITY

        # Update dbus activation environment if available
        if command -v dbus-update-activation-environment >/dev/null 2>&1; then
          dbus-update-activation-environment DISPLAY XAUTHORITY
        fi

        # Export java AWT setting
        export _JAVA_AWT_WM_NONREPARENTING=1

        # Start background utilities
        slstatus &
        nm-applet &
        blueman-applet &

        # Restore background image
        [ -f "$HOME/.fehbg" ] && "$HOME/.fehbg"

        # Start DWM
        exec dwm
      '';
      executable = true;
    };

    # .xinitrc just runs .xsession
    home.file.".xinitrc" = {
      text = ''
        exec $HOME/.xsession
      '';
      executable = true;
    };
  };
}
