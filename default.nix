{ pkgs ? import ./nixpkgs {}
}:
{ stackPackages = (import ./stack2nix.nix { inherit pkgs; }).override {
    overrides = self: super: {
      llvm-config = null;
      llvm-hs = super.llvm-hs.override {
        llvm-config = pkgs.llvm_6;
      };
    };
  };
}
