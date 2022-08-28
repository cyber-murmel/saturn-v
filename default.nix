{ pkgs ? import
    (builtins.fetchGit {
      name = "nixos-22.05-2022_08_27";
      url = "https://github.com/nixos/nixpkgs/";
      ref = "refs/heads/nixos-22.05";
      rev = "f11e12ac6af528c1ba12426ce83cee26f21ceafd";
    })
    { }
}:

pkgs.stdenv.mkDerivation {
  name = "saturn-v";
  buildInputs = import ./packages.nix { inherit pkgs; };
  src = ./.;
  installPhase = ''
    mkdir -p $out
    cp bootloader.{bin,elf,hex} $out
  '';
  dontFixup = true;
}
