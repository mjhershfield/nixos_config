# sv-lang.nix
{
  stdenv,
  fetchFromGitHub,
  cmake,
  python312,
  python312Packages,
  fmt_11,
  catch2_3,
  mimalloc
}:

# with import <nixpkgs> {};

stdenv.mkDerivation rec {
  pname = "sv-lang";
  version = "7.0";

  src = fetchFromGitHub {
    owner = "MikePopoloski";
    repo = "slang";
    rev = "v${version}";
    sha256 = "sha256-msSc6jw2xbEZfOwtqwFEDIKcwf5SDKp+j15lVbNO98g=";
  };

  cmakeFlags = [
    "-DCMAKE_INSTALL_INCLUDEDIR=include"
    "-DCMAKE_INSTALL_LIBDIR=lib"
    "-DSLANG_INCLUDE_TESTS=${if doCheck then "ON" else "OFF"}"
  ];

  nativeBuildInputs = [ 
    cmake
    python312
  ];
  
  buildInputs = [ 
    python312Packages.pybind11
    fmt_11
    catch2_3
    mimalloc
  ];

  doCheck = true;
  # doCheck = !stdenv.hostPlatform.isDarwin;

#  installPhase = ''
#    runHook preInstall
#    runHook postInstall
#  '';
}
