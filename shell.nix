{ nixpkgs ? import <nixpkgs>  {} } : 
let
  # import /home/divam/nobup/nixpkgs
  inherit (nixpkgs) pkgs;
  drv = import ./. {inherit nixpkgs;};
in
  if pkgs.lib.inNixShell then drv.env else drv
