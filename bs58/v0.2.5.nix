
# This file was @generated by crate2nix 0.9.0-alpha.1 with the command:
#   "generate" "-o" "/home/jamie/Misc/cratesioout/bs58/v0.2.5.nix.tmp"
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
    packageId = "bs58";

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
    "bs58" = rec {
      packageId = "bs58";
      build = internal.buildRustCrateWithFeatures {
        packageId = "bs58";
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
      "assert_matches" = rec {
        crateName = "assert_matches";
        version = "1.3.0";
        edition = "2015";
        sha256 = "1rar61v00gz2aniid0mylxcr4q98s6l77c3hvbszmg57kj10msvx";
        authors = [
          "Murarth <murarth@gmail.com>"
        ];
        
      };
      "autocfg" = rec {
        crateName = "autocfg";
        version = "0.1.5";
        edition = "2015";
        sha256 = "0asl6fnc35yk5l2rxwhp25v128jgm45dp754h9z8x51b6n90w4r2";
        authors = [
          "Josh Stone <cuviper@gmail.com>"
        ];
        
      };
      "base58" = rec {
        crateName = "base58";
        version = "0.1.0";
        edition = "2015";
        sha256 = "10xfw6v7jzn9i682mkw9nqybzafrvl3i2wawwgp5a8gh2n0fw92h";
        authors = [
          "debris <marek.kotewicz@gmail.com>"
        ];
        
      };
      "block-buffer" = rec {
        crateName = "block-buffer";
        version = "0.7.3";
        edition = "2015";
        sha256 = "12v8wizynqin0hqf140kmp9s38q223mp1b0hkqk8j5pk8720v560";
        authors = [
          "RustCrypto Developers"
        ];
        dependencies = [
          {
            name = "block-padding";
            packageId = "block-padding";
          }
          {
            name = "byte-tools";
            packageId = "byte-tools";
          }
          {
            name = "byteorder";
            packageId = "byteorder";
            usesDefaultFeatures = false;
          }
          {
            name = "generic-array";
            packageId = "generic-array";
          }
        ];
        
      };
      "block-padding" = rec {
        crateName = "block-padding";
        version = "0.1.4";
        edition = "2015";
        sha256 = "02fz9wx5dmgpc79ndrb9xfxqlrkk7lg5wki2blz2zqg27spw6kbd";
        authors = [
          "RustCrypto Developers"
        ];
        dependencies = [
          {
            name = "byte-tools";
            packageId = "byte-tools";
          }
        ];
        
      };
      "bs58" = rec {
        crateName = "bs58";
        version = "0.2.5";
        edition = "2015";
        src = pkgs.callPackage ./tarball-v0.2.5.nix {};
        authors = [
          "Wim Looman <wim@nemo157.com>"
        ];
        dependencies = [
          {
            name = "sha2";
            packageId = "sha2";
            optional = true;
          }
        ];
        devDependencies = [
          {
            name = "assert_matches";
            packageId = "assert_matches";
          }
          {
            name = "base58";
            packageId = "base58";
          }
          {
            name = "rust-base58";
            packageId = "rust-base58";
          }
        ];
        features = {
          "check" = [ "sha2" ];
        };
        resolvedDefaultFeatures = [ "check" "default" "sha2" ];
      };
      "byte-tools" = rec {
        crateName = "byte-tools";
        version = "0.3.1";
        edition = "2015";
        sha256 = "1mqi29wsm8njpl51pfwr31wmpzs5ahlcb40wsjyd92l90ixcmdg3";
        authors = [
          "RustCrypto Developers"
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
      };
      "digest" = rec {
        crateName = "digest";
        version = "0.8.1";
        edition = "2015";
        sha256 = "1madjl27f3kj5ql7kwgvb9c8b7yb7bv7yfgx7rqzj4i3fp4cil7k";
        authors = [
          "RustCrypto Developers"
        ];
        dependencies = [
          {
            name = "generic-array";
            packageId = "generic-array";
          }
        ];
        features = {
          "dev" = [ "blobby" ];
        };
        resolvedDefaultFeatures = [ "std" ];
      };
      "fake-simd" = rec {
        crateName = "fake-simd";
        version = "0.1.2";
        edition = "2015";
        sha256 = "1vfylvk4va2ivqx85603lyqqp0zk52cgbs4n5nfbbbqx577qm2p8";
        authors = [
          "The Rust-Crypto Project Developers"
        ];
        
      };
      "generic-array" = rec {
        crateName = "generic-array";
        version = "0.12.3";
        edition = "2015";
        sha256 = "1v5jg7djicq34nbiv1dwaki71gkny002wyy9qfn3y0hfmrs053y6";
        libName = "generic_array";
        authors = [
          "Bartłomiej Kamiński <fizyk20@gmail.com>"
          "Aaron Trent <novacrazy@gmail.com>"
        ];
        dependencies = [
          {
            name = "typenum";
            packageId = "typenum";
          }
        ];
        
      };
      "num" = rec {
        crateName = "num";
        version = "0.2.0";
        edition = "2015";
        sha256 = "1nq8krgrz3nah4c2wqp3ap06xwjk9lpyk31ag2rhc50ygr0jaj6g";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "num-bigint";
            packageId = "num-bigint";
            optional = true;
            usesDefaultFeatures = false;
          }
          {
            name = "num-complex";
            packageId = "num-complex";
            usesDefaultFeatures = false;
          }
          {
            name = "num-integer";
            packageId = "num-integer";
            usesDefaultFeatures = false;
          }
          {
            name = "num-iter";
            packageId = "num-iter";
            usesDefaultFeatures = false;
          }
          {
            name = "num-rational";
            packageId = "num-rational";
            usesDefaultFeatures = false;
          }
          {
            name = "num-traits";
            packageId = "num-traits";
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "default" = [ "std" ];
          "i128" = [ "num-bigint/i128" "num-complex/i128" "num-integer/i128" "num-iter/i128" "num-rational/i128" "num-traits/i128" ];
          "rand" = [ "num-bigint/rand" "num-complex/rand" ];
          "serde" = [ "num-bigint/serde" "num-complex/serde" "num-rational/serde" ];
          "std" = [ "num-bigint/std" "num-complex/std" "num-integer/std" "num-iter/std" "num-rational/std" "num-rational/bigint" "num-traits/std" ];
        };
        resolvedDefaultFeatures = [ "default" "num-bigint" "std" ];
      };
      "num-bigint" = rec {
        crateName = "num-bigint";
        version = "0.2.2";
        edition = "2015";
        sha256 = "067pb5af5zrf5ah4759l5rfqyyqs3f2m8pih84d1z5axhnbh6iap";
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
        resolvedDefaultFeatures = [ "std" ];
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
        resolvedDefaultFeatures = [ "std" ];
      };
      "num-iter" = rec {
        crateName = "num-iter";
        version = "0.1.39";
        edition = "2015";
        sha256 = "0bhk2qbr3261r6zvfc58lz4spfqjhvdripxgz5mks5rd85r55gbn";
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
      "num-rational" = rec {
        crateName = "num-rational";
        version = "0.2.2";
        edition = "2015";
        sha256 = "0m5l76rdzzq98cfhnbjsxfngz6w75pal5mnfflpxqapysmw5527j";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "num-bigint";
            packageId = "num-bigint";
            optional = true;
            usesDefaultFeatures = false;
          }
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
          "bigint" = [ "num-bigint" ];
          "bigint-std" = [ "bigint" "num-bigint/std" ];
          "default" = [ "bigint-std" "std" ];
          "i128" = [ "num-integer/i128" "num-traits/i128" ];
          "std" = [ "num-integer/std" "num-traits/std" ];
        };
        resolvedDefaultFeatures = [ "bigint" "num-bigint" "std" ];
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
        resolvedDefaultFeatures = [ "std" ];
      };
      "opaque-debug" = rec {
        crateName = "opaque-debug";
        version = "0.2.3";
        edition = "2015";
        sha256 = "172j6bs8ndclqxa2m64qc0y1772rr73g4l9fg2svscgicnbfff98";
        authors = [
          "RustCrypto Developers"
        ];
        
      };
      "rust-base58" = rec {
        crateName = "rust-base58";
        version = "0.0.4";
        edition = "2015";
        sha256 = "0fa4y2jjjmg1a0cr3gz4z8rkic0hx2vx5nm23za9lwf6rlgvj4xk";
        authors = [
          "Nick Hamann <nick@wabbo.org>"
        ];
        dependencies = [
          {
            name = "num";
            packageId = "num";
          }
        ];
        
      };
      "sha2" = rec {
        crateName = "sha2";
        version = "0.8.0";
        edition = "2015";
        sha256 = "0gal773gz8gkpa9rndc917z6rl9kzd8q8gapaxv437s61vyqnkbv";
        authors = [
          "RustCrypto Developers"
        ];
        dependencies = [
          {
            name = "block-buffer";
            packageId = "block-buffer";
          }
          {
            name = "digest";
            packageId = "digest";
          }
          {
            name = "fake-simd";
            packageId = "fake-simd";
          }
          {
            name = "opaque-debug";
            packageId = "opaque-debug";
          }
        ];
        devDependencies = [
          {
            name = "digest";
            packageId = "digest";
            features = [ "dev" ];
          }
        ];
        features = {
          "asm" = [ "sha2-asm" ];
          "default" = [ "std" ];
          "std" = [ "digest/std" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "typenum" = rec {
        crateName = "typenum";
        version = "1.10.0";
        edition = "2015";
        sha256 = "0sc1jirllfhdi52z1xv9yqzxzpk6v7vadd13n7wvs1wnjipn6bb1";
        build = "build/main.rs";
        authors = [
          "Paho Lurie-Gregg <paho@paholg.com>"
          "Andre Bogus <bogusandre@gmail.com>"
        ];
        features = {
        };
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
