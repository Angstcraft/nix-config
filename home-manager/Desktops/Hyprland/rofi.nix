{
  config,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    cycle = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
      (rofi-calc.override {
        rofi-unwrapped = rofi-wayland-unwrapped;
      })
      rofi-emoji-wayland
    ];
    extraConfig = {
      modi = "drun,calc,window,emoji,run";
      sidebar-mode = true;
      terminal = "footclient";
      show-icons = true;
      kb-remove-char-back = "BackSpace";
      kb-accept-entry = "Control+m,Return,KP_Enter";
      kb-mode-next = "Control+l";
      kb-mode-previous = "Control+h";
      kb-row-up = "Control+k,Up";
      kb-row-down = "Control+j,Down";
      kb-row-left = "Control+u";
      kb-row-right = "Control+d";
      kb-delete-entry = "Control+semicolon";
      kb-remove-char-forward = "";
      kb-remove-to-sol = "";
      kb-remove-to-eol = "";
      kb-mode-complete = "";
      display-drun = "";
      display-run = "";
      display-emoji = "󰞅";
      display-calc = "󰃬";
      display-window = "";
      display-filebrowser = "";
      drun-display-format = "{name} [<span weight='light' size='small'><i>({generic})</i></span>]";
      window-format = "{w} · {c} · {t}";
    };
    theme = {
      "*" = {
        font = "JetBrainsMono Nerd Font 12";
        background = "#1e1e2e"; # Dark background
        border = "#313244"; # Dark border
        foreground = "#cdd6f4"; # Light foreground text
        foreground-alt = "#45475a"; # Secondary light color
        selected = "#94e2d5"; # Selected item color (light cyan)
        active = "#a6e3a1"; # Active item color (light green)
        urgent = "#89b4fa"; # Urgent item color (light blue)
      };
      "window" = {
        transparency = "real";
        location = "center";
        anchor = "center";
        fullscreen = "false";
        width = "900px";
        x-offset = "0px";
        y-offset = "0px";
        enabled = "true";
        border-radius = "10px";
        border = "2px solid";
        border-color = "#313244"; # Dark border color
        cursor = "default";
        background-color = "#1e1e2e"; # Dark background
      };
      "mainbox" = {
        enabled = true;
        spacing = "0px";
        margin = "0px";
        padding = "0px";
        border = "0px solid";
        border-radius = "0px 0px 0px 0px";
        border-color = "#313244";
        background-color = "transparent";
        children = "[inputbar, message, listview]";
      };
      "inputbar" = {
        enabled = true;
        spacing = "0px";
        margin = "0px";
        padding = "0px";
        border = "0px 0px 2px 0px";
        border-radius = "0px";
        border-color = "#313244";
        background-color = "transparent";
        text-color = "#cdd6f4"; # Foreground color for text
        children = "[prompt, entry]";
      };
      "prompt" = {
        enabled = true;
        padding = "15px";
        border = "0px 2px 0px 0px";
        border-radius = "0px";
        border-color = "#45475a"; # Alt background
        background-color = "inherit";
        text-color = "inherit";
      };
      "entry" = {
        enabled = true;
        padding = "15px";
        background-color = "inherit";
        text-color = "inherit";
        cursor = "text";
        placeholder-color = "inherit";
      };
      "button" = {
        padding = "10px";
        border-radius = "0px";
        border = "0px solid";
        border-color = "#313244";
        background-color = "transparent";
        text-color = "inherit";
        cursor = "pointer";
      };
      "button selected" = {
        background-color = "#94e2d5"; # Selected item background
        text-color = "#cdd6f4"; # Foreground color
      };
      "listview" = {
        enabled = true;
        columns = 1;
        lines = 12;
        cycle = true;
        dynamic = true;
        scrollbar = false;
        layout = "vertical";
        reverse = false;
        fixed-height = true;
        fixed-columns = true;
        spacing = "0px";
        margin = "0px";
        padding = "0px";
        border = "0px solid";
        border-radius = "0px";
        border-color = "#313244";
        background-color = "transparent";
        text-color = "#cdd6f4"; # Foreground color
        cursor = "default";
      };
      "element" = {
        enabled = true;
        spacing = "10px";
        margin = "0px";
        padding = "8px 15px";
        border = "0px 0px 0px 0px";
        border-radius = "0px";
        border-color = "#313244";
        background-color = "transparent";
        text-color = "#cdd6f4"; # Foreground color
        cursor = "pointer";
      };
      "element normal.normal" = {
        background-color = "inherit";
        text-color = "inherit";
      };
      "element selected.normal" = {
        background-color = "#94e2d5"; # Selected item color
        text-color = "#1e1e2e"; # Dark background for selected item
      };
    };
  };
  xdg.dataFile."rofi/themes/preview.rasi".text = ''
    @theme "custom"
    icon-current-entry {
      enabled: true;
      size: 50%;
      dynamic: true;
      padding: 10px;
      background-color: inherit;
    }
    listview-split {
      background-color: transparent;
      border-radius: 0px;
      cycle: true;
      dynamic : true;
      orientation: horizontal;
      border: 0px solid;
      children: [listview, icon-current-entry];
    }
    listview {
      lines: 10;
    }
    mainbox {
      children: [inputbar, listview-split];
    }
  '';
}
