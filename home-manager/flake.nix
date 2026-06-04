{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/4569dc98fc9ad51e60880069b0fa3ba1149c25a8";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl = {
      url = "github:guibou/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    starship-jj = {
      url = "gitlab:lanastara_foss/starship-jj";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    jj-starship = {
      url = "github:dmmulroy/jj-starship";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { nixgl, nixpkgs, home-manager, jj-starship, starship-jj, ... }:
    let
      system = "aarch64-darwin"; # Change to x86_64-darwin for Intel Macs
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          jj-starship.overlays.default
          starship-jj.overlays.default
          # Workaround: highlight 4.20 has a patch already applied upstream.
          # Remove it so the build doesn't fail with "Reversed patch detected".
          (final: prev: {
            highlight = prev.highlight.overrideAttrs (old: {
              patches = builtins.filter
                (p: builtins.match ".*shellscript-crash-fix.*" (toString p) == null)
                (old.patches or []);
            });
          })
        ];
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
