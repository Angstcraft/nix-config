{ config, pkgs, ... }:

let
  javafxJdk = pkgs.jdk21.override { enableJavaFX = true; };
in {
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    jetbrains.idea-community-src
    javafxJdk
    javaPackages.openjfx21
    libGL
  ];

  # Copy your ICE.xml Java formatting config into IntelliJ’s config dir
  home.file = {
    ".config/JetBrains/IdeaIC/config/ICE.xml".source = ./ICE.xml;
  };

  # Attempt to auto-install IdeaVim via Nix (may not work consistently)
  nixpkgs.config.jetbrains.plugins = {
      ideaIC = with pkgs; [
        ideaVim
        Nord
    ];
  };
}
