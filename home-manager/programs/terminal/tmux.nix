# Tmux is a terminal multiplexer that allows you to run multiple terminal sessions in a single window.
{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";
    prefix = "C";
    terminal = "kitty";
    keyMode = "vi";

    extraConfig = ''
        set-option -g status-position top

        #set -g default-terminal "screen-256color"
        set-option -g history-limit 5000
        unbind %
        unbind '"'

        bind-key h select-pane -L
        bind-key j select-pane -D
        bind-key k select-pane -U
        bind-key l select-pane -R

        set -gq allow-passthrough on
        bind-key x kill-pane # skip "kill-pane 1? (y/n)" prompt

        bind-key -n C-Tab next-window
        bind-key -n C-S-Tab previous-window
        bind-key -n M-Tab new-window


      # Start windows and panes index at 1, not 0.
      set -g base-index 1
      setw -g pane-base-index 1


      bind-key "|" split-window -h -c "#{pane_current_path}"
      bind-key "\\" split-window -fh -c "#{pane_current_path}"

      bind-key "-" split-window -v -c "#{pane_current_path}"
      bind-key "_" split-window -fv -c "#{pane_current_path}"

      bind -r C-j resize-pane -D 15
      bind -r C-k resize-pane -U 15
      bind -r C-h resize-pane -L 15
      bind -r C-l resize-pane -R 15

      # 'c' to new window
      bind-key  c new-window

      # 'n' next  window
      bind-key  n next-window

      # 'p' next  previous
      bind-key  n previous-window

      bind -r m resize-pane -Z

      bind-key  t clock-mode
      bind-key  q display-panes
      bind-key  u refresh-client
      bind-key  o select-pane -t :.+

    '';

    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.sensible
      tmuxPlugins.tokyo-night-tmux
    ];
  };
}
