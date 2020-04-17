
# This file was @generated by crate2nix 0.9.0-alpha.1 with the command:
#   "generate" "-o" "/home/jamie/Misc/cratesioout/pharos/v0.4.2.nix.tmp"
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
    packageId = "pharos";

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
    "pharos" = rec {
      packageId = "pharos";
      build = internal.buildRustCrateWithFeatures {
        packageId = "pharos";
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
      "futures" = rec {
        crateName = "futures";
        version = "0.3.1";
        edition = "2018";
        sha256 = "11srrbc0hp7pgz142qjfx2z07kfhc98rbfwqyrgm4mxvxib61wdn";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        dependencies = [
          {
            name = "futures-channel";
            packageId = "futures-channel";
            usesDefaultFeatures = false;
            features = [ "sink" ];
          }
          {
            name = "futures-core";
            packageId = "futures-core";
            usesDefaultFeatures = false;
          }
          {
            name = "futures-executor";
            packageId = "futures-executor";
            optional = true;
            usesDefaultFeatures = false;
          }
          {
            name = "futures-io";
            packageId = "futures-io";
            usesDefaultFeatures = false;
          }
          {
            name = "futures-sink";
            packageId = "futures-sink";
            usesDefaultFeatures = false;
          }
          {
            name = "futures-task";
            packageId = "futures-task";
            usesDefaultFeatures = false;
          }
          {
            name = "futures-util";
            packageId = "futures-util";
            usesDefaultFeatures = false;
            features = [ "sink" ];
          }
        ];
        features = {
          "alloc" = [ "futures-core/alloc" "futures-task/alloc" "futures-sink/alloc" "futures-channel/alloc" "futures-util/alloc" ];
          "async-await" = [ "futures-util/async-await" "futures-util/async-await-macro" ];
          "bilock" = [ "futures-util/bilock" ];
          "cfg-target-has-atomic" = [ "futures-core/cfg-target-has-atomic" "futures-task/cfg-target-has-atomic" "futures-channel/cfg-target-has-atomic" "futures-util/cfg-target-has-atomic" ];
          "compat" = [ "std" "futures-util/compat" ];
          "default" = [ "std" "async-await" "executor" ];
          "executor" = [ "std" "futures-executor/std" ];
          "io-compat" = [ "compat" "futures-util/io-compat" ];
          "read-initializer" = [ "futures-io/read-initializer" "futures-util/read-initializer" ];
          "std" = [ "alloc" "futures-core/std" "futures-task/std" "futures-io/std" "futures-sink/std" "futures-util/std" "futures-util/io" "futures-util/channel" ];
          "thread-pool" = [ "executor" "futures-executor/thread-pool" ];
          "unstable" = [ "futures-core/unstable" "futures-task/unstable" "futures-channel/unstable" "futures-io/unstable" "futures-util/unstable" ];
        };
        resolvedDefaultFeatures = [ "alloc" "async-await" "default" "executor" "futures-executor" "std" ];
      };
      "futures-channel" = rec {
        crateName = "futures-channel";
        version = "0.3.1";
        edition = "2018";
        sha256 = "11lvk749n61654ad40xn751gmxzwb697nwh36s5gs0ni2z59ibpw";
        libName = "futures_channel";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        dependencies = [
          {
            name = "futures-core";
            packageId = "futures-core";
            usesDefaultFeatures = false;
          }
          {
            name = "futures-sink";
            packageId = "futures-sink";
            optional = true;
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "alloc" = [ "futures-core/alloc" ];
          "cfg-target-has-atomic" = [ "futures-core/cfg-target-has-atomic" ];
          "default" = [ "std" ];
          "sink" = [ "futures-sink" ];
          "std" = [ "alloc" "futures-core/std" ];
          "unstable" = [ "futures-core/unstable" ];
        };
        resolvedDefaultFeatures = [ "alloc" "default" "futures-sink" "sink" "std" ];
      };
      "futures-core" = rec {
        crateName = "futures-core";
        version = "0.3.1";
        edition = "2018";
        sha256 = "0rh8q6pg08dizk5hwksvjgvkw26s3sr3b199nggv3ypyg914qmkr";
        libName = "futures_core";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        features = {
          "default" = [ "std" ];
          "std" = [ "alloc" ];
        };
        resolvedDefaultFeatures = [ "alloc" "std" ];
      };
      "futures-executor" = rec {
        crateName = "futures-executor";
        version = "0.3.1";
        edition = "2018";
        sha256 = "0cf24wbgxqh4kdjbb557vk1axzmbpmwb8s05ga1nls1zaqv4f9qy";
        libName = "futures_executor";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        dependencies = [
          {
            name = "futures-core";
            packageId = "futures-core";
            usesDefaultFeatures = false;
          }
          {
            name = "futures-task";
            packageId = "futures-task";
            usesDefaultFeatures = false;
          }
          {
            name = "futures-util";
            packageId = "futures-util";
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "default" = [ "std" ];
          "std" = [ "futures-core/std" "futures-task/std" "futures-util/std" ];
          "thread-pool" = [ "std" "num_cpus" ];
        };
        resolvedDefaultFeatures = [ "std" ];
      };
      "futures-io" = rec {
        crateName = "futures-io";
        version = "0.3.1";
        edition = "2018";
        sha256 = "1zxm41fmkrb0r39ajk3rr9invcd5bdwlafazn8m9aw4y49ymfxp6";
        libName = "futures_io";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        features = {
          "default" = [ "std" ];
        };
        resolvedDefaultFeatures = [ "std" ];
      };
      "futures-macro" = rec {
        crateName = "futures-macro";
        version = "0.3.1";
        edition = "2018";
        sha256 = "0r3px32wgqfbmfyb1lrj9wplvjris5magdyhfr7xnyjk2mncbrsj";
        procMacro = true;
        libName = "futures_macro";
        authors = [
          "Taylor Cramer <cramertj@google.com>"
          "Taiki Endo <te316e89@gmail.com>"
        ];
        dependencies = [
          {
            name = "proc-macro-hack";
            packageId = "proc-macro-hack";
          }
          {
            name = "proc-macro2";
            packageId = "proc-macro2";
          }
          {
            name = "quote";
            packageId = "quote";
          }
          {
            name = "syn";
            packageId = "syn";
            features = [ "full" ];
          }
        ];
        
      };
      "futures-sink" = rec {
        crateName = "futures-sink";
        version = "0.3.1";
        edition = "2018";
        sha256 = "05iwskzxq3yqvxv9l1kqnd7kkmp0dwc39fnvwrcjsg76z8zf66qp";
        libName = "futures_sink";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        features = {
          "default" = [ "std" ];
          "std" = [ "alloc" ];
        };
        resolvedDefaultFeatures = [ "alloc" "std" ];
      };
      "futures-task" = rec {
        crateName = "futures-task";
        version = "0.3.1";
        edition = "2018";
        sha256 = "1yg5d7b3z58mhqbrax5a0qdsfvzfclwyqvw5k3i41x4wnbb55bhb";
        libName = "futures_task";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        features = {
          "default" = [ "std" ];
          "std" = [ "alloc" ];
        };
        resolvedDefaultFeatures = [ "alloc" "std" ];
      };
      "futures-util" = rec {
        crateName = "futures-util";
        version = "0.3.1";
        edition = "2018";
        sha256 = "0xlyqdn6lnpkw27lwxczihx91h64gbdd31n8c8y5v63nzds65mn0";
        libName = "futures_util";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        dependencies = [
          {
            name = "futures-channel";
            packageId = "futures-channel";
            optional = true;
            usesDefaultFeatures = false;
            features = [ "std" ];
          }
          {
            name = "futures-core";
            packageId = "futures-core";
            usesDefaultFeatures = false;
          }
          {
            name = "futures-io";
            packageId = "futures-io";
            optional = true;
            usesDefaultFeatures = false;
            features = [ "std" ];
          }
          {
            name = "futures-macro";
            packageId = "futures-macro";
            optional = true;
            usesDefaultFeatures = false;
          }
          {
            name = "futures-sink";
            packageId = "futures-sink";
            optional = true;
            usesDefaultFeatures = false;
          }
          {
            name = "futures-task";
            packageId = "futures-task";
            usesDefaultFeatures = false;
          }
          {
            name = "memchr";
            packageId = "memchr";
            optional = true;
          }
          {
            name = "pin-utils";
            packageId = "pin-utils";
          }
          {
            name = "proc-macro-hack";
            packageId = "proc-macro-hack";
            optional = true;
          }
          {
            name = "proc-macro-nested";
            packageId = "proc-macro-nested";
            optional = true;
          }
          {
            name = "slab";
            packageId = "slab";
            optional = true;
          }
        ];
        features = {
          "alloc" = [ "futures-core/alloc" "futures-task/alloc" ];
          "async-await-macro" = [ "async-await" "futures-macro" "proc-macro-hack" "proc-macro-nested" ];
          "cfg-target-has-atomic" = [ "futures-core/cfg-target-has-atomic" "futures-task/cfg-target-has-atomic" ];
          "channel" = [ "std" "futures-channel" ];
          "compat" = [ "std" "futures_01" ];
          "default" = [ "std" "async-await" "async-await-macro" ];
          "io" = [ "std" "futures-io" "memchr" ];
          "io-compat" = [ "io" "compat" "tokio-io" ];
          "read-initializer" = [ "io" "futures-io/read-initializer" "futures-io/unstable" ];
          "sink" = [ "futures-sink" ];
          "std" = [ "alloc" "futures-core/std" "futures-task/std" "slab" ];
          "unstable" = [ "futures-core/unstable" "futures-task/unstable" ];
        };
        resolvedDefaultFeatures = [ "alloc" "async-await" "async-await-macro" "channel" "futures-channel" "futures-io" "futures-macro" "futures-sink" "io" "memchr" "proc-macro-hack" "proc-macro-nested" "sink" "slab" "std" ];
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
        features = {
          "default" = [ "use_std" ];
        };
        resolvedDefaultFeatures = [ "default" "use_std" ];
      };
      "pharos" = rec {
        crateName = "pharos";
        version = "0.4.2";
        edition = "2018";
        src = pkgs.callPackage ./tarball-v0.4.2.nix {};
        authors = [
          "Naja Melan <najamelan@autistici.org>"
        ];
        dependencies = [
          {
            name = "futures";
            packageId = "futures";
            usesDefaultFeatures = false;
          }
          {
            name = "futures-channel";
            packageId = "futures-channel";
          }
        ];
        devDependencies = [
          {
            name = "assert_matches";
            packageId = "assert_matches";
          }
          {
            name = "futures";
            packageId = "futures";
          }
        ];
        features = {
        };
        resolvedDefaultFeatures = [ "external_doc" ];
      };
      "pin-utils" = rec {
        crateName = "pin-utils";
        version = "0.1.0-alpha.4";
        edition = "2018";
        sha256 = "11xmyx00n4m37d546by2rxb8ryxs12v55cc172i3yak1rqccd52q";
        authors = [
          "Josef Brandl <mail@josefbrandl.de>"
        ];
        
      };
      "proc-macro-hack" = rec {
        crateName = "proc-macro-hack";
        version = "0.5.11";
        edition = "2018";
        sha256 = "1idz5vmnjjhvr51yvwyjb45mza18wa53fr05m1skqvbdyw15gm7c";
        procMacro = true;
        authors = [
          "David Tolnay <dtolnay@gmail.com>"
        ];
        dependencies = [
          {
            name = "proc-macro2";
            packageId = "proc-macro2";
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
      "proc-macro-nested" = rec {
        crateName = "proc-macro-nested";
        version = "0.1.3";
        edition = "2015";
        sha256 = "0bmlksm8vl44wkwihmwr7jsjznhbg0n7aibcw1cs2jgjcp86x6in";
        authors = [
          "David Tolnay <dtolnay@gmail.com>"
        ];
        
      };
      "proc-macro2" = rec {
        crateName = "proc-macro2";
        version = "1.0.6";
        edition = "2018";
        sha256 = "09rgb5ab0jgw39kyad0lgqs4nb9yaf7mwcrgxqnsxbn4il54g7lw";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        dependencies = [
          {
            name = "unicode-xid";
            packageId = "unicode-xid";
          }
        ];
        features = {
          "default" = [ "proc-macro" ];
        };
        resolvedDefaultFeatures = [ "default" "proc-macro" ];
      };
      "quote" = rec {
        crateName = "quote";
        version = "1.0.2";
        edition = "2018";
        sha256 = "1zkc46ryacf2jdkc6krsy2z615xbk1x8kp1830rcxz3irj5qqfh5";
        authors = [
          "David Tolnay <dtolnay@gmail.com>"
        ];
        dependencies = [
          {
            name = "proc-macro2";
            packageId = "proc-macro2";
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "default" = [ "proc-macro" ];
          "proc-macro" = [ "proc-macro2/proc-macro" ];
        };
        resolvedDefaultFeatures = [ "default" "proc-macro" ];
      };
      "slab" = rec {
        crateName = "slab";
        version = "0.4.2";
        edition = "2015";
        sha256 = "1y59xsa27jk84sxzswjk60xcjf8b4fm5960jwpznrrcmasyva4f1";
        authors = [
          "Carl Lerche <me@carllerche.com>"
        ];
        
      };
      "syn" = rec {
        crateName = "syn";
        version = "1.0.8";
        edition = "2018";
        sha256 = "14hyd7n87a6bq6b6nigvq6shn1r21l0aszdrvv6lan515bm425k6";
        authors = [
          "David Tolnay <dtolnay@gmail.com>"
        ];
        dependencies = [
          {
            name = "proc-macro2";
            packageId = "proc-macro2";
            usesDefaultFeatures = false;
          }
          {
            name = "quote";
            packageId = "quote";
            optional = true;
            usesDefaultFeatures = false;
          }
          {
            name = "unicode-xid";
            packageId = "unicode-xid";
          }
        ];
        features = {
          "default" = [ "derive" "parsing" "printing" "clone-impls" "proc-macro" ];
          "printing" = [ "quote" ];
          "proc-macro" = [ "proc-macro2/proc-macro" "quote/proc-macro" ];
        };
        resolvedDefaultFeatures = [ "clone-impls" "default" "derive" "full" "parsing" "printing" "proc-macro" "quote" ];
      };
      "unicode-xid" = rec {
        crateName = "unicode-xid";
        version = "0.2.0";
        edition = "2015";
        sha256 = "0z09fn515xm7zyr0mmdyxa9mx2f7azcpv74pqmg611iralwpcvl2";
        authors = [
          "erick.tryzelaar <erick.tryzelaar@gmail.com>"
          "kwantam <kwantam@gmail.com>"
        ];
        features = {
        };
        resolvedDefaultFeatures = [ "default" ];
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
