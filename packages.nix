{ pkgs, ... }:

with pkgs;[
  (python3.withPackages(ps: with ps; [
    pyusb
    pyvcd
  ]))
  gcc-arm-embedded-9
  dfu-util
]

