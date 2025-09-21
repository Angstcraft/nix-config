# Discord is a popular chat application.
{inputs, ...}: {
  imports = [inputs.nixcord.homeModules.nixcord];

  programs.nixcord = {
    enable = true;
    discord.enable = false;
    vesktop.enable = true;
    vesktop.settings = {
      SKIP_HOST_UPDATE = true;
      autoUpdateNotification = false;
      notifyAboutUpdates = false;
    };
  };
}
