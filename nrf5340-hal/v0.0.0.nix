
# This file was @generated by crate2nix 0.9.0-alpha.1 with the command:
#   "generate" "-o" "/home/jamie/Misc/cratesioout/nrf5340-hal/v0.0.0.nix.tmp"
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
    packageId = "nrf5340-hal";

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
    "nrf5340-hal" = rec {
      packageId = "nrf5340-hal";
      build = internal.buildRustCrateWithFeatures {
        packageId = "nrf5340-hal";
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
      "aligned" = rec {
        crateName = "aligned";
        version = "0.3.2";
        edition = "2018";
        sha256 = "157bvizg1w0845mz3mdjgs5ly507x1f1n6nkn5m165i072ryh77b";
        authors = [
          "Jorge Aparicio <jorge@japaric.io>"
        ];
        dependencies = [
          {
            name = "as-slice";
            packageId = "as-slice";
          }
        ];
        
      };
      "as-slice" = rec {
        crateName = "as-slice";
        version = "0.1.2";
        edition = "2015";
        sha256 = "012cjlhf25mf6c5j7qz40jd198crx9fq4nmbkkqm7ms9mjapwsxy";
        authors = [
          "Jorge Aparicio <jorge@japaric.io>"
        ];
        dependencies = [
          {
            name = "generic-array";
            packageId = "generic-array 0.12.3";
          }
          {
            name = "generic-array";
            packageId = "generic-array 0.13.2";
            rename = "ga13";
          }
          {
            name = "stable_deref_trait";
            packageId = "stable_deref_trait";
            usesDefaultFeatures = false;
          }
        ];
        
      };
      "bare-metal" = rec {
        crateName = "bare-metal";
        version = "0.2.5";
        edition = "2015";
        sha256 = "1cy5pbb92fznnri72y6drfpjxj4qdmd62f0rrlgy70dxlppn9ssx";
        authors = [
          "Jorge Aparicio <jorge@japaric.io>"
        ];
        buildDependencies = [
          {
            name = "rustc_version";
            packageId = "rustc_version";
          }
        ];
        features = {
        };
        resolvedDefaultFeatures = [ "const-fn" ];
      };
      "cortex-m" = rec {
        crateName = "cortex-m";
        version = "0.6.1";
        edition = "2018";
        sha256 = "1jnv4fj4rddbfxdls3c0pndxsji190bmxrr5sj73ggcv6zya4p8l";
        authors = [
          "The Cortex-M Team <cortex-m@teams.rust-embedded.org>"
          "Jorge Aparicio <jorge@japaric.io>"
        ];
        dependencies = [
          {
            name = "aligned";
            packageId = "aligned";
          }
          {
            name = "bare-metal";
            packageId = "bare-metal";
            features = [ "const-fn" ];
          }
          {
            name = "volatile-register";
            packageId = "volatile-register";
          }
        ];
        features = {
        };
      };
      "cortex-m-rt" = rec {
        crateName = "cortex-m-rt";
        version = "0.6.10";
        edition = "2015";
        sha256 = "1b1qjf1zj7ic008ahgqm4rb9wgcy9lwbfhncpyyjkw7cwc85k00p";
        authors = [
          "The Cortex-M Team <cortex-m@teams.rust-embedded.org>"
          "Jorge Aparicio <jorge@japaric.io>"
          "Hideki Sekine <sekineh@me.com>"
        ];
        dependencies = [
          {
            name = "cortex-m-rt-macros";
            packageId = "cortex-m-rt-macros";
          }
          {
            name = "r0";
            packageId = "r0";
          }
        ];
        features = {
        };
        resolvedDefaultFeatures = [ "device" ];
      };
      "cortex-m-rt-macros" = rec {
        crateName = "cortex-m-rt-macros";
        version = "0.1.6";
        edition = "2015";
        sha256 = "0dpr80mx9pm26lbbl6q7w87zhbphm13gxb7z9f9c85djxdcw6v9a";
        procMacro = true;
        authors = [
          "Jorge Aparicio <jorge@japaric.io>"
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
            name = "rand";
            packageId = "rand";
            usesDefaultFeatures = false;
          }
          {
            name = "syn";
            packageId = "syn";
            features = [ "extra-traits" "full" ];
          }
        ];
        
      };
      "cortex-m-semihosting" = rec {
        crateName = "cortex-m-semihosting";
        version = "0.3.5";
        edition = "2018";
        sha256 = "1yicfshkn85lf53q1qmykjghxcwrj13g904kiysn4azfzzng0ghi";
        authors = [
          "The Cortex-M Team <cortex-m@teams.rust-embedded.org>"
          "Jorge Aparicio <japaricious@gmail.com>"
        ];
        dependencies = [
          {
            name = "cortex-m";
            packageId = "cortex-m";
          }
        ];
        features = {
        };
      };
      "generic-array 0.12.3" = rec {
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
      "generic-array 0.13.2" = rec {
        crateName = "generic-array";
        version = "0.13.2";
        edition = "2015";
        sha256 = "1kddwxpd58y807y1r3lijg7sw3gxm6nczl6wp57gamhv6mhygl8f";
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
        features = {
        };
      };
      "nrf5340-app-pac" = rec {
        crateName = "nrf5340-app-pac";
        version = "0.1.0";
        edition = "2018";
        sha256 = "07gmznjgywhb4q9irhgd5xhm09d90npcqr7m9y1q8wvzfahncp3l";
        authors = [
          "Jonas Schievink <jonasschievink@gmail.com>"
        ];
        dependencies = [
          {
            name = "bare-metal";
            packageId = "bare-metal";
          }
          {
            name = "cortex-m";
            packageId = "cortex-m";
          }
          {
            name = "cortex-m-rt";
            packageId = "cortex-m-rt";
            optional = true;
          }
          {
            name = "vcell";
            packageId = "vcell";
          }
        ];
        features = {
          "rt" = [ "cortex-m-rt/device" ];
        };
        resolvedDefaultFeatures = [ "cortex-m-rt" "rt" ];
      };
      "nrf5340-hal" = rec {
        crateName = "nrf5340-hal";
        version = "0.0.0";
        edition = "2018";
        src = pkgs.callPackage ./tarball-v0.0.0.nix {};
        authors = [
          "Jonas Schievink <jonasschievink@gmail.com>"
        ];
        dependencies = [
          {
            name = "nrf5340-app-pac";
            packageId = "nrf5340-app-pac";
            optional = true;
            features = [ "rt" ];
          }
          {
            name = "nrf5340-net-pac";
            packageId = "nrf5340-net-pac";
            optional = true;
            features = [ "rt" ];
          }
        ];
        devDependencies = [
          {
            name = "cortex-m-rt";
            packageId = "cortex-m-rt";
          }
          {
            name = "cortex-m-semihosting";
            packageId = "cortex-m-semihosting";
          }
          {
            name = "panic-semihosting";
            packageId = "panic-semihosting";
          }
        ];
        features = {
          "app-core" = [ "nrf5340-app-pac" ];
          "net-core" = [ "nrf5340-net-pac" ];
        };
        resolvedDefaultFeatures = [ "app-core" "net-core" "nrf5340-app-pac" "nrf5340-net-pac" ];
      };
      "nrf5340-net-pac" = rec {
        crateName = "nrf5340-net-pac";
        version = "0.1.0";
        edition = "2018";
        sha256 = "19rgc6insndz8sq4bs7z9nr9y291ix1l6p906bia4q2qg7bfhdj9";
        authors = [
          "Jonas Schievink <jonasschievink@gmail.com>"
        ];
        dependencies = [
          {
            name = "bare-metal";
            packageId = "bare-metal";
          }
          {
            name = "cortex-m";
            packageId = "cortex-m";
          }
          {
            name = "cortex-m-rt";
            packageId = "cortex-m-rt";
            optional = true;
          }
          {
            name = "vcell";
            packageId = "vcell";
          }
        ];
        features = {
          "rt" = [ "cortex-m-rt/device" ];
        };
        resolvedDefaultFeatures = [ "cortex-m-rt" "rt" ];
      };
      "panic-semihosting" = rec {
        crateName = "panic-semihosting";
        version = "0.5.3";
        edition = "2015";
        sha256 = "0b34ia0pz16j7jnqgps5mililzr1mbs8cllg61mc2xi8hsn68f60";
        authors = [
          "The Cortex-M Team <cortex-m@teams.rust-embedded.org>"
          "Jorge Aparicio <jorge@japaric.io>"
        ];
        dependencies = [
          {
            name = "cortex-m";
            packageId = "cortex-m";
          }
          {
            name = "cortex-m-semihosting";
            packageId = "cortex-m-semihosting";
          }
        ];
        features = {
          "inline-asm" = [ "cortex-m-semihosting/inline-asm" "cortex-m/inline-asm" ];
          "jlink-quirks" = [ "cortex-m-semihosting/jlink-quirks" ];
        };
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
      "r0" = rec {
        crateName = "r0";
        version = "0.2.2";
        edition = "2015";
        sha256 = "07wl91ljvr8ca0d08j5d33fbv5p3v129f62lhrz5r3awn7sqv8z2";
        authors = [
          "Jorge Aparicio <japaricious@gmail.com>"
        ];
        
      };
      "rand" = rec {
        crateName = "rand";
        version = "0.5.6";
        edition = "2015";
        sha256 = "1fdcgja9167hlzkf4g5daqwp498lwiyq7aqm05whklpbsdyc8666";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "rand_core";
            packageId = "rand_core 0.3.1";
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "alloc" = [ "rand_core/alloc" ];
          "default" = [ "std" ];
          "nightly" = [ "i128_support" ];
          "serde1" = [ "serde" "serde_derive" "rand_core/serde1" ];
          "std" = [ "rand_core/std" "alloc" "libc" "winapi" "cloudabi" "fuchsia-cprng" ];
        };
      };
      "rand_core 0.3.1" = rec {
        crateName = "rand_core";
        version = "0.3.1";
        edition = "2015";
        sha256 = "0jzdgszfa4bliigiy4hi66k7fs3gfwi2qxn8vik84ph77fwdwvvs";
        authors = [
          "The Rand Project Developers"
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "rand_core";
            packageId = "rand_core 0.4.2";
          }
        ];
        features = {
          "alloc" = [ "rand_core/alloc" ];
          "default" = [ "std" ];
          "serde1" = [ "rand_core/serde1" ];
          "std" = [ "rand_core/std" ];
        };
      };
      "rand_core 0.4.2" = rec {
        crateName = "rand_core";
        version = "0.4.2";
        edition = "2015";
        sha256 = "1p09ynysrq1vcdlmcqnapq4qakl2yd1ng3kxh3qscpx09k2a6cww";
        authors = [
          "The Rand Project Developers"
          "The Rust Project Developers"
        ];
        features = {
          "serde1" = [ "serde" "serde_derive" ];
          "std" = [ "alloc" ];
        };
      };
      "rustc_version" = rec {
        crateName = "rustc_version";
        version = "0.2.3";
        edition = "2015";
        sha256 = "02h3x57lcr8l2pm0a645s9whdh33pn5cnrwvn5cb57vcrc53x3hk";
        authors = [
          "Marvin Löbel <loebel.marvin@gmail.com>"
        ];
        dependencies = [
          {
            name = "semver";
            packageId = "semver";
          }
        ];
        
      };
      "semver" = rec {
        crateName = "semver";
        version = "0.9.0";
        edition = "2015";
        sha256 = "00q4lkcj0rrgbhviv9sd4p6qmdsipkwkbra7rh11jrhq5kpvjzhx";
        authors = [
          "Steve Klabnik <steve@steveklabnik.com>"
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "semver-parser";
            packageId = "semver-parser";
          }
        ];
        features = {
          "ci" = [ "serde" ];
        };
        resolvedDefaultFeatures = [ "default" ];
      };
      "semver-parser" = rec {
        crateName = "semver-parser";
        version = "0.7.0";
        edition = "2015";
        sha256 = "18vhypw6zgccnrlm5ps1pwa0khz7ry927iznpr88b87cagr1v2iq";
        authors = [
          "Steve Klabnik <steve@steveklabnik.com>"
        ];
        
      };
      "stable_deref_trait" = rec {
        crateName = "stable_deref_trait";
        version = "1.1.1";
        edition = "2015";
        sha256 = "1j2lkgakksmz4vc5hfawcch2ipiskrhjs1sih0f3br7s7rys58fv";
        authors = [
          "Robert Grosse <n210241048576@gmail.com>"
        ];
        features = {
          "default" = [ "std" ];
        };
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
        resolvedDefaultFeatures = [ "clone-impls" "default" "derive" "extra-traits" "full" "parsing" "printing" "proc-macro" "quote" ];
      };
      "typenum" = rec {
        crateName = "typenum";
        version = "1.11.2";
        edition = "2015";
        sha256 = "1ybmfpp7j37zmaw50w35wiwx66lbpr0yp1312c0i333b5pz869vd";
        build = "build/main.rs";
        authors = [
          "Paho Lurie-Gregg <paho@paholg.com>"
          "Andre Bogus <bogusandre@gmail.com>"
        ];
        features = {
        };
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
      "vcell" = rec {
        crateName = "vcell";
        version = "0.1.2";
        edition = "2015";
        sha256 = "0g2b99b6zam4idgc8p9inrig75qi775zg579i513lmpympf34vl7";
        authors = [
          "Jorge Aparicio <japaricious@gmail.com>"
        ];
        features = {
        };
      };
      "volatile-register" = rec {
        crateName = "volatile-register";
        version = "0.2.0";
        edition = "2015";
        sha256 = "11ij0qrab4b1bc78bjm6k2s0hwgr9y22igfnn46r96yr2r3cnrqd";
        authors = [
          "Jorge Aparicio <japaricious@gmail.com>"
          "Jonathan 'theJPster' Pallant <github@thejpster.org.uk>"
        ];
        dependencies = [
          {
            name = "vcell";
            packageId = "vcell";
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
