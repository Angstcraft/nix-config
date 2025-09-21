#orca-slicer is a open source software for slicing stls.
{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    orca-slicer
  ];
}
