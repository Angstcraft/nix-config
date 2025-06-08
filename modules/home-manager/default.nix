{
  fastfetch = import ./fastfetch.nix;
  neovim = import ./neovim.nix;
  yazi = import ./yazi.nix;
  zsh = import ./zsh.nix;
  nushell = import ./nushell.nix;
  streamrip = import ./streamrip.nix;
  spotify-player = import ./spotify-player.nix;
  btop = import ./btop.nix;

  # Neue Einträge:
  amfora = import ./amfora.nix;
  bash = import ./bash.nix;
  bashrc-personal = import ./bashrc-personal.nix;
  bat = import ./bat.nix;
  cava = import ./cava.nix;
  emoji = import ./emoji.nix;
  gh = import ./gh.nix;
  ghostty = import ./ghostty.nix;
  git = import ./git.nix;
  gtk = import ./gtk.nix;
  htop = import ./htop.nix;
  hyprland = import ./hyprland.nix;
  kitty = import ./kitty.nix;
  nvf = import ./nvf.nix;
  rofi = import ./rofi.nix;
  starship = import ./starship.nix;
  stylix = import ./stylix.nix;
  swappy = import ./swappy.nix;
  swaync = import ./swaync.nix;
  virtmanager = import ./virtmanager.nix;
  waybarChoice = import ./waybarChoice.nix;
  wezterm = import ./wezterm.nix;
  wlogout = import ./wlogout.nix;
  xdg = import ./xdg.nix;
  zoxide = import ./zoxide.nix;

  # Falls du noch weitere brauchst, kannst du sie so hinzufügen.
}