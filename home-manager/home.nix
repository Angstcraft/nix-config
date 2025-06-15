# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
   #./nvim.nix
   #./alaritty.nix
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example
    #outputs.homeManagerModules.default
    #outputs.homeManagerModules.nvf

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    #./modules/home-manager/default.nix
    #./kitty.nix
    #./nvf.nix
  
   
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
  /** 
  let 
    startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
      ${pkgs.waybar}/bin/waybar &
      ${pkgs.swww}/bin/swww init & 

      sleep 1

      ${pkgs.swww}/bin/swww img ${./wallpaper.png}&
      '';
  in
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {

    };
  };

*/

#home.file."config/hypr/hyprland.conf".source = ./hyprland.conf;
  # TODO: Set your username
  home = {
    username = "alpha";
    homeDirectory = "/home/alpha";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
 
  
    home.packages = with pkgs; [
    # Development tools
    home-manager
    alacritty
    git
    qtcreator
    vscodium
    texliveFull
    texstudio
    nodejs
    p7zip

    # Java and Development Tools
    eclipses.eclipse-java
    scenic-view
    scenebuilder

    # C/C++ and Arduino Development
    arduino-ide
    gcc
    gdb
    cmake

    # Engineering applications
    orca-slicer
    kicad-small
    gqrx
    # gnuradio3_8 (if needed, uncomment or remove)

    # Python Packages
    python3
    python312Packages.jupyterlab

    # Office applications
    libreoffice-qt
    hunspell
    hunspellDicts.th_TH
    rustdesk-flutter
    localsend
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;


  # Nicely reload sy[stem units when changing configs
  systemd.user.startServices = "sd-switch";

  
  home.stateVersion = "25.05";
}
