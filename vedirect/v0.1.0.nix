
# This file was @generated by crate2nix 0.9.0-alpha.1 with the command:
#   "generate" "-o" "/home/jamie/Misc/cratesioout/vedirect/v0.1.0.nix.tmp"
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
    packageId = "vedirect";

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
    "vedirect" = rec {
      packageId = "vedirect";
      build = internal.buildRustCrateWithFeatures {
        packageId = "vedirect";
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
      "anyhow" = rec {
        crateName = "anyhow";
        version = "1.0.27";
        edition = "2018";
        sha256 = "118py2qx9rdflsjla3sxdiimwykzga7lar8bqvwj0gdy5h56wfh1";
        authors = [
          "David Tolnay <dtolnay@gmail.com>"
        ];
        features = {
          "default" = [ "std" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "arrayvec" = rec {
        crateName = "arrayvec";
        version = "0.4.12";
        edition = "2015";
        sha256 = "1fdiv5m627gh6flp4mpmi1mh647imm9x423licsr11psz97d97yd";
        authors = [
          "bluss"
        ];
        dependencies = [
          {
            name = "nodrop";
            packageId = "nodrop";
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "default" = [ "std" ];
          "serde-1" = [ "serde" ];
        };
        resolvedDefaultFeatures = [ "array-sizes-33-128" "default" "std" ];
      };
      "bitflags" = rec {
        crateName = "bitflags";
        version = "1.2.1";
        edition = "2015";
        sha256 = "14qnd5nq8p2almk79m4m8ydqhd413yaxsyjp5xd19g3mikzf47fg";
        authors = [
          "The Rust Project Developers"
        ];
        features = {
        };
        resolvedDefaultFeatures = [ "default" ];
      };
      "cfg-if" = rec {
        crateName = "cfg-if";
        version = "0.1.9";
        edition = "2015";
        sha256 = "0csygklgz3ybpr0670rkip49zh76m43ar3k7xgypkzbzrwycx1ml";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        
      };
      "ioctl-rs" = rec {
        crateName = "ioctl-rs";
        version = "0.1.6";
        edition = "2015";
        sha256 = "0zdrgqxblrwm4ym8pwrr7a4dwjzxrvr1k0qjx6rk1vjwi480b5zp";
        authors = [
          "David Cuddeback <david.cuddeback@gmail.com>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
        ];
        
      };
      "lexical-core" = rec {
        crateName = "lexical-core";
        version = "0.6.7";
        edition = "2015";
        sha256 = "0vxd2b6n5dvhkk09xzcd34rzg8fzif0i2ymcma2sdif9h39ncvgq";
        authors = [
          "Alex Huszagh <ahuszagh@gmail.com>"
        ];
        dependencies = [
          {
            name = "arrayvec";
            packageId = "arrayvec";
            optional = true;
            features = [ "array-sizes-33-128" ];
          }
          {
            name = "bitflags";
            packageId = "bitflags";
          }
          {
            name = "cfg-if";
            packageId = "cfg-if";
          }
          {
            name = "ryu";
            packageId = "ryu";
            optional = true;
          }
          {
            name = "static_assertions";
            packageId = "static_assertions";
            optional = true;
          }
        ];
        buildDependencies = [
          {
            name = "rustc_version";
            packageId = "rustc_version";
          }
        ];
        features = {
          "correct" = [ "arrayvec" "static_assertions" "table" ];
          "default" = [ "correct" "ryu" "std" ];
          "format" = [ "static_assertions" ];
          "grisu3" = [ "dtoa" ];
        };
        resolvedDefaultFeatures = [ "arrayvec" "correct" "default" "ryu" "static_assertions" "std" "table" ];
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
      "memchr" = rec {
        crateName = "memchr";
        version = "2.3.3";
        edition = "2015";
        sha256 = "0074pvsfl938ndl5js14ibc7i9q0k3zp390z843w8nlyv4bxha1p";
        authors = [
          "Andrew Gallant <jamslam@gmail.com>"
          "bluss"
        ];
        features = {
          "default" = [ "std" ];
          "use_std" = [ "std" ];
        };
        resolvedDefaultFeatures = [ "std" "use_std" ];
      };
      "nodrop" = rec {
        crateName = "nodrop";
        version = "0.1.14";
        edition = "2015";
        sha256 = "1fz1v9r8ijacf0hlq0pdv5l9mz8vgqg1snmhvpjmi9aci1b4mvvj";
        authors = [
          "bluss"
        ];
        features = {
          "default" = [ "std" ];
          "use_union" = [ "nodrop-union" ];
        };
      };
      "nom" = rec {
        crateName = "nom";
        version = "5.1.1";
        edition = "2018";
        sha256 = "1mma0q5bzgzbyyjc2w8z0wvff08yaaf28lhmnsj2slwpv99i4iqb";
        authors = [
          "contact@geoffroycouprie.com"
        ];
        dependencies = [
          {
            name = "lexical-core";
            packageId = "lexical-core";
            optional = true;
          }
          {
            name = "memchr";
            packageId = "memchr";
            usesDefaultFeatures = false;
          }
        ];
        buildDependencies = [
          {
            name = "version_check";
            packageId = "version_check";
          }
        ];
        features = {
          "default" = [ "std" "lexical" ];
          "lexical" = [ "lexical-core" ];
          "regexp" = [ "regex" ];
          "regexp_macros" = [ "regexp" "lazy_static" ];
          "std" = [ "alloc" "memchr/use_std" ];
        };
        resolvedDefaultFeatures = [ "alloc" "default" "lexical" "lexical-core" "std" ];
      };
      "proc-macro2" = rec {
        crateName = "proc-macro2";
        version = "1.0.9";
        edition = "2018";
        sha256 = "0d9lr9h0rpa4gi78ha37zqbmkdhrpyjvb5ia94m3ljc1cwf742bc";
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
        version = "1.0.3";
        edition = "2018";
        sha256 = "0zwd6fp74xfg4jnnnwj4v84lkzif2giwj4ch1hka9g35ghc6rp1b";
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
      "serial" = rec {
        crateName = "serial";
        version = "0.4.0";
        edition = "2015";
        sha256 = "11iyvc1z123hn7zl6bk5xpf6xdlsb33qh6xa7g0pghqgayb7l8x1";
        authors = [
          "David Cuddeback <david.cuddeback@gmail.com>"
        ];
        dependencies = [
          {
            name = "serial-core";
            packageId = "serial-core";
          }
          {
            name = "serial-unix";
            packageId = "serial-unix";
            target = { target, features }: target."unix";
          }
          {
            name = "serial-windows";
            packageId = "serial-windows";
            target = { target, features }: target."windows";
          }
        ];
        
      };
      "serial-core" = rec {
        crateName = "serial-core";
        version = "0.4.0";
        edition = "2015";
        sha256 = "10a5lvllz3ljva66bqakrn8cxb3pkaqyapqjw9x760al6jdj0iiz";
        authors = [
          "David Cuddeback <david.cuddeback@gmail.com>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
        ];
        
      };
      "serial-unix" = rec {
        crateName = "serial-unix";
        version = "0.4.0";
        edition = "2015";
        sha256 = "1dyaaca8g4q5qzc2l01yirzs6igmhc9agg4w8m5f4rnqr6jbqgzh";
        authors = [
          "David Cuddeback <david.cuddeback@gmail.com>"
        ];
        dependencies = [
          {
            name = "ioctl-rs";
            packageId = "ioctl-rs";
          }
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "serial-core";
            packageId = "serial-core";
          }
          {
            name = "termios";
            packageId = "termios";
          }
        ];
        
      };
      "serial-windows" = rec {
        crateName = "serial-windows";
        version = "0.4.0";
        edition = "2015";
        sha256 = "0ql1vjy57g2jf218bhmgr98i41faq0v5vzdx3g9payi6fsvx7ihm";
        authors = [
          "David Cuddeback <david.cuddeback@gmail.com>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "serial-core";
            packageId = "serial-core";
          }
        ];
        
      };
      "static_assertions" = rec {
        crateName = "static_assertions";
        version = "0.3.4";
        edition = "2015";
        sha256 = "1lw33i89888yb3x29c6dv4mrkg3534n0rlg3r7qzh4p58xmv6gkz";
        authors = [
          "Nikolai Vazquez"
        ];
        features = {
        };
      };
      "syn" = rec {
        crateName = "syn";
        version = "1.0.16";
        edition = "2018";
        sha256 = "0nbqq296ngd532nv7r2g0rgk3rajdmx2sch9slc08f7vki4xjfqj";
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
        resolvedDefaultFeatures = [ "clone-impls" "default" "derive" "parsing" "printing" "proc-macro" "quote" ];
      };
      "termios" = rec {
        crateName = "termios";
        version = "0.2.2";
        edition = "2015";
        sha256 = "0fk8nl0rmk43jrh6hjz6c6d83ri7l6fikag6lh0ffz3di9cwznfm";
        authors = [
          "David Cuddeback <david.cuddeback@gmail.com>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
        ];
        
      };
      "thiserror" = rec {
        crateName = "thiserror";
        version = "1.0.11";
        edition = "2018";
        sha256 = "1nzlpqv6bnza6icvm8v7znb2l14yhw1w12wygil4rav7cy7by57f";
        authors = [
          "David Tolnay <dtolnay@gmail.com>"
        ];
        dependencies = [
          {
            name = "thiserror-impl";
            packageId = "thiserror-impl";
          }
        ];
        
      };
      "thiserror-impl" = rec {
        crateName = "thiserror-impl";
        version = "1.0.11";
        edition = "2018";
        sha256 = "1x1yrnbyyfx4d8gfc5r61w2hkgk0z70gp5751f2a1da4phgixdd7";
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
      "vedirect" = rec {
        crateName = "vedirect";
        version = "0.1.0";
        edition = "2018";
        src = pkgs.callPackage ./tarball-v0.1.0.nix {};
        authors = [
          "dbr <dbr.onix@gmail.com>"
        ];
        dependencies = [
          {
            name = "nom";
            packageId = "nom";
          }
          {
            name = "thiserror";
            packageId = "thiserror";
          }
        ];
        devDependencies = [
          {
            name = "anyhow";
            packageId = "anyhow";
          }
          {
            name = "serial";
            packageId = "serial";
          }
        ];
        
      };
      "version_check" = rec {
        crateName = "version_check";
        version = "0.9.1";
        edition = "2015";
        sha256 = "1kikqlnggii1rvnxrbls55sc46lxvinz5k3giscgncjj4p87b1q7";
        authors = [
          "Sergio Benitez <sb@sergio.bz>"
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
