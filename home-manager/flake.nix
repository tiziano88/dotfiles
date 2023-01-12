{
  inputs = {
    # pkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  # outputs = { config, pkgs, , ... }:
  outputs = { nixpkgs, home-manager, ... }:

  let
    theme = {
      bg = "#282828";
      red = "#cc241d";
      green = "#98971a";
      yellow = "#d79921";
      blue = "#458588";
      purple = "#b16286";
      aqua = "#689d68";
      gray = "#a89984";
      darkgray = "#1d2021";
      white = "#ffffff";
    }; 
    mode_system = "System (l) lock, (e) logout, (s) suspend, (h) hibernate, (r) reboot, (Shift+s) shutdown";
    pkgs = nixpkgs;

  in


  {
    homeConfigurations."tzn@tzn0" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
      modules = [
        /home/tzn/src/dotfiles/home-manager/home.nix
        {
          home = {
            username = "tzn";
            homeDirectory = "/home/tzn";
            stateVersion = "22.05";
          };
        }
      ];
    };
  };
}
