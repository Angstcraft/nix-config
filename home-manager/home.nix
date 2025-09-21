# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./programs/default.nix
    ./Desktops/Default.nix

    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example
    #outputs.homeManagerModules.default

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
  ];

  nixpkgs = {
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  home = {
    username = "alpha";
    homeDirectory = "/home/alpha";
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;

  home.packages = with pkgs; [
    tdf #pdf reader
    gdb
    cmake
    gqrx
    python3
    libreoffice-qt
    eclipses.eclipse-java
    mangayomi
  ];

  # Nicely reload sy[stem units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.05";
}
