
# This file was @generated by crate2nix 0.9.0-alpha.1 with the command:
#   "generate" "-o" "/home/jamie/Misc/cratesioout/sphrs/v0.1.2.nix.tmp"
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
    packageId = "sphrs";

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
    "sphrs" = rec {
      packageId = "sphrs";
      build = internal.buildRustCrateWithFeatures {
        packageId = "sphrs";
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
      "autocfg" = rec {
        crateName = "autocfg";
        version = "0.1.7";
        edition = "2015";
        sha256 = "1chwgimpx5z7xbag7krr9d8asxfqbh683qhgl9kn3hxk2l0djj8x";
        authors = [
          "Josh Stone <cuviper@gmail.com>"
        ];
        
      };
      "bstr" = rec {
        crateName = "bstr";
        version = "0.2.8";
        edition = "2015";
        sha256 = "0i82qr3z4vwcdx7gjsjrqy64w1w88i5s7b7ab97hm4mbb1djqv4d";
        authors = [
          "Andrew Gallant <jamslam@gmail.com>"
        ];
        dependencies = [
          {
            name = "lazy_static";
            packageId = "lazy_static";
            optional = true;
          }
          {
            name = "memchr";
            packageId = "memchr";
            usesDefaultFeatures = false;
          }
          {
            name = "regex-automata";
            packageId = "regex-automata";
            optional = true;
            usesDefaultFeatures = false;
          }
          {
            name = "serde";
            packageId = "serde";
            optional = true;
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "default" = [ "std" "unicode" ];
          "serde1" = [ "std" "serde1-nostd" "serde/std" ];
          "serde1-nostd" = [ "serde" ];
          "std" = [ "memchr/use_std" ];
          "unicode" = [ "lazy_static" "regex-automata" ];
        };
        resolvedDefaultFeatures = [ "default" "lazy_static" "regex-automata" "serde" "serde1" "serde1-nostd" "std" "unicode" ];
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
      "csv" = rec {
        crateName = "csv";
        version = "1.1.1";
        edition = "2018";
        sha256 = "0zgq18xam24rbggm3ybmrygipa0mrr7rscf9r8hmi9vkzp6rql9p";
        authors = [
          "Andrew Gallant <jamslam@gmail.com>"
        ];
        dependencies = [
          {
            name = "bstr";
            packageId = "bstr";
            features = [ "serde1" ];
          }
          {
            name = "csv-core";
            packageId = "csv-core";
          }
          {
            name = "itoa";
            packageId = "itoa";
          }
          {
            name = "ryu";
            packageId = "ryu";
          }
          {
            name = "serde";
            packageId = "serde";
          }
        ];
        devDependencies = [
          {
            name = "serde";
            packageId = "serde";
            features = [ "derive" ];
          }
        ];
        
      };
      "csv-core" = rec {
        crateName = "csv-core";
        version = "0.1.6";
        edition = "2018";
        sha256 = "0k5zs0x0qmmn27pa5kcg86lg84s29491fw5sh3zswxswnavasp4v";
        authors = [
          "Andrew Gallant <jamslam@gmail.com>"
        ];
        dependencies = [
          {
            name = "memchr";
            packageId = "memchr";
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "default" = [ "libc" ];
          "libc" = [ "memchr/libc" ];
        };
        resolvedDefaultFeatures = [ "default" "libc" ];
      };
      "itoa" = rec {
        crateName = "itoa";
        version = "0.4.4";
        edition = "2015";
        sha256 = "0zvg2d9qv3avhf3d8ggglh6fdyw8kkwqg3r4622ly5yhxnvnc4jh";
        authors = [
          "David Tolnay <dtolnay@gmail.com>"
        ];
        features = {
          "default" = [ "std" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "lazy_static" = rec {
        crateName = "lazy_static";
        version = "1.4.0";
        edition = "2015";
        sha256 = "0in6ikhw8mgl33wjv6q6xfrb5b9jr16q8ygjy803fay4zcisvaz2";
        authors = [
          "Marvin Löbel <loebel.marvin@gmail.com>"
        ];
        features = {
          "spin_no_std" = [ "spin" ];
        };
      };
      "libc" = rec {
        crateName = "libc";
        version = "0.2.66";
        edition = "2015";
        sha256 = "0n0mwry21fxfwc063k33mvxk8xj7ia5ar8m42c9ymbam2ksb25fm";
        authors = [
          "The Rust Project Developers"
        ];
        features = {
          "default" = [ "std" ];
          "rustc-dep-of-std" = [ "align" "rustc-std-workspace-core" ];
          "use_std" = [ "std" ];
        };
      };
      "memchr" = rec {
        crateName = "memchr";
        version = "2.2.1";
        edition = "2015";
        sha256 = "13j6ji9x9ydpi9grbss106gqqr3xn3bcfp28aydqfa4751qrfmw8";
        authors = [
          "Andrew Gallant <jamslam@gmail.com>"
          "bluss"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
            optional = true;
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "default" = [ "use_std" ];
        };
        resolvedDefaultFeatures = [ "libc" "use_std" ];
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
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "num-integer" = rec {
        crateName = "num-integer";
        version = "0.1.39";
        edition = "2015";
        sha256 = "1shc9hfykcywgd86h2w6939d436gpmx2pbqbay653w3p4s6m4gg8";
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
        features = {
          "default" = [ "std" ];
          "i128" = [ "num-traits/i128" ];
          "std" = [ "num-traits/std" ];
        };
        resolvedDefaultFeatures = [ "std" ];
      };
      "num-iter" = rec {
        crateName = "num-iter";
        version = "0.1.37";
        edition = "2015";
        sha256 = "09115d12q1bcgig3ivnnbs8vz9kwqc78c0vvqm6ld9ci6aydngxg";
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
      "num-rational" = rec {
        crateName = "num-rational";
        version = "0.2.1";
        edition = "2015";
        sha256 = "041gn9kjfpbsjw48dcdzzczazmdmahzwy7jv5cjdmcvv2x0g15jf";
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
        version = "0.2.10";
        edition = "2015";
        sha256 = "1r079jbmrnrbvsz7dc5mcghijx7bhpfikjspfqrgl4n227y1zj6l";
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
      "regex-automata" = rec {
        crateName = "regex-automata";
        version = "0.1.8";
        edition = "2015";
        sha256 = "1y89vkwd9z7797lsdsizvhw4lw7i1mhfx97a8315bhkh2wm3rdwj";
        authors = [
          "Andrew Gallant <jamslam@gmail.com>"
        ];
        dependencies = [
          {
            name = "byteorder";
            packageId = "byteorder";
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "default" = [ "std" ];
          "std" = [ "regex-syntax" "utf8-ranges" ];
        };
      };
      "ryu" = rec {
        crateName = "ryu";
        version = "1.0.2";
        edition = "2015";
        sha256 = "1j0h74f1xqf9hjkhanp8i20mqc1aw35kr1iq9i79q7713mn51a5z";
        authors = [
          "David Tolnay <dtolnay@gmail.com>"
        ];
        features = {
        };
      };
      "serde" = rec {
        crateName = "serde";
        version = "1.0.104";
        edition = "2015";
        sha256 = "0ja4mgw4p42syjk7jkzwhj2yg6llfrfm7vn8rvy7v3c1bzr1aha1";
        authors = [
          "Erick Tryzelaar <erick.tryzelaar@gmail.com>"
          "David Tolnay <dtolnay@gmail.com>"
        ];
        features = {
          "default" = [ "std" ];
          "derive" = [ "serde_derive" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "sphrs" = rec {
        crateName = "sphrs";
        version = "0.1.2";
        edition = "2018";
        src = pkgs.callPackage ./tarball-v0.1.2.nix {};
        authors = [
          "Stefan Kroboth <stefan.kroboth@gmail.com>"
        ];
        dependencies = [
          {
            name = "num";
            packageId = "num";
          }
          {
            name = "num-complex";
            packageId = "num-complex";
          }
          {
            name = "num-traits";
            packageId = "num-traits";
          }
        ];
        devDependencies = [
          {
            name = "csv";
            packageId = "csv";
          }
        ];
        
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
