# nix-env -i all

{
  packageOverrides = pkgs_: with pkgs_; {
    all = with pkgs; buildEnv {
      name = "all";
      paths = [
        tmux
        zsh

        haskell.compiler.ghc7102
        cabal-install
      ];
    };
  };
}
