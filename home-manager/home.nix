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
    ./Programs/Default.nix
    ./Desktops/Default.nix

    # ./nixvim.nix
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example
    #outputs.homeManagerModules.default

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
  ];

  nixpkgs = {
    # You can add overlays here
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

  #home.file."config/hypr/hyprland.conf".source = ./hyprland.conf;
  home = {
    username = "alpha";
    homeDirectory = "/home/alpha";
  };


  programs.home-manager.enable = true;
  programs.git.enable = true;

  home.packages = with pkgs;
   [
    git
    qtcreator
    texliveFull
    texstudio
    p7zip
    nodejs
    gdb
    cmake
    gqrx
    python3
    python312Packages.jupyterlab
    libreoffice-qt
    hunspell
    hunspellDicts.th_TH

    signal-desktop

    processing
    ghidra




  ];





  # Nicely reload sy[stem units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.05";
}
