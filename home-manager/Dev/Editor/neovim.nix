{ config, pkgs, ... }:{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    withNodeJs = true;
    extraConfig = ''
      set relativenumber
      set tabstop=4
      set shiftwidth=2
      set nowrap
    '';

    plugins = with pkgs.vimPlugins; [
      # UI
      nvim-web-devicons
      nvim-cursorline
      cinnamon-nvim
      fidget-nvim
     # highlight-undo
      indent-blankline-nvim
      rainbow-delimiters-nvim

      # Statusline
      lualine-nvim

      # Treesitter
      nvim-treesitter.withAllGrammars

      # Git
      gitsigns-nvim
      vim-fugitive

      # LSP + Completion
      nvim-lspconfig
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp
      luasnip
      cmp_luasnip

      # Telescope
      telescope-nvim
      telescope-fzf-native-nvim

      # Filetree
      neo-tree-nvim

      # Dashboard
      dashboard-nvim

      # Notify
      nvim-notify

      # Markdown preview
      markdown-preview-nvim

      # Commenting
      comment-nvim

      # Autopairs
      nvim-autopairs

      # Surround, motions
      nvim-surround
      hop-nvim
      leap-nvim

      # Colorizer
      nvim-colorizer-lua

      # Which-key
      which-key-nvim

      # Diffview
      diffview-nvim

      # Project manager
      project-nvim

      # Noice + UI
      noice-nvim
    ];

    extraLuaConfig = ''
      -- Line numbers
      vim.opt.relativenumber = true
      vim.opt.number = true
      vim.opt.tabstop = 4
      vim.opt.shiftwidth = 2
      vim.opt.wrap = false

      -- Keymaps
      vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
      vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
      vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
      vim.keymap.set("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fe", "<cmd>Neotree toggle<cr>", { desc = "Toggle file browser" })

      vim.keymap.set("i", "<C-h>", "<Left>")
      vim.keymap.set("i", "<C-j>", "<Down>")
      vim.keymap.set("i", "<C-k>", "<Up>")
      vim.keymap.set("i", "<C-l>", "<Right>")

      -- Clipboard
      vim.opt.clipboard = "unnamedplus"

      -- Diagnostics UI
      vim.diagnostic.config({
        virtual_lines = true,
        underline = true,
      })
    '';
  };

  # Optional dependencies for plugins
  home.packages = with pkgs; [
    ripgrep
    fd
    wl-clipboard
    xsel
    nodejs
    prettierd
    clang
    zig
    python3
    rustc
    cargo
    stylua
    typst
  ];
}
