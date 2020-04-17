
# This file was @generated by crate2nix 0.9.0-alpha.1 with the command:
#   "generate" "-o" "/home/jamie/Misc/cratesioout/blend/v0.6.0.nix.tmp"
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
    packageId = "blend";

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
    "blend" = rec {
      packageId = "blend";
      build = internal.buildRustCrateWithFeatures {
        packageId = "blend";
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
      "arrayvec" = rec {
        crateName = "arrayvec";
        version = "0.4.11";
        edition = "2015";
        sha256 = "1fmhq4ljxr954mdyazaqa9kdxryl5d2ggr5rialylrd6xndkzmxq";
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
      "blend" = rec {
        crateName = "blend";
        version = "0.6.0";
        edition = "2018";
        src = pkgs.callPackage ./tarball-v0.6.0.nix {};
        authors = [
          "Lucas Bittencourt <lbittencs@gmail.com>"
        ];
        dependencies = [
          {
            name = "linked-hash-map";
            packageId = "linked-hash-map";
          }
          {
            name = "nom";
            packageId = "nom";
          }
        ];
        devDependencies = [
          {
            name = "libflate";
            packageId = "libflate";
          }
          {
            name = "walkdir";
            packageId = "walkdir";
          }
        ];
        
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
      "lexical-core" = rec {
        crateName = "lexical-core";
        version = "0.4.5";
        edition = "2015";
        sha256 = "1lin591h548nw4kn5gm8n8bz6z3dl7g3q24zvym9n97xiy9g648d";type = [ "lib" "staticlib" "cdylib" ];
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
          }
        ];
        buildDependencies = [
          {
            name = "rustc_version";
            packageId = "rustc_version";
          }
        ];
        features = {
          "correct" = [ "arrayvec" "table" ];
          "default" = [ "correct" "ryu" "std" ];
          "grisu3" = [ "dtoa" ];
        };
        resolvedDefaultFeatures = [ "arrayvec" "correct" "default" "ryu" "std" "table" ];
      };
      "libflate" = rec {
        crateName = "libflate";
        version = "0.1.27";
        edition = "2015";
        sha256 = "1p8z839c5lpl0g01mf8iglys9lgcjxw6xjw56crhwp8z7gs5s4yr";
        authors = [
          "Takeru Ohta <phjgt308@gmail.com>"
        ];
        dependencies = [
          {
            name = "adler32";
            packageId = "adler32";
          }
          {
            name = "crc32fast";
            packageId = "crc32fast";
          }
          {
            name = "rle-decode-fast";
            packageId = "rle-decode-fast";
          }
          {
            name = "take_mut";
            packageId = "take_mut";
          }
        ];
        
      };
      "linked-hash-map" = rec {
        crateName = "linked-hash-map";
        version = "0.5.2";
        edition = "2015";
        sha256 = "10qgbvh00q36ql0jh00rxh2jlq6qvl11n6mig0cvkpf4xf5bd4df";
        authors = [
          "Stepan Koltsov <stepan.koltsov@gmail.com>"
          "Andrew Paseltiner <apaseltiner@gmail.com>"
        ];
        features = {
          "heapsize_impl" = [ "heapsize" ];
          "serde_impl" = [ "serde" "serde_test" ];
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
        features = {
          "default" = [ "use_std" ];
        };
        resolvedDefaultFeatures = [ "use_std" ];
      };
      "nodrop" = rec {
        crateName = "nodrop";
        version = "0.1.13";
        edition = "2015";
        sha256 = "0if9ifn6rvar5jirx4b3qh4sl5kjkmcifycvzhxa9j3crkfng5ig";
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
        version = "5.0.1";
        edition = "2018";
        sha256 = "1jimv9sh1l5dh6dzbxaixw3a26gq766ndrl470l02i6s48sbc666";
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
      "rle-decode-fast" = rec {
        crateName = "rle-decode-fast";
        version = "1.0.1";
        edition = "2015";
        sha256 = "1b4h7qs4mssc5dnlhs3f91ya8pb40bv72zzshl18gify2jllzgna";
        authors = [
          "Moritz Wanzenböck <moritz@wanzenbug.xyz>"
        ];
        features = {
          "bench" = [ "criterion" ];
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
      "ryu" = rec {
        crateName = "ryu";
        version = "1.0.0";
        edition = "2015";
        sha256 = "15r9z2wzgbj04pks4jz7y6wif5xqhf1wqkl2nd7qrvn08ys68969";
        authors = [
          "David Tolnay <dtolnay@gmail.com>"
        ];
        features = {
        };
      };
      "same-file" = rec {
        crateName = "same-file";
        version = "1.0.5";
        edition = "2015";
        sha256 = "08a4zy10pjindf2rah320s6shgswk13mqw7s61m8i1y1xpf8spjq";
        authors = [
          "Andrew Gallant <jamslam@gmail.com>"
        ];
        dependencies = [
          {
            name = "winapi-util";
            packageId = "winapi-util";
            target = { target, features }: target."windows";
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
      "take_mut" = rec {
        crateName = "take_mut";
        version = "0.2.2";
        edition = "2015";
        sha256 = "0q2d7w6nd5bl7bay5csq065sjg8fw0jcx6hl1983cpzf25fh0r7p";
        authors = [
          "Sgeo <sgeoster@gmail.com>"
        ];
        
      };
      "version_check" = rec {
        crateName = "version_check";
        version = "0.1.5";
        edition = "2015";
        sha256 = "1pf91pvj8n6akh7w6j5ypka6aqz08b3qpzgs0ak2kjf4frkiljwi";
        authors = [
          "Sergio Benitez <sb@sergio.bz>"
        ];
        
      };
      "walkdir" = rec {
        crateName = "walkdir";
        version = "2.2.9";
        edition = "2015";
        sha256 = "07ppalpvxkf8cnqr64np422792y4z5bs9m8b4nrflh5rm17wjn4n";
        authors = [
          "Andrew Gallant <jamslam@gmail.com>"
        ];
        dependencies = [
          {
            name = "same-file";
            packageId = "same-file";
          }
          {
            name = "winapi";
            packageId = "winapi";
            target = { target, features }: target."windows";
            features = [ "std" "winnt" ];
          }
          {
            name = "winapi-util";
            packageId = "winapi-util";
            target = { target, features }: target."windows";
          }
        ];
        
      };
      "winapi" = rec {
        crateName = "winapi";
        version = "0.3.8";
        edition = "2015";
        sha256 = "1ii9j9lzrhwri0902652awifzx9fpayimbp6hfhhc296xcg0k4w0";
        authors = [
          "Peter Atashian <retep998@gmail.com>"
        ];
        dependencies = [
          {
            name = "winapi-i686-pc-windows-gnu";
            packageId = "winapi-i686-pc-windows-gnu";
            target = { target, features }: (stdenv.hostPlatform.config == "i686-pc-windows-gnu");
          }
          {
            name = "winapi-x86_64-pc-windows-gnu";
            packageId = "winapi-x86_64-pc-windows-gnu";
            target = { target, features }: (stdenv.hostPlatform.config == "x86_64-pc-windows-gnu");
          }
        ];
        features = {
          "debug" = [ "impl-debug" ];
        };
        resolvedDefaultFeatures = [ "consoleapi" "errhandlingapi" "fileapi" "minwindef" "processenv" "std" "winbase" "wincon" "winerror" "winnt" ];
      };
      "winapi-i686-pc-windows-gnu" = rec {
        crateName = "winapi-i686-pc-windows-gnu";
        version = "0.4.0";
        edition = "2015";
        sha256 = "1dmpa6mvcvzz16zg6d5vrfy4bxgg541wxrcip7cnshi06v38ffxc";
        authors = [
          "Peter Atashian <retep998@gmail.com>"
        ];
        
      };
      "winapi-util" = rec {
        crateName = "winapi-util";
        version = "0.1.2";
        edition = "2015";
        sha256 = "1j839dc6y8vszvrsb7yk0qvs0w6asnahxzbyans37vnsw6vbls3i";
        authors = [
          "Andrew Gallant <jamslam@gmail.com>"
        ];
        dependencies = [
          {
            name = "winapi";
            packageId = "winapi";
            target = { target, features }: target."windows";
            features = [ "std" "consoleapi" "errhandlingapi" "fileapi" "minwindef" "processenv" "winbase" "wincon" "winerror" "winnt" ];
          }
        ];
        
      };
      "winapi-x86_64-pc-windows-gnu" = rec {
        crateName = "winapi-x86_64-pc-windows-gnu";
        version = "0.4.0";
        edition = "2015";
        sha256 = "0gqq64czqb64kskjryj8isp62m2sgvx25yyj3kpc2myh85w24bki";
        authors = [
          "Peter Atashian <retep998@gmail.com>"
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
