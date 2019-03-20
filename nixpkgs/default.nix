let
  src = builtins.fetchTarball {
    # nixpkgs-19.03 as of 2019/03/11.
    url = "https://github.com/NixOS/nixpkgs/archive/50876481a0127ad885fcbfd48ab24bbacbc26395.tar.gz";
    sha256 = "063q2jhi9lf6azbhlrn3cygpaa3n65n3d8g7c1s0vvsj8rxv8b80";
  };
in
import src
