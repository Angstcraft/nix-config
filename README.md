# My NixOS configurations

Here's my NixOS/home-manager config files. Requires
[Nix flakes](https://nixos.wiki/wiki/Flakes).

**Highlights**:

- Multiple **NixOS configurations**, including **laptop**, **server**, **mac
  :(**
- Flexible **Home Manager** Configs through **feature flags**
- Extensively configured wayland environments (**sway** and **hyprland**)

## About the installation

What i do when i install the system new is to clean the Hardware file and then
running the flake and then the home-manager with the user.

for Mac os please install darwin and nixos before you can start.

## How to bootstrap

All you need is nix (any version). Run:

```
nix-shell
```

If you already have nix 2.4+, git, and have already enabled `flakes` and
`nix-command`, you can also use the non-legacy command:

```
nix develop
```

`nixos-rebuild --flake .` To build system configurations

`home-manager --flake .` To build user configurations

`nix build` (or shell or run) To build and use packages

`sops` To manage secrets

## Secrets

On my desktop and laptop, I use `pass` for managing passwords, which are
encrypted using (you bet) my PGP key. This same key is also used for mail
signing, as well as for SSH'ing around.

## Tooling and applications I use

Most relevant user apps daily drivers:

    Hyprland
    Waybar
    Rofi

    Qute browser
    Nvf
    Kitty
    tmux

Nixy stuff:

- home-manager
- and NixOS and nix itself, of course :)

Let me know if you have any questions about them :)
