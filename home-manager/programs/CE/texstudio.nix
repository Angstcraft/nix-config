{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    texstudio
    texliveFull
  ];
}
