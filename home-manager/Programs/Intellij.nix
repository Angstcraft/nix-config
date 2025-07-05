{ config, pkgs, lib, ... }:

let
  # List of bundled plugins to install
  ideaPlugins = [
    "IdeaVim"            # Vim-emulation
    "JavaFX"             # JavaFX support
    "org.jetbrains.kotlin" # for Android/Kotlin development
    "ADB Idea"           # Android Studio convenience plugin
    "Key Promoter X"     # hotkey helper
    "Rainbow Brackets"   # bracket coloring
  ];
in {
  home.packages = with pkgs; [
    idea-community  # IntelliJ IDEA Community Edition
    jetbrains.plugins.addPlugins pkgs.jetbrains.idea-community ideaPlugins
  ];

  programs.idea-community = {
    enable = true;
    ide = pkgs.idea-community;

    # Optional: pass VM options or environment variables
    jvmOpts = [
      "-Xms512m"
      "-Xmx2g"
    ];

    # If needed, point to Android SDK or JAVA_TOOL_OPTIONS
    environment = {
      ANDROID_SDK_ROOT = "/opt/android-sdk";
    };
  };

  # Use IdeaVim silently (no extra Nix config needed)
}
