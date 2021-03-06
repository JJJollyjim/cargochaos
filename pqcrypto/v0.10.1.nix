
# This file was @generated by crate2nix 0.9.0-alpha.1 with the command:
#   "generate" "-o" "/home/jamie/Misc/cratesioout/pqcrypto/v0.10.1.nix.tmp"
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
    packageId = "pqcrypto";

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
    "pqcrypto" = rec {
      packageId = "pqcrypto";
      build = internal.buildRustCrateWithFeatures {
        packageId = "pqcrypto";
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
      "cc" = rec {
        crateName = "cc";
        version = "1.0.50";
        edition = "2018";
        crateBin = [];
        sha256 = "1kdqm8ka7xg9h56b694pcz29ka33fsz27mzrphqc78gx96h8zqlm";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        dependencies = [
          {
            name = "jobserver";
            packageId = "jobserver";
            optional = true;
          }
        ];
        features = {
          "parallel" = [ "jobserver" ];
        };
        resolvedDefaultFeatures = [ "jobserver" "parallel" ];
      };
      "glob" = rec {
        crateName = "glob";
        version = "0.3.0";
        edition = "2015";
        sha256 = "0x25wfr7vg3mzxc9x05dcphvd3nwlcmbnxrvwcvrrdwplcrrk4cv";
        authors = [
          "The Rust Project Developers"
        ];
        
      };
      "jobserver" = rec {
        crateName = "jobserver";
        version = "0.1.21";
        edition = "2018";
        sha256 = "1wm7h76xf7a4d0q6583agbsyl2s46vndrlnr015zffclpcz32waw";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
            target = { target, features }: target."unix";
          }
        ];
        
      };
      "libc" = rec {
        crateName = "libc";
        version = "0.2.68";
        edition = "2015";
        sha256 = "1w6z9krcqn7p200sb80dxx76iyvw3jdz949zxr1sgfr3a50c186y";
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
      "pqcrypto" = rec {
        crateName = "pqcrypto";
        version = "0.10.1";
        edition = "2018";
        src = pkgs.callPackage ./tarball-v0.10.1.nix {};
        authors = [
          "Thom Wiggers <thom@thomwiggers.nl>"
        ];
        dependencies = [
          {
            name = "pqcrypto-classicmceliece";
            packageId = "pqcrypto-classicmceliece";
          }
          {
            name = "pqcrypto-dilithium";
            packageId = "pqcrypto-dilithium";
          }
          {
            name = "pqcrypto-falcon";
            packageId = "pqcrypto-falcon";
          }
          {
            name = "pqcrypto-frodo";
            packageId = "pqcrypto-frodo";
          }
          {
            name = "pqcrypto-hqc";
            packageId = "pqcrypto-hqc";
          }
          {
            name = "pqcrypto-kyber";
            packageId = "pqcrypto-kyber";
          }
          {
            name = "pqcrypto-ledacryptkem";
            packageId = "pqcrypto-ledacryptkem";
          }
          {
            name = "pqcrypto-mqdss";
            packageId = "pqcrypto-mqdss";
          }
          {
            name = "pqcrypto-newhope";
            packageId = "pqcrypto-newhope";
          }
          {
            name = "pqcrypto-ntru";
            packageId = "pqcrypto-ntru";
          }
          {
            name = "pqcrypto-qtesla";
            packageId = "pqcrypto-qtesla";
          }
          {
            name = "pqcrypto-rainbow";
            packageId = "pqcrypto-rainbow";
          }
          {
            name = "pqcrypto-saber";
            packageId = "pqcrypto-saber";
          }
          {
            name = "pqcrypto-sphincsplus";
            packageId = "pqcrypto-sphincsplus";
          }
          {
            name = "pqcrypto-threebears";
            packageId = "pqcrypto-threebears";
          }
          {
            name = "pqcrypto-traits";
            packageId = "pqcrypto-traits";
          }
        ];
        
      };
      "pqcrypto-classicmceliece" = rec {
        crateName = "pqcrypto-classicmceliece";
        version = "0.1.0";
        edition = "2018";
        sha256 = "1ramy0rpf53sjc81xsqk5m41ygmc1bjmx5sqhaz2x9khfgsy8832";
        authors = [
          "Thom Wiggers <thom@thomwiggers.nl>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "pqcrypto-traits";
            packageId = "pqcrypto-traits";
          }
        ];
        buildDependencies = [
          {
            name = "cc";
            packageId = "cc";
            features = [ "parallel" ];
          }
          {
            name = "glob";
            packageId = "glob";
          }
        ];
        
      };
      "pqcrypto-dilithium" = rec {
        crateName = "pqcrypto-dilithium";
        version = "0.3.1";
        edition = "2018";
        sha256 = "133bn13ilsym1llj0z33rhdfqrm670cc3ab3q6dkqy32qs2k8y7b";
        authors = [
          "Thom Wiggers <thom@thomwiggers.nl>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "pqcrypto-traits";
            packageId = "pqcrypto-traits";
          }
        ];
        buildDependencies = [
          {
            name = "cc";
            packageId = "cc";
            features = [ "parallel" ];
          }
          {
            name = "glob";
            packageId = "glob";
          }
        ];
        
      };
      "pqcrypto-falcon" = rec {
        crateName = "pqcrypto-falcon";
        version = "0.2.2";
        edition = "2018";
        sha256 = "04whqly3ia7rja4l3j2w03ad5lvmgnyd6nwijk98vbqdb5kmw6i5";
        authors = [
          "Thom Wiggers <thom@thomwiggers.nl>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "pqcrypto-traits";
            packageId = "pqcrypto-traits";
          }
        ];
        buildDependencies = [
          {
            name = "cc";
            packageId = "cc";
            features = [ "parallel" ];
          }
          {
            name = "glob";
            packageId = "glob";
          }
        ];
        
      };
      "pqcrypto-frodo" = rec {
        crateName = "pqcrypto-frodo";
        version = "0.4.2";
        edition = "2018";
        sha256 = "1ws8nv7i0ncm4syln7728wc72sxqdgh8wlal8fwl5z4b96cldfdg";
        authors = [
          "Thom Wiggers <thom@thomwiggers.nl>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "pqcrypto-traits";
            packageId = "pqcrypto-traits";
          }
        ];
        buildDependencies = [
          {
            name = "cc";
            packageId = "cc";
            features = [ "parallel" ];
          }
          {
            name = "glob";
            packageId = "glob";
          }
        ];
        
      };
      "pqcrypto-hqc" = rec {
        crateName = "pqcrypto-hqc";
        version = "0.0.2";
        edition = "2018";
        sha256 = "1n2c3fk23l21zpy2kkyfr06g8h3p79wfx4q2aj5rm4sj1n3yj81m";
        authors = [
          "Thom Wiggers <thom@thomwiggers.nl>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "pqcrypto-traits";
            packageId = "pqcrypto-traits";
          }
        ];
        buildDependencies = [
          {
            name = "cc";
            packageId = "cc";
            features = [ "parallel" ];
          }
          {
            name = "glob";
            packageId = "glob";
          }
        ];
        
      };
      "pqcrypto-kyber" = rec {
        crateName = "pqcrypto-kyber";
        version = "0.6.5";
        edition = "2018";
        sha256 = "1d16ai9vqm30gnfcqdb9zz8acjf5fxdjnyw5b3d28y6v1zvydpqv";
        authors = [
          "Thom Wiggers <thom@thomwiggers.nl>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "pqcrypto-traits";
            packageId = "pqcrypto-traits";
          }
        ];
        buildDependencies = [
          {
            name = "cc";
            packageId = "cc";
            features = [ "parallel" ];
          }
          {
            name = "glob";
            packageId = "glob";
          }
        ];
        
      };
      "pqcrypto-ledacryptkem" = rec {
        crateName = "pqcrypto-ledacryptkem";
        version = "0.0.3";
        edition = "2018";
        sha256 = "079x9rw5565mfswmr0nca7q1j2x6n5bg8rwbyp4gm2lsw307zzjv";
        authors = [
          "Thom Wiggers <thom@thomwiggers.nl>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "pqcrypto-traits";
            packageId = "pqcrypto-traits";
          }
        ];
        buildDependencies = [
          {
            name = "cc";
            packageId = "cc";
            features = [ "parallel" ];
          }
          {
            name = "glob";
            packageId = "glob";
          }
        ];
        
      };
      "pqcrypto-mqdss" = rec {
        crateName = "pqcrypto-mqdss";
        version = "0.2.3";
        edition = "2018";
        sha256 = "1yis7wxckcj5izdr47yr8f378v3x2ynygd01gl87li1f8s7wkmsc";
        authors = [
          "Thom Wiggers <thom@thomwiggers.nl>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "pqcrypto-traits";
            packageId = "pqcrypto-traits";
          }
        ];
        buildDependencies = [
          {
            name = "cc";
            packageId = "cc";
            features = [ "parallel" ];
          }
          {
            name = "glob";
            packageId = "glob";
          }
        ];
        
      };
      "pqcrypto-newhope" = rec {
        crateName = "pqcrypto-newhope";
        version = "0.1.2";
        edition = "2018";
        sha256 = "1m6bgsmkdhmsv9slcd6lbzq9lw8qk7i192wskxpnbsnba04rh9pr";
        authors = [
          "Thom Wiggers <thom@thomwiggers.nl>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "pqcrypto-traits";
            packageId = "pqcrypto-traits";
          }
        ];
        buildDependencies = [
          {
            name = "cc";
            packageId = "cc";
            features = [ "parallel" ];
          }
          {
            name = "glob";
            packageId = "glob";
          }
        ];
        
      };
      "pqcrypto-ntru" = rec {
        crateName = "pqcrypto-ntru";
        version = "0.4.2";
        edition = "2018";
        sha256 = "0w3h61c5z3xqhp5wzqfzbr0pk3j10gbq0mb0zjianz5aq51n9lv7";
        authors = [
          "Thom Wiggers <thom@thomwiggers.nl>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "pqcrypto-traits";
            packageId = "pqcrypto-traits";
          }
        ];
        buildDependencies = [
          {
            name = "cc";
            packageId = "cc";
            features = [ "parallel" ];
          }
          {
            name = "glob";
            packageId = "glob";
          }
        ];
        
      };
      "pqcrypto-qtesla" = rec {
        crateName = "pqcrypto-qtesla";
        version = "0.1.1";
        edition = "2018";
        sha256 = "0bd9r54dnr7a161rvs4mj3s1cg3xndriccav4gnd4vk3ix5yfjf3";
        authors = [
          "Thom Wiggers <thom@thomwiggers.nl>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "pqcrypto-traits";
            packageId = "pqcrypto-traits";
          }
        ];
        buildDependencies = [
          {
            name = "cc";
            packageId = "cc";
            features = [ "parallel" ];
          }
          {
            name = "glob";
            packageId = "glob";
          }
        ];
        
      };
      "pqcrypto-rainbow" = rec {
        crateName = "pqcrypto-rainbow";
        version = "0.1.2";
        edition = "2018";
        sha256 = "1cgykjdwh76nqnxajngkdialri51is9fja3xj6p8w4i8ndxqg65j";
        authors = [
          "Thom Wiggers <thom@thomwiggers.nl>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "pqcrypto-traits";
            packageId = "pqcrypto-traits";
          }
        ];
        buildDependencies = [
          {
            name = "cc";
            packageId = "cc";
            features = [ "parallel" ];
          }
          {
            name = "glob";
            packageId = "glob";
          }
        ];
        
      };
      "pqcrypto-saber" = rec {
        crateName = "pqcrypto-saber";
        version = "0.1.3";
        edition = "2018";
        sha256 = "1nrr35fc71pxsr7z6shc4k9w21w7qvgv6k30hims3iy865fpvbdp";
        authors = [
          "Thom Wiggers <thom@thomwiggers.nl>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "pqcrypto-traits";
            packageId = "pqcrypto-traits";
          }
        ];
        buildDependencies = [
          {
            name = "cc";
            packageId = "cc";
            features = [ "parallel" ];
          }
          {
            name = "glob";
            packageId = "glob";
          }
        ];
        
      };
      "pqcrypto-sphincsplus" = rec {
        crateName = "pqcrypto-sphincsplus";
        version = "0.5.0";
        edition = "2018";
        sha256 = "1zprmpf2025cw1bvx12h2lnssvvy3dk3py33vjlda86sq054fiki";
        authors = [
          "Thom Wiggers <thom@thomwiggers.nl>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "pqcrypto-traits";
            packageId = "pqcrypto-traits";
          }
        ];
        buildDependencies = [
          {
            name = "cc";
            packageId = "cc";
            features = [ "parallel" ];
          }
          {
            name = "glob";
            packageId = "glob";
          }
        ];
        
      };
      "pqcrypto-threebears" = rec {
        crateName = "pqcrypto-threebears";
        version = "0.2.0";
        edition = "2018";
        sha256 = "0lqrjsm7rngkhmc36v266hddd1ibsjycqc5sjs597n6jwszqkwxw";
        authors = [
          "Thom Wiggers <thom@thomwiggers.nl>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "pqcrypto-traits";
            packageId = "pqcrypto-traits";
          }
        ];
        buildDependencies = [
          {
            name = "cc";
            packageId = "cc";
            features = [ "parallel" ];
          }
          {
            name = "glob";
            packageId = "glob";
          }
        ];
        
      };
      "pqcrypto-traits" = rec {
        crateName = "pqcrypto-traits";
        version = "0.3.3";
        edition = "2018";
        sha256 = "0jsyh2pb0pp97pif7ipyc5wa4jswz8rhmvmckj3axab0zwz5dqfl";
        authors = [
          "Thom Wiggers <thom@thomwiggers.nl>"
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
