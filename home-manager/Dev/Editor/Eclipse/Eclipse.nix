{ config, lib, pkgs, ... }:

let
  inherit (lib) mkIf mkOption types;

  cfg = config.programs.eclipse;

in {
  meta.maintainers = [ lib.maintainers.rycee ];

  options = {
    programs.eclipse = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable Eclipse.";
      };

      package = mkPackageOption pkgs "eclipse" {
        default = [
          "eclipses"
          "eclipse-platform"
        ];
        example = "pkgs.eclipses.eclipse-java";
      };

      enableLombok = mkOption {
        type = types.bool;
        default = false;
        example = true;
        description = ''
          Whether to enable the Lombok Java Agent in Eclipse. This is
          necessary to use Lombok annotations.
        '';
      };

      jvmArgs = mkOption {
        type = types.listOf types.str;
        default = [ ];
        description = "JVM arguments to use for the Eclipse process.";
      };

      plugins = mkOption {
        type = types.listOf types.package;
        default = [ ];
        description = "Plugins that should be added to Eclipse.";
      };
    };
  };


}
