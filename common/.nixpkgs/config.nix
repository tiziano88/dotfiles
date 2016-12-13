# nix-env -i all

{
  packageOverrides = pkgs_: with pkgs_; {
    all = with pkgs; buildEnv {
      name = "all";
      paths = [
        #elmPackages.elm-compiler
        #elmPackages.elm-package
        #elmPackages.elm-make
        #elmPackages.elm-reactor
        #elmPackages.elm-repl

        go
        go2nix

        tmux
        zsh

        haskell.compiler.ghc7102
        cabal-install
      ];
    };
  };
}
