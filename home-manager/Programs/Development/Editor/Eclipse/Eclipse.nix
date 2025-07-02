{ config, pkgs, ... }:

let
  jdk = pkgs.jdk24;
  javafx = pkgs.openjfx24;
  eclipseCustom = pkgs.eclipses.eclipseWithPlugins {
    eclipse = pkgs.eclipses.eclipse-java;
    jvmArgs = [
      "-Xmx2G"
      "-vm"
      "${jdk}/bin/java"
    ];
    plugins = with pkgs.eclipses.plugins;
     [
     # vrapper  # Vim keybindings
    ];
  };
in
{
  programs.home-manager.enable = true;

  home.packages = [
    jdk
    javafx
    eclipseCustom
  ];

  programs.eclipse = {
    enable = true;
    package = eclipseCustom;
  };

  home.sessionVariables = {
    JAVA_HOME = "${jdk}/lib/openjdk";
    JAVAFX_HOME = "${javafx}";
    PATH = "${jdk}/bin:${javafx}/bin:$PATH";
  };
}
