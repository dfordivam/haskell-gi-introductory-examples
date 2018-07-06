{ nixpkgs ? import <nixpkgs> {} } :
let

  haskellPackages = nixpkgs.haskell.packages.ghc841.override {
    overrides = self: super: {
      ghc = super.ghc // { withPackages = super.ghc.withHoogle; };
      ghcWithPackages = self.ghc.withPackages;
      ListLike = super.callHackage "ListLike" "4.6" {};
    };
  };

  pkgs = haskellPackages;
  # pkgs = nixpkgs.haskellPackages;
  f = pkgs.callCabal2nix "introductory-examples" ./. {};
in
  f
