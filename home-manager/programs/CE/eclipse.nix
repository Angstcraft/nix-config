{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.eclipse = {
    enable = true;

    plugins = {
      default = [
        pkgs.vimPlugins.vim-sensible # Example Vim plugin
        pkgs.vimPlugins.vim-fugitive # Another example Vim plugin
        # Add more plugins as needed
      ];
    };
  };

  # Include JavaFX and other packages in home.packages
  home.packages = with pkgs; [
    openjfx # This will install JavaFX
  ];
}
