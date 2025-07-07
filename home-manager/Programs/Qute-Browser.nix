{
  config,
  lib,
  pkgs,
  ...
}: let
  qutePkg = pkgs.qutebrowser;
in {
  programs.qutebrowser = {
    enable = true;
    package = qutePkg;
    loadAutoconfig = true;

    settings = {
      colors.webpage.darkmode.enabled = true;
      colors.webpage.darkmode.algorithm = "lightness-cielab";
      colors.webpage.darkmode.policy.images = "never";
      colors.webpage.bg = "#000000";

      tabs.show = "multiple";
      content.cookies.accept = "all";
      auto_save.session = true;
      fonts.web.size.default = 12;
      content.webgl = false;
      content.canvas_reading = false;
      content.geolocation = false;
      content.webrtc_ip_handling_policy = "default-public-interface-only";
      content.cookies.store = true;
      content.blocking.enabled = true;
    };

    searchEngines = {
      DEFAULT = "https://duckduckgo.com/?q={}";
      "!aw" = "https://wiki.archlinux.org/?search={}";
      "!apkg" = "https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=";
      "!gh" = "https://github.com/search?o=desc&q={}&s=stars";
      "!yt" = "https://www.youtube.com/results?search_query={}";
    };

    extraConfig = lib.concatStringsSep "\n" [
      ''
        c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 9, 'right': 9}
        c.tabs.indicator.width = 0
        c.tabs.width = '7%'
        c.tabs.title.format = "{audio}{current_title}"
        c.fonts.default_family = []
        c.fonts.default_size = '12pt'
        c.fonts.web.family.fixed = 'monospace'
        c.fonts.web.family.sans_serif = 'monospace'
        c.fonts.web.family.serif = 'monospace'
        c.fonts.web.family.standard = 'monospace'

        config.bind('=', 'cmd-set-text -s :open')
        config.bind('h', 'history')
        config.bind('cs', 'cmd-set-text -s :config-source')
        config.bind('tH', 'config-cycle tabs.show multiple never')
        config.bind('sH', 'config-cycle statusbar.show always never')
        config.bind('T', 'hint links tab')
        config.bind('pP', 'open -- {primary}')
        config.bind('pp', 'open -- {clipboard}')
        config.bind('pt', 'open -t -- {clipboard}')
        config.bind('qm', 'macro-record')
        config.bind('<ctrl-y>', 'spawn --userscript ytdl.sh')
        config.bind('tT', 'config-cycle tabs.position top left')
        config.bind('gJ', 'tab-move +')
        config.bind('gK', 'tab-move -')
        config.bind('gm', 'tab-move')
        config.set('colors.webpage.darkmode.enabled', False, 'file://*')
      ''
    ];
  };

  home.packages = [qutePkg];
}
