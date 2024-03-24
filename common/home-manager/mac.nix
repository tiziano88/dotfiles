{ config, pkgs, ... }:

let
  # linux = import /Users/tzn/src/dotfiles/common/.config/nixpkgs/home.nix;
  theme = {
    bg = "#282828";
    fg = "#ebdbb2";

    red = "#cc241d";
    green = "#98971a";
    yellow = "#d79921";
    blue = "#458588";
    purple = "#b16286";
    aqua = "#689d68";
    orange = "#fe8019";

    bright_red = "#fb4934";
    bright_green = "#b8bb26";
    bright_yellow = "#fabd2f";
    bright_blue = "#83a598";
    bright_purple = "#d3869b";
    bright_aqua = "#8ec07c";
    bright_orange = "#fe8019";

    gray = "#a89984";

    darkgray = "#1d2021";

    light1 = "#ebdbb2";
    light2 = "#d5c4a1";
    light3 = "#bdae93";
    light4 = "#a89984";

    white = "#ffffff";
    black = "#000000";
  }; 
in
{
  imports = [ ./common.nix ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tzn";
  home.homeDirectory = "/Users/tzn";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  programs.home-manager.enable = true;
}
