{ config, pkgs, ... }:

let
  nvim = pkgs.neovim;
  rustAnalyzer = pkgs.rust-analyzer;
#  jdtls = pkgs.eclipse.jdt.ls;
  ccls = pkgs.ccls;
  vimtex = pkgs.vimPlugins.vimtex;

  # Fetch NVChad repository
  nvchad = pkgs.fetchFromGitHub {
    owner = "NvChad";
    repo = "nvchad";
    rev = "v0.3.0"; # Make sure to specify the desired version
    sha256 = "put_sha256_here"; # Replace with actual SHA256
  };

  # Fetch Catppuccin theme repository
  catppuccin = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "nvim";
    rev = "main"; # or another version
    sha256 = "put_sha256_here"; # Replace with actual SHA256
  };

in

{
  environment.systemPackages = [
    nvim
    rustAnalyzer
#    jdtls
    ccls
#    latexmk
    vimtex
    

  ];

  # Setup Neovim configuration directories
  # Create the configuration directory for Neovim
  environment.etc."config/nvim".text = ''
    local pack_path = vim.fn.stdpath('data')..'/site;/usr/share/nvim/site'
    vim.o.packpath = pack_path

    -- Load NVChad
    require('nvchad')

    -- Add further configuration or plugins here as needed
  '';
}
