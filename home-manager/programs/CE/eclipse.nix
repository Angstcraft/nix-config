{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    eclipse.eclipse-java
  ];
}
