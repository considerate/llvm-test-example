# This derivation is specificed in ../stack.yaml.  It is used by `stack` to
# create an environment in build our Haskell packages.
#
# By default, `stack` will re-exec itself in a nix-shell built with this
# derivation.
#
# This derivation specifies all the system dependencies for our Haskell
# packages, including things like caffe2 and llvm.
#
# This derivation is not used if you run `nix-build` in the top-level
# directory.  It is only used if you build Alderaan with `stack`.

{ cudaSupport ? false
, pkgs ? import ./nixpkgs {}
, ghc ? pkgs.haskell.compiler.ghc863 # Default usually provided by stack
}:

with pkgs;

pkgs.haskell.lib.buildStackProject {
  name = "Test-Build";
  inherit ghc;
  LANG = "en_US.UTF-8";
  LD_LIBRARY_PATH = ["/nix/var/nix/lib/"];
  buildInputs = [
    ghc
    git
    libffi
    llvm_6
    pkgconfig
    protobuf
    stack2nix
  ]
  ++ lib.optional cudaSupport cudatoolkit
  ;
}
