{
  lib,
  fetchFromGitHub,
  rustPlatform,
  clang,
  libclang,
  pkg-config,
  openssl,
  sv-lang,
  verible,
  verilator
}:

rustPlatform.buildRustPackage rec {
  pname = "veridian";
  version = "0-unstable-2024-12-25";

  src = fetchFromGitHub {
    owner = "vivekmalneedi";
    repo = pname;
    rev = "d094c9d2fa9745b2c4430eef052478c64d5dd3b6";
    hash = "sha256-3KjUunXTqdesvgDSeQMoXL0LRGsGQXZJGDt+xLWGovM=";
  };

  # cargoHash = lib.fakeHash;
  cargoHash = "sha256-EIET2RCwCC8LLaBU2LFitVItRY35WK2TJwhJFiCvSYA=";

  buildNoDefaultFeatures = true;
  buildFeatures = [ "slang" ];

  LIBCLANG_PATH = "${libclang.lib}/lib";
  SLANG_INSTALL_PATH = "${sv-lang}";
  
  nativeBuildInputs = [
    clang
    pkg-config
    sv-lang
    sv-lang.nativeBuildInputs
    verible
    verilator
  ];

  buildInputs = [
    libclang
    openssl
    sv-lang.buildInputs
  ];

  # need to patch veridian/veridian-slang/build.rs to link to mimalloc
  # looks like we should do a git diff
  # add println!("cargo:rustc-link-lib=mimalloc"); below line 105
  patches = [ ./link_mimalloc.patch ];
}
