let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};
in
pkgs.haskellPackages.developPackage {
  root = ./.;
  modifier = drv:
    pkgs.haskell.lib.addBuildTools drv (with pkgs.haskellPackages;
      [ cabal-install
        haskell-language-server
        hlint
        fourmolu
        ghcid
        zlib
      ]);
}
