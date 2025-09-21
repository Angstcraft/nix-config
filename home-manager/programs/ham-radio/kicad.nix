#kicad is a open source electrical circuit software.
{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    kicad-small
  ];
}
