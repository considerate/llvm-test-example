# llvm-test-example

## Building

Build in `nix`:
```bash
nix-build -A stackPackages.llvm-test-example
```

This command builds correctly.

Build in stack:
```bash
./bin/stack build
```

This command fails when building `llvm-hs`.
