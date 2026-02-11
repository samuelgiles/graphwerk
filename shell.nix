{ sources ? import ./nix/sources.nix }:
let
  nixpkgs = import sources.nixpkgs { };
in
nixpkgs.mkShell {
  name = "bellroy-gem-env";
  buildInputs = with nixpkgs; [
    bundler
    libnotify
    niv
    pkg-config
    readline
    ruby_4_0
    zlib
  ]
  ++ (if stdenv.hostPlatform.isDarwin then [ libiconv darwin.apple_sdk.frameworks.CoreServices ] else [ ]);
  shellHook = ''
    bundle config --local path "$PWD/vendor/bundle"
  '';
}
