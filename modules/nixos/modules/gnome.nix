{ config, pkgs, ... }:

{
  # GNOME-specific settings
  environment.gnome.excludePackages = [
    pkgs.baobab 
    pkgs.cheese 
    pkgs.eog 
    pkgs.epiphany
    pkgs.gedit
    pkgs.simple-scan
    pkgs.totem
    pkgs.yelp
    pkgs.evince
    pkgs.geary
    pkgs.seahorse
    pkgs.gnome-calculator
    pkgs.gnome-characters 
    pkgs.gnome-contacts
    pkgs.gnome-font-viewer
    pkgs.gnome-logs
    pkgs.gnome-maps
    pkgs.gnome-music
    pkgs.gnome-system-monitor
    pkgs.gnome-terminal
    pkgs.gnome-connections
    pkgs.gnome-text-editor
    pkgs.gnome-tour
    pkgs.gnome-photos
  ];

  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.space-bar
    gnomeExtensions.switcher
    gnomeExtensions.tactile
    gnomeExtensions.tophat
    gnomeExtensions.forge
    gnomeExtensions.logo-menu
  ];

  services.gnome.gnome-remote-desktop.enable = true;

  # X server settings
  services.xserver = {
    enable = true;
    # videoDrivers = [ "modesetting" ];  # Ensure only 'modesetting' driver is specified
    xkb.layout = "de";

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
}
