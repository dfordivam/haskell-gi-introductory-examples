{ nixpkgs ? import <nixpkgs> {} } :
let

  haskellPackages = nixpkgs.haskell.packages.ghc841.override {
    overrides = self: super: {
      ghc = super.ghc // { withPackages = super.ghc.withHoogle; };
      ghcWithPackages = self.ghc.withPackages;
      ListLike = super.callHackage "ListLike" "4.6" {};
      hoogle = super.callHackage "hoogle" "5.0.17.2" {};
      conduit = super.callHackage "conduit" "1.3.0.1" {};
      conduit-extra = super.callHackage "conduit-extra" "1.3.0"{};
      xml-conduit = super.callHackage "xml-conduit" "1.8.0"{};
      resourcet = super.callHackage "resourcet" "1.2.0" {};
      http-conduit = super.callHackage "http-conduit" "2.3.0" {};
    };
  };

  pkgs = haskellPackages;
  # pkgs = nixpkgs.haskellPackages;
  f = pkgs.callCabal2nix "introductory-examples" ./. {};
in
  f
