{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    arduino-ide
    tonelib-gfx
  ];
}
