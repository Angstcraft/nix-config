{config, pkgs, ... }:
{
  home.packages = with pkgs;
  [
      arduino-ide
  ];
}
