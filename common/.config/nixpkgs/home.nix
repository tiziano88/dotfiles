{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "tzn";
  home.homeDirectory = "/home/tzn";

  home.packages = [
    pkgs.gh
    pkgs.hexyl
    pkgs.htop
    # pkgs.mosh
    pkgs.neovim
    pkgs.ripgrep
    pkgs.skim
    pkgs.starship
    pkgs.tmux
    pkgs.xplr
    pkgs.i3
    pkgs.sway
    pkgs.swaylock
  ];

  home.file = {
    ".vimrc" = {
      source = ../../.vimrc;
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  wayland = {
    # enable = true;
    windowManager.sway = {
      # wrapperFeatures.gtk = true;
      enable = true;
      extraConfig = builtins.readFile ../../.config/i3/config;
      config = null;
      # config1 = {
      #   # keybindings = {};
      #   fonts = {
      #     names = [ "Iosevka Term Slab" ];
      #     size = 12.0;
      #   };
      #   colors = {
      #     focused = {
      #       border = "#cc241d";
      #       background = "#cc241d";
      #       text = "#cc241d";
      #       indicator = "#cc241d";
      #       childBorder = "#cc241d";
      #     };
      #   };
      #   bars = [
      #     {
      #       statusCommand = "i3status-rs";
      #       position = "top";
      #       colors = {
      #         separator = "#98971a";
      #       };
      #     }
      #   ];
      # };
    };
  };
}
