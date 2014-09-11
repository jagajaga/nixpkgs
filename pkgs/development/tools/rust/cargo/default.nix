{ stdenv, fetchgit, file, cmake, pkgconfig, rustc, wget, python }:

stdenv.mkDerivation {
  name = "cargo-b3a9dee814";

  src = fetchgit {
    url = "https://github.com/rust-lang/cargo.git";
    rev = "b3a9dee814af4846267383c800999a42b295e0d2";
    sha256 = "1hfw8329rwnppxlbm3awkq6hj9xmbf7n1dx7rh69n49habk5r8hv";
  };

  buildInputs = [ file cmake pkgconfig rustc wget python ];

  configurePhase = ''
    ./configure
  '';

  buildPhase = ''
    make
  '';

  installPhase = ''
    make install
  '';

  meta = {
    homepage = "http://cargo.io";
    description = "Cargo downloads your Rust project's dependencies and builds your project";
    license = stdenv.lib.licenses.mit;
  };
}
