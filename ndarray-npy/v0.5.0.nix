
# This file was @generated by crate2nix 0.9.0-alpha.1 with the command:
#   "generate" "-o" "/home/jamie/Misc/cratesioout/ndarray-npy/v0.5.0.nix.tmp"
# See https://github.com/kolloch/crate2nix for more info.

{ nixpkgs ? <nixpkgs>
, pkgs ? import nixpkgs { config = {}; }
, lib ? pkgs.lib
, stdenv ? pkgs.stdenv
, buildRustCrate ? pkgs.buildRustCrate
  # This is used as the `crateOverrides` argument for `buildRustCrate`.
, defaultCrateOverrides ? pkgs.defaultCrateOverrides
  # The features to enable for the root_crate or the workspace_members.
, rootFeatures ? [ "default" ]
  # If true, throw errors instead of issueing deprecation warnings.
, strictDeprecation ? false
  # Whether to perform release builds: longer compile times, faster binaries.
, release ? true
  # Additional crate2nix configuration if it exists.
, crateConfig
  ? if builtins.pathExists ./crate-config.nix
    then pkgs.callPackage ./crate-config.nix {}
    else {}
}:

rec {
  #
  # "public" attributes that we attempt to keep stable with new versions of crate2nix.
  #

  rootCrate = rec {
    packageId = "ndarray-npy";

    # Use this attribute to refer to the derivation building your root crate package.
    # You can override the features with rootCrate.build.override { features = [ "default" "feature1" ... ]; }.
    build = internal.buildRustCrateWithFeatures {
      inherit packageId;
    };

    # Debug support which might change between releases.
    # File a bug if you depend on any for non-debug work!
    debug = internal.debugCrate { inherit packageId; };
  };
  # Refer your crate build derivation by name here.
  # You can override the features with
  # workspaceMembers."${crateName}".build.override { features = [ "default" "feature1" ... ]; }.
  workspaceMembers = {
    "ndarray-npy" = rec {
      packageId = "ndarray-npy";
      build = internal.buildRustCrateWithFeatures {
        packageId = "ndarray-npy";
      };

      # Debug support which might change between releases.
      # File a bug if you depend on any for non-debug work!
      debug = internal.debugCrate { inherit packageId; };
    };
  };

  #
  # "internal" ("private") attributes that may change in every new version of crate2nix.
  #

  internal = rec {
    # Build and dependency information for crates.
    # Many of the fields are passed one-to-one to buildRustCrate.
    #
    # Noteworthy:
    # * `dependencies`/`buildDependencies`: similar to the corresponding fields for buildRustCrate.
    #   but with additional information which is used during dependency/feature resolution.
    # * `resolvedDependencies`: the selected default features reported by cargo - only included for debugging.
    # * `devDependencies` as of now not used by `buildRustCrate` but used to
    #   inject test dependencies into the build

    crates = {
      "adler32" = rec {
        crateName = "adler32";
        version = "1.0.4";
        edition = "2015";
        sha256 = "1hnan4fgmnidgn2k84hh2i67c3wp2c5iwd5hs61yi7gwwx1p6bjx";
        authors = [
          "Remi Rampin <remirampin@gmail.com>"
        ];
        
      };
      "autocfg" = rec {
        crateName = "autocfg";
        version = "0.1.6";
        edition = "2015";
        sha256 = "0x8q946yy321rlpxhqf3mkd965x8kbjs2jwcw55dsmxlf7xwhwdn";
        authors = [
          "Josh Stone <cuviper@gmail.com>"
        ];
        
      };
      "byteorder" = rec {
        crateName = "byteorder";
        version = "1.3.2";
        edition = "2015";
        sha256 = "1xbwjlmq2ziqjmjvkqxdx1yh136xxhilxd40bky1w4d7hn4xvhx7";
        authors = [
          "Andrew Gallant <jamslam@gmail.com>"
        ];
        features = {
          "default" = [ "std" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "cfg-if" = rec {
        crateName = "cfg-if";
        version = "0.1.10";
        edition = "2018";
        sha256 = "08h80ihs74jcyp24cd75wwabygbbdgl05k6p5dmq8akbr78vv1a7";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        features = {
          "rustc-dep-of-std" = [ "core" "compiler_builtins" ];
        };
      };
      "crc32fast" = rec {
        crateName = "crc32fast";
        version = "1.2.0";
        edition = "2015";
        sha256 = "1c9dhkvf3brrzzplcijaywxi2w8wv5578i0ryhcm7x8dmzi5s4ms";
        authors = [
          "Sam Rijs <srijs@airpost.net>"
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        dependencies = [
          {
            name = "cfg-if";
            packageId = "cfg-if";
          }
        ];
        features = {
          "default" = [ "std" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "either" = rec {
        crateName = "either";
        version = "1.5.3";
        edition = "2015";
        sha256 = "1qyz1b1acad6w0k5928jw5zaq900zhsk7p8dlcp4hh61w4f6n7xv";
        authors = [
          "bluss"
        ];
        features = {
          "default" = [ "use_std" ];
        };
      };
      "flate2" = rec {
        crateName = "flate2";
        version = "1.0.12";
        edition = "2018";
        sha256 = "1lw1y5dj9xcn105l5c0w0dpgcsn1wvbj7d1ij1qwhh59r4rm4g5d";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        dependencies = [
          {
            name = "cfg-if";
            packageId = "cfg-if";
          }
          {
            name = "crc32fast";
            packageId = "crc32fast";
          }
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "miniz_oxide";
            packageId = "miniz_oxide";
            optional = true;
          }
          {
            name = "miniz_oxide";
            packageId = "miniz_oxide";
            target = { target, features }: ((target."arch" == "wasm32") && (!(target."os" == "emscripten")));
          }
        ];
        features = {
          "default" = [ "rust_backend" ];
          "rust_backend" = [ "miniz_oxide" ];
          "tokio" = [ "tokio-io" "futures" ];
          "zlib" = [ "libz-sys" ];
        };
        resolvedDefaultFeatures = [ "miniz_oxide" "rust_backend" ];
      };
      "itertools" = rec {
        crateName = "itertools";
        version = "0.8.0";
        edition = "2015";
        sha256 = "0n2k13b6w4x2x6np2lykh9bj3b3z4hwh2r4cn3z2dgnfq7cng12v";
        authors = [
          "bluss"
        ];
        dependencies = [
          {
            name = "either";
            packageId = "either";
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "default" = [ "use_std" ];
        };
      };
      "libc" = rec {
        crateName = "libc";
        version = "0.2.62";
        edition = "2015";
        sha256 = "1fh69kpjg8hqff36kdczx7sax98gk4qs4ws1dwvjz0rgip0d5z1l";
        authors = [
          "The Rust Project Developers"
        ];
        features = {
          "default" = [ "std" ];
          "rustc-dep-of-std" = [ "align" "rustc-std-workspace-core" ];
          "use_std" = [ "std" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "matrixmultiply" = rec {
        crateName = "matrixmultiply";
        version = "0.2.3";
        edition = "2015";
        sha256 = "13s7nfd3dfcsrixld2lk8c563ih5xzczl2w36hprfc016rkfrxyl";
        authors = [
          "bluss"
          "R. Janis Goldschmidt"
        ];
        dependencies = [
          {
            name = "rawpointer";
            packageId = "rawpointer";
          }
        ];
        
      };
      "miniz_oxide" = rec {
        crateName = "miniz_oxide";
        version = "0.3.3";
        edition = "2018";
        sha256 = "1bmanbbcdmssfbgik3fs323g7vljc5wkjz7s61jsbbz2kg0nckrh";
        authors = [
          "Frommi <daniil.liferenko@gmail.com>"
          "oyvindln <oyvindln@users.noreply.github.com>"
        ];
        dependencies = [
          {
            name = "adler32";
            packageId = "adler32";
          }
        ];
        
      };
      "ndarray" = rec {
        crateName = "ndarray";
        version = "0.13.0";
        edition = "2018";
        sha256 = "0yy5mi5ljmsyqa4g1xs8k0fgdcg6dhwxhyxpbwv6kwjx5zy03c15";
        authors = [
          "bluss"
          "Jim Turner"
        ];
        dependencies = [
          {
            name = "itertools";
            packageId = "itertools";
            usesDefaultFeatures = false;
          }
          {
            name = "matrixmultiply";
            packageId = "matrixmultiply";
          }
          {
            name = "num-complex";
            packageId = "num-complex";
          }
          {
            name = "num-integer";
            packageId = "num-integer";
          }
          {
            name = "num-traits";
            packageId = "num-traits";
          }
          {
            name = "rawpointer";
            packageId = "rawpointer";
          }
        ];
        devDependencies = [
          {
            name = "itertools";
            packageId = "itertools";
            usesDefaultFeatures = false;
            features = [ "use_std" ];
          }
        ];
        features = {
          "blas" = [ "cblas-sys" "blas-src" ];
          "docs" = [ "approx" "serde" "rayon" ];
          "serde-1" = [ "serde" ];
          "test" = [ "test-blas-openblas-sys" ];
          "test-blas-openblas-sys" = [ "blas" ];
        };
      };
      "ndarray-npy" = rec {
        crateName = "ndarray-npy";
        version = "0.5.0";
        edition = "2018";
        src = pkgs.callPackage ./tarball-v0.5.0.nix {};
        authors = [
          "Jim Turner <ndarray-npy@turner.link>"
        ];
        dependencies = [
          {
            name = "byteorder";
            packageId = "byteorder";
          }
          {
            name = "ndarray";
            packageId = "ndarray";
          }
          {
            name = "num-traits";
            packageId = "num-traits";
          }
          {
            name = "py_literal";
            packageId = "py_literal";
          }
          {
            name = "zip";
            packageId = "zip";
            optional = true;
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "compressed_npz" = [ "npz" "zip/deflate" ];
          "default" = [ "compressed_npz" ];
          "npz" = [ "zip" ];
        };
        resolvedDefaultFeatures = [ "compressed_npz" "default" "npz" "zip" ];
      };
      "num-bigint" = rec {
        crateName = "num-bigint";
        version = "0.2.3";
        edition = "2015";
        sha256 = "06hsaiahwbx98xbph5k9086r4hd2m2zzi6sx4v5k9wr4vm6g7hzr";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "num-integer";
            packageId = "num-integer";
            usesDefaultFeatures = false;
          }
          {
            name = "num-traits";
            packageId = "num-traits";
            usesDefaultFeatures = false;
          }
        ];
        buildDependencies = [
          {
            name = "autocfg";
            packageId = "autocfg";
          }
        ];
        features = {
          "default" = [ "std" ];
          "i128" = [ "num-integer/i128" "num-traits/i128" ];
          "std" = [ "num-integer/std" "num-traits/std" ];
        };
        resolvedDefaultFeatures = [ "std" ];
      };
      "num-complex" = rec {
        crateName = "num-complex";
        version = "0.2.3";
        edition = "2015";
        sha256 = "1z6zjdzx1g1hj4y132ddy83d3p3zvw06igbf59npxxrzzcqwzc7w";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "num-traits";
            packageId = "num-traits";
            usesDefaultFeatures = false;
          }
        ];
        buildDependencies = [
          {
            name = "autocfg";
            packageId = "autocfg";
          }
        ];
        features = {
          "default" = [ "std" ];
          "i128" = [ "num-traits/i128" ];
          "std" = [ "num-traits/std" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "num-integer" = rec {
        crateName = "num-integer";
        version = "0.1.41";
        edition = "2015";
        sha256 = "02dwjjpfbi16c71fq689s4sw3ih52cvfzr5z5gs6qpr5z0g58pmq";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "num-traits";
            packageId = "num-traits";
            usesDefaultFeatures = false;
          }
        ];
        buildDependencies = [
          {
            name = "autocfg";
            packageId = "autocfg";
          }
        ];
        features = {
          "default" = [ "std" ];
          "i128" = [ "num-traits/i128" ];
          "std" = [ "num-traits/std" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "num-traits" = rec {
        crateName = "num-traits";
        version = "0.2.8";
        edition = "2015";
        sha256 = "0clvrm34rrqc8p6gq5ps5fcgws3kgq5knh7nlqxf2ayarwks9abb";
        authors = [
          "The Rust Project Developers"
        ];
        buildDependencies = [
          {
            name = "autocfg";
            packageId = "autocfg";
          }
        ];
        features = {
          "default" = [ "std" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "pest" = rec {
        crateName = "pest";
        version = "1.0.6";
        edition = "2015";
        sha256 = "1z7fbi5yndj2drh93jn488ab8ajjnm9db2ppfky86ff3bj5mvkhg";
        authors = [
          "Dragoș Tiselice <dragostiselice@gmail.com>"
        ];
        
      };
      "pest_derive" = rec {
        crateName = "pest_derive";
        version = "1.0.8";
        edition = "2015";
        sha256 = "1r4fpzrnz6p9n4h75i9mzb7jf0pljm1615y7hjq0k4hi6zs98cna";
        procMacro = true;
        authors = [
          "Dragoș Tiselice <dragostiselice@gmail.com>"
        ];
        dependencies = [
          {
            name = "pest";
            packageId = "pest";
          }
          {
            name = "quote";
            packageId = "quote";
          }
          {
            name = "syn";
            packageId = "syn";
          }
        ];
        
      };
      "podio" = rec {
        crateName = "podio";
        version = "0.1.6";
        edition = "2015";
        sha256 = "1ga5arhwakj5rwrqzf9410zrbwnf24jd59af8kr9rgwbd6vb83vq";
        authors = [
          "Mathijs van de Nes <git@mathijs.vd-nes.nl>"
        ];
        
      };
      "py_literal" = rec {
        crateName = "py_literal";
        version = "0.2.1";
        edition = "2018";
        sha256 = "10nc7a2wxhbvs4iff2rms53j868prycsmv4p5ca4mbsd58qjb5m1";
        authors = [
          "Jim Turner <py_literal@turner.link>"
        ];
        dependencies = [
          {
            name = "num-bigint";
            packageId = "num-bigint";
            usesDefaultFeatures = false;
            features = [ "std" ];
          }
          {
            name = "num-complex";
            packageId = "num-complex";
          }
          {
            name = "num-traits";
            packageId = "num-traits";
          }
          {
            name = "pest";
            packageId = "pest";
          }
          {
            name = "pest_derive";
            packageId = "pest_derive";
          }
        ];
        
      };
      "quote" = rec {
        crateName = "quote";
        version = "0.3.15";
        edition = "2015";
        sha256 = "0yhnnix4dzsv8y4wwz4csbnqjfh73al33j35msr10py6cl5r4vks";
        authors = [
          "David Tolnay <dtolnay@gmail.com>"
        ];
        
      };
      "rawpointer" = rec {
        crateName = "rawpointer";
        version = "0.2.1";
        edition = "2015";
        sha256 = "1qy1qvj17yh957vhffnq6agq0brvylw27xgks171qrah75wmg8v0";
        authors = [
          "bluss"
        ];
        
      };
      "syn" = rec {
        crateName = "syn";
        version = "0.11.11";
        edition = "2015";
        sha256 = "1b8x8jdsmj6r9ck7n1pg371526n1q90kx6rv6ivcb22w06wr3f6k";
        authors = [
          "David Tolnay <dtolnay@gmail.com>"
        ];
        dependencies = [
          {
            name = "quote";
            packageId = "quote";
            optional = true;
          }
          {
            name = "synom";
            packageId = "synom";
            optional = true;
          }
          {
            name = "unicode-xid";
            packageId = "unicode-xid";
            optional = true;
          }
        ];
        features = {
          "default" = [ "parsing" "printing" ];
          "parsing" = [ "unicode-xid" "synom" ];
          "printing" = [ "quote" ];
        };
        resolvedDefaultFeatures = [ "default" "parsing" "printing" "quote" "synom" "unicode-xid" ];
      };
      "synom" = rec {
        crateName = "synom";
        version = "0.11.3";
        edition = "2015";
        sha256 = "1dj536sh5xxhan2h0znxhv0sl6sb7lvzmsmrc3nvl3h1v5p0d4x3";
        authors = [
          "David Tolnay <dtolnay@gmail.com>"
        ];
        dependencies = [
          {
            name = "unicode-xid";
            packageId = "unicode-xid";
          }
        ];
        
      };
      "unicode-xid" = rec {
        crateName = "unicode-xid";
        version = "0.0.4";
        edition = "2015";
        sha256 = "1p5l9h3n3i53cp95fb65p8q3vbwib79ryd9z5z5h5kr9gl6qc7wc";
        authors = [
          "erick.tryzelaar <erick.tryzelaar@gmail.com>"
          "kwantam <kwantam@gmail.com>"
        ];
        features = {
        };
        resolvedDefaultFeatures = [ "default" ];
      };
      "zip" = rec {
        crateName = "zip";
        version = "0.5.3";
        edition = "2015";
        sha256 = "1ilzgvacszn9n9in5q67983m2bxnmnivvxa7l0ixhazs190vn89w";
        authors = [
          "Mathijs van de Nes <git@mathijs.vd-nes.nl>"
        ];
        dependencies = [
          {
            name = "crc32fast";
            packageId = "crc32fast";
          }
          {
            name = "flate2";
            packageId = "flate2";
            optional = true;
            usesDefaultFeatures = false;
          }
          {
            name = "podio";
            packageId = "podio";
          }
        ];
        features = {
          "default" = [ "bzip2" "deflate" "time" ];
          "deflate" = [ "flate2/rust_backend" ];
          "deflate-miniz" = [ "flate2/default" ];
          "deflate-zlib" = [ "flate2/zlib" ];
        };
        resolvedDefaultFeatures = [ "deflate" "flate2" ];
      };
    };

    #
# crate2nix/default.nix (excerpt start)
#

  /* Target (platform) data for conditional dependencies.
     This corresponds roughly to what buildRustCrate is setting.
  */
  defaultTarget = {
    unix = true;
    windows = false;
    fuchsia = true;
    test = false;

    # This doesn't appear to be officially documented anywhere yet.
    # See https://github.com/rust-lang-nursery/rust-forge/issues/101.
    os = if stdenv.hostPlatform.isDarwin
    then "macos"
    else stdenv.hostPlatform.parsed.kernel.name;
    arch = stdenv.hostPlatform.parsed.cpu.name;
    family = "unix";
    env = "gnu";
    endian =
      if stdenv.hostPlatform.parsed.cpu.significantByte.name == "littleEndian"
      then "little" else "big";
    pointer_width = toString stdenv.hostPlatform.parsed.cpu.bits;
    vendor = stdenv.hostPlatform.parsed.vendor.name;
    debug_assertions = false;
  };

  /* Filters common temp files and build files. */
  # TODO(pkolloch): Substitute with gitignore filter
  sourceFilter = name: type:
    let
      baseName = builtins.baseNameOf (builtins.toString name);
    in
      ! (
        # Filter out git
        baseName == ".gitignore"
        || (type == "directory" && baseName == ".git")

        # Filter out build results
        || (
          type == "directory" && (
            baseName == "target"
            || baseName == "_site"
            || baseName == ".sass-cache"
            || baseName == ".jekyll-metadata"
            || baseName == "build-artifacts"
          )
        )

        # Filter out nix-build result symlinks
        || (
          type == "symlink" && lib.hasPrefix "result" baseName
        )

        # Filter out IDE config
        || (
          type == "directory" && (
            baseName == ".idea" || baseName == ".vscode"
          )
        ) || lib.hasSuffix ".iml" baseName

        # Filter out nix build files
        || baseName == "Cargo.nix"

        # Filter out editor backup / swap files.
        || lib.hasSuffix "~" baseName
        || builtins.match "^\\.sw[a-z]$$" baseName != null
        || builtins.match "^\\..*\\.sw[a-z]$$" baseName != null
        || lib.hasSuffix ".tmp" baseName
        || lib.hasSuffix ".bak" baseName
        || baseName == "tests.nix"
      );

  /* Returns a crate which depends on successful test execution
     of crate given as the second argument.

     testCrateFlags: list of flags to pass to the test exectuable
     testInputs: list of packages that should be available during test execution
  */
  crateWithTest = { crate, testCrate, testCrateFlags, testInputs }:
    assert builtins.typeOf testCrateFlags == "list";
    assert builtins.typeOf testInputs == "list";
    let
      # override the `crate` so that it will build and execute tests instead of
      # building the actual lib and bin targets We just have to pass `--test`
      # to rustc and it will do the right thing.  We execute the tests and copy
      # their log and the test executables to $out for later inspection.
      test = let
        drv = testCrate.override (
          _: {
            buildTests = true;
          }
        );
      in
        pkgs.runCommand "run-tests-${testCrate.name}" {
          inherit testCrateFlags;
          buildInputs = testInputs;
        } ''
          set -ex

          export RUST_BACKTRACE=1

          # recreate a file hierarchy as when running tests with cargo

          # the source for test data
          ${pkgs.xorg.lndir}/bin/lndir ${crate.src}

          # build outputs
          testRoot=target/debug
          mkdir -p $testRoot

          # executables of the crate
          # we copy to prevent std::env::current_exe() to resolve to a store location
          for i in ${crate}/bin/*; do
            cp "$i" "$testRoot"
          done
          chmod +w -R .

          # test harness executables are suffixed with a hash, like cargo does
          # this allows to prevent name collision with the main
          # executables of the crate
          hash=$(basename $out)
          for file in ${drv}/tests/*; do
            f=$testRoot/$(basename $file)-$hash
            cp $file $f
            $f $testCrateFlags 2>&1 | tee -a $out
          done
        '';
    in
      crate.overrideAttrs (
        old: {
          checkPhase = ''
            test -e ${test}
          '';
          passthru = (old.passthru or {}) // {
            inherit test;
          };
        }
      );

  /* A restricted overridable version of builtRustCratesWithFeatures. */
  buildRustCrateWithFeatures =
    { packageId
    , features ? rootFeatures
    , crateOverrides ? defaultCrateOverrides
    , buildRustCrateFunc ? null
    , runTests ? false
    , testCrateFlags ? []
    , testInputs ? []
    }:
      lib.makeOverridable
        (
          { features
          , crateOverrides
          , runTests
          , testCrateFlags
          , testInputs
          }:
            let
              buildRustCrateFuncOverriden = if buildRustCrateFunc != null
              then buildRustCrateFunc
              else (
                if crateOverrides == pkgs.defaultCrateOverrides
                then buildRustCrate
                else buildRustCrate.override {
                  defaultCrateOverrides = crateOverrides;
                }
              );
              builtRustCrates = builtRustCratesWithFeatures {
                inherit packageId features;
                buildRustCrateFunc = buildRustCrateFuncOverriden;
                runTests = false;
              };
              builtTestRustCrates = builtRustCratesWithFeatures {
                inherit packageId features;
                buildRustCrateFunc = buildRustCrateFuncOverriden;
                runTests = true;
              };
              drv = builtRustCrates.${packageId};
              testDrv = builtTestRustCrates.${packageId};
              derivation = if runTests then
                crateWithTest {
                  crate = drv;
                  testCrate = testDrv;
                  inherit testCrateFlags testInputs;
                }
              else drv;
            in
              derivation
        )
        { inherit features crateOverrides runTests testCrateFlags testInputs; };

  /* Returns an attr set with packageId mapped to the result of buildRustCrateFunc
     for the corresponding crate.
  */
  builtRustCratesWithFeatures =
    { packageId
    , features
    , crateConfigs ? crates
    , buildRustCrateFunc
    , runTests
    , target ? defaultTarget
    } @ args:
      assert (builtins.isAttrs crateConfigs);
      assert (builtins.isString packageId);
      assert (builtins.isList features);
      assert (builtins.isAttrs target);
      assert (builtins.isBool runTests);
      let
        rootPackageId = packageId;
        mergedFeatures = mergePackageFeatures (
          args // {
            inherit rootPackageId;
            target = target // { test = runTests; };
          }
        );

        buildByPackageId = packageId: buildByPackageIdImpl packageId;

        # Memoize built packages so that reappearing packages are only built once.
        builtByPackageId =
          lib.mapAttrs (packageId: value: buildByPackageId packageId) crateConfigs;

        buildByPackageIdImpl = packageId:
          let
            features = mergedFeatures."${packageId}" or [];
            crateConfig' = crateConfigs."${packageId}";
            crateConfig =
              builtins.removeAttrs crateConfig' [ "resolvedDefaultFeatures" "devDependencies" ];
            devDependencies =
              lib.optionals
                (runTests && packageId == rootPackageId)
                (crateConfig'.devDependencies or []);
            dependencies =
              dependencyDerivations {
                inherit builtByPackageId features target;
                dependencies =
                  (crateConfig.dependencies or [])
                  ++ devDependencies;
              };
            buildDependencies =
              dependencyDerivations {
                inherit builtByPackageId features target;
                dependencies = crateConfig.buildDependencies or [];
              };

            filterEnabledDependenciesForThis = dependencies: filterEnabledDependencies {
              inherit dependencies features target;
            };

            dependenciesWithRenames =
              lib.filter (d: d ? "rename") (
                filterEnabledDependenciesForThis
                  (
                    (crateConfig.buildDependencies or [])
                    ++ (crateConfig.dependencies or [])
                    ++ devDependencies
                  )
              );

            crateRenames =
              builtins.listToAttrs
                (map (d: { name = d.name; value = d.rename; }) dependenciesWithRenames);
          in
            buildRustCrateFunc (
              crateConfig // {
                src = crateConfig.src or (
                  pkgs.fetchurl {
                    name = "${crateConfig.crateName}-${crateConfig.version}.tar.gz";
                    # https://www.pietroalbini.org/blog/downloading-crates-io/
                    # Not rate-limited, CDN URL.
                    url = "https://static.crates.io/crates/${crateConfig.crateName}/${crateConfig.crateName}-${crateConfig.version}.crate";
                    sha256 = crateConfig.sha256;
                  }
                );
                inherit features dependencies buildDependencies crateRenames release;
              }
            );
      in
        builtByPackageId;

  /* Returns the actual derivations for the given dependencies. */
  dependencyDerivations =
    { builtByPackageId
    , features
    , dependencies
    , target
    }:
      assert (builtins.isAttrs builtByPackageId);
      assert (builtins.isList features);
      assert (builtins.isList dependencies);
      assert (builtins.isAttrs target);
      let
        enabledDependencies = filterEnabledDependencies {
          inherit dependencies features target;
        };
        depDerivation = dependency: builtByPackageId.${dependency.packageId};
      in
        map depDerivation enabledDependencies;

  /* Returns a sanitized version of val with all values substituted that cannot
     be serialized as JSON.
  */
  sanitizeForJson = val:
    if builtins.isAttrs val
    then lib.mapAttrs (n: v: sanitizeForJson v) val
    else if builtins.isList val
    then builtins.map sanitizeForJson val
    else if builtins.isFunction val
    then "function"
    else val;

  /* Returns various tools to debug a crate. */
  debugCrate = { packageId, target ? defaultTarget }:
    assert (builtins.isString packageId);
    let
      debug = rec {
        # The built tree as passed to buildRustCrate.
        buildTree = buildRustCrateWithFeatures {
          buildRustCrateFunc = lib.id;
          inherit packageId;
        };
        sanitizedBuildTree = sanitizeForJson buildTree;
        dependencyTree = sanitizeForJson (
          buildRustCrateWithFeatures {
            buildRustCrateFunc = crate: {
              "01_crateName" = crate.crateName or false;
              "02_features" = crate.features or [];
              "03_dependencies" = crate.dependencies or [];
            };
            inherit packageId;
          }
        );
        mergedPackageFeatures = mergePackageFeatures {
          features = rootFeatures;
          inherit packageId target;
        };
        diffedDefaultPackageFeatures = diffDefaultPackageFeatures {
          inherit packageId target;
        };
      };
    in
      { internal = debug; };

  /* Returns differences between cargo default features and crate2nix default
     features.

     This is useful for verifying the feature resolution in crate2nix.
  */
  diffDefaultPackageFeatures =
    { crateConfigs ? crates
    , packageId
    , target
    }:
      assert (builtins.isAttrs crateConfigs);
      let
        prefixValues = prefix: lib.mapAttrs (n: v: { "${prefix}" = v; });
        mergedFeatures =
          prefixValues
            "crate2nix"
            (mergePackageFeatures { inherit crateConfigs packageId target; features = [ "default" ]; });
        configs = prefixValues "cargo" crateConfigs;
        combined = lib.foldAttrs (a: b: a // b) {} [ mergedFeatures configs ];
        onlyInCargo =
          builtins.attrNames
            (lib.filterAttrs (n: v: !(v ? "crate2nix") && (v ? "cargo")) combined);
        onlyInCrate2Nix =
          builtins.attrNames
            (lib.filterAttrs (n: v: (v ? "crate2nix") && !(v ? "cargo")) combined);
        differentFeatures = lib.filterAttrs
          (
            n: v:
              (v ? "crate2nix")
              && (v ? "cargo")
              && (v.crate2nix.features or []) != (v."cargo".resolved_default_features or [])
          )
          combined;
      in
        builtins.toJSON {
          inherit onlyInCargo onlyInCrate2Nix differentFeatures;
        };

  /* Returns an attrset mapping packageId to the list of enabled features.

     If multiple paths to a dependency enable different features, the
     corresponding feature sets are merged. Features in rust are additive.
  */
  mergePackageFeatures =
    { crateConfigs ? crates
    , packageId
    , rootPackageId ? packageId
    , features ? rootFeatures
    , dependencyPath ? [ crates.${packageId}.crateName ]
    , featuresByPackageId ? {}
    , target
      # Adds devDependencies to the crate with rootPackageId.
    , runTests ? false
    , ...
    } @ args:
      assert (builtins.isAttrs crateConfigs);
      assert (builtins.isString packageId);
      assert (builtins.isString rootPackageId);
      assert (builtins.isList features);
      assert (builtins.isList dependencyPath);
      assert (builtins.isAttrs featuresByPackageId);
      assert (builtins.isAttrs target);
      assert (builtins.isBool runTests);
      let
        crateConfig = crateConfigs."${packageId}" or (builtins.throw "Package not found: ${packageId}");
        expandedFeatures = expandFeatures (crateConfig.features or {}) features;

        depWithResolvedFeatures = dependency:
          let
            packageId = dependency.packageId;
            features = dependencyFeatures expandedFeatures dependency;
          in
            { inherit packageId features; };

        resolveDependencies = cache: path: dependencies:
          assert (builtins.isAttrs cache);
          assert (builtins.isList dependencies);
          let
            enabledDependencies = filterEnabledDependencies {
              inherit dependencies target;
              features = expandedFeatures;
            };
            directDependencies = map depWithResolvedFeatures enabledDependencies;
            foldOverCache = op: lib.foldl op cache directDependencies;
          in
            foldOverCache
              (
                cache: { packageId, features }:
                  let
                    cacheFeatures = cache.${packageId} or [];
                    combinedFeatures = sortedUnique (cacheFeatures ++ features);
                  in
                    if cache ? ${packageId} && cache.${packageId} == combinedFeatures
                    then cache
                    else mergePackageFeatures {
                      features = combinedFeatures;
                      featuresByPackageId = cache;
                      inherit crateConfigs packageId target runTests rootPackageId;
                    }
              );

        cacheWithSelf =
          let
            cacheFeatures = featuresByPackageId.${packageId} or [];
            combinedFeatures = sortedUnique (cacheFeatures ++ expandedFeatures);
          in
            featuresByPackageId // {
              "${packageId}" = combinedFeatures;
            };

        cacheWithDependencies =
          resolveDependencies cacheWithSelf "dep" (
            crateConfig.dependencies or []
            ++ lib.optionals
              (runTests && packageId == rootPackageId)
              (crateConfig.devDependencies or [])
          );

        cacheWithAll =
          resolveDependencies
            cacheWithDependencies "build"
            (crateConfig.buildDependencies or []);
      in
        cacheWithAll;

  /* Returns the enabled dependencies given the enabled features. */
  filterEnabledDependencies = { dependencies, features, target }:
    assert (builtins.isList dependencies);
    assert (builtins.isList features);
    assert (builtins.isAttrs target);

    lib.filter
      (
        dep:
          let
            targetFunc = dep.target or (features: true);
          in
            targetFunc { inherit features target; }
            && (
              !(dep.optional or false)
              || builtins.any (doesFeatureEnableDependency dep) features
            )
      )
      dependencies;

  /* Returns whether the given feature should enable the given dependency. */
  doesFeatureEnableDependency = { name, rename ? null, ... }: feature:
    let
      prefix = "${name}/";
      len = builtins.stringLength prefix;
      startsWithPrefix = builtins.substring 0 len feature == prefix;
    in
      (rename == null && feature == name)
      || (rename != null && rename == feature)
      || startsWithPrefix;

  /* Returns the expanded features for the given inputFeatures by applying the
     rules in featureMap.

     featureMap is an attribute set which maps feature names to lists of further
     feature names to enable in case this feature is selected.
  */
  expandFeatures = featureMap: inputFeatures:
    assert (builtins.isAttrs featureMap);
    assert (builtins.isList inputFeatures);
    let
      expandFeature = feature:
        assert (builtins.isString feature);
        [ feature ] ++ (expandFeatures featureMap (featureMap."${feature}" or []));
      outFeatures = lib.concatMap expandFeature inputFeatures;
    in
      sortedUnique outFeatures;

  /*
     Returns the actual features for the given dependency.

     features: The features of the crate that refers this dependency.
  */
  dependencyFeatures = features: dependency:
    assert (builtins.isList features);
    assert (builtins.isAttrs dependency);
    let
      defaultOrNil = if dependency.usesDefaultFeatures or true
      then [ "default" ]
      else [];
      explicitFeatures = dependency.features or [];
      additionalDependencyFeatures =
        let
          dependencyPrefix = (dependency.rename or dependency.name) + "/";
          dependencyFeatures =
            builtins.filter (f: lib.hasPrefix dependencyPrefix f) features;
        in
          builtins.map (lib.removePrefix dependencyPrefix) dependencyFeatures;
    in
      defaultOrNil ++ explicitFeatures ++ additionalDependencyFeatures;

  /* Sorts and removes duplicates from a list of strings. */
  sortedUnique = features:
    assert (builtins.isList features);
    assert (builtins.all builtins.isString features);
    let
      outFeaturesSet = lib.foldl (set: feature: set // { "${feature}" = 1; }) {} features;
      outFeaturesUnique = builtins.attrNames outFeaturesSet;
    in
      builtins.sort (a: b: a < b) outFeaturesUnique;

  deprecationWarning = message: value:
    if strictDeprecation
    then builtins.throw "strictDeprecation enabled, aborting: ${message}"
    else builtins.trace message value;

  #
  # crate2nix/default.nix (excerpt end)
  #

  };
}
