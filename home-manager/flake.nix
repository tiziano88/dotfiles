{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixgl.url = "github:guibou/nixGL";
  };
  outputs =
    { nixgl, nixpkgs, home-manager, ... }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ nixgl.overlay ];
      };
    in
    {
      homeConfigurations."tzn@tzn0" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        modules = [
          /home/tzn/src/dotfiles/common/.config/nixpkgs/home.nix
        ];
      };
    };
}
