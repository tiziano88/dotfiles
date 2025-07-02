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
      system = "aarch64-darwin"; # Change to x86_64-darwin for Intel Macs
      pkgs = import nixpkgs {
        inherit system;
        # overlays = [ nixgl.overlay ];
      };
    in
    {
      homeConfigurations."tzn" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        modules = [
          ../common/home-manager/mac.nix
        ];
      };
    };
}
