{ config, lib, pkgs, ... }:

with lib;

let
  # Java formatter CLI
  javaFormatterWrapper = pkgs.writeShellScriptBin "eclipse-javafmt" ''
    exec ${pkgs.eclipses.eclipse-java}/bin/eclipse \
      -noSplash \
      -application org.eclipse.jdt.core.JavaCodeFormatter "$@"
  '';
in {
  disabledModules = [ "programs/eclipse.nix" ];

  config = {
    home.packages = [
      (pkgs.eclipses.eclipseWithPlugins {
        eclipse = pkgs.eclipses.eclipse-java;
        jvmArgs = [
          "-vm" "${pkgs.openjdk21}/bin/java"
          "-configuration" "${config.home.homeDirectory}/.eclipse/config-4.35"
          "-Xms1G" "-Xmx3G" "-XX:+UseG1GC"
          "-javaagent:${pkgs.lombok}/share/java/lombok.jar"
        ];
        plugins = with pkgs.eclipses.plugins; [ cdt eclemma ];
      })
    #  pkgs.javafx
      pkgs.umlet
      pkgs.lombok
      pkgs.gcc
      pkgs.gdb
      pkgs.cmake
     # pkgs.arm-none-eabi-gcc
     # pkgs.arm-none-eabi-newlib
     # javaFormatterWrapper
    ];
  };
}
