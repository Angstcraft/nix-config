{ config, pkgs, ... }:

let
  # Pfad zu deinen XML-Dateien und Skripten für Mixxx
  mixxxMappingPath = "./MixxxControllerMappings";  # Hier den Pfad zum Ordner mit deinen Mappings und Scripts anpassen
in {

  # Mixxx über home.packages installieren
  home.packages = [
    pkgs.mixxx  # Installiert Mixxx im Benutzerprofil

  ];


}
