
# This file was @generated by crate2nix 0.9.0-alpha.1 with the command:
#   "generate" "-o" "/home/jamie/Misc/cratesioout/xc2bit/v0.0.4.nix.tmp"
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
    packageId = "xc2bit";

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
    "xc2bit" = rec {
      packageId = "xc2bit";
      build = internal.buildRustCrateWithFeatures {
        packageId = "xc2bit";
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
      "bittwiddler" = rec {
        crateName = "bittwiddler";
        version = "0.0.2";
        edition = "2018";
        sha256 = "1m93rppq85f194yqbsi7xj3y6csqbka401lvbj6f4pqg15dz74f4";
        procMacro = true;
        authors = [
          "Robert Ou <rqou@robertou.com>"
        ];
        dependencies = [
          {
            name = "quote";
            packageId = "quote 0.5.1";
          }
          {
            name = "syn";
            packageId = "syn 0.13.1";
            features = [ "extra-traits" ];
          }
        ];
        
      };
      "dtoa" = rec {
        crateName = "dtoa";
        version = "0.4.2";
        edition = "2015";
        sha256 = "1ashiv223ns5p94ip8r5zxxmv2c3hh0pdsm4rcax4x5m7ly7bhq9";
        authors = [
          "David Tolnay <dtolnay@gmail.com>"
        ];
        
      };
      "itoa" = rec {
        crateName = "itoa";
        version = "0.3.4";
        edition = "2015";
        sha256 = "136vwi6l2k1vrlvfx49lhficj813pk88xrcx1q3axqh1mwms6943";
        authors = [
          "David Tolnay <dtolnay@gmail.com>"
        ];
        features = {
        };
      };
      "jedec" = rec {
        crateName = "jedec";
        version = "0.0.3";
        edition = "2018";
        sha256 = "04hkgq70f6sxgxml2aknw8cqjvry1xd1b8znw8l2fr90nngch1h3";type = [ "rlib" ];
        authors = [
          "Robert Ou <rqou@robertou.com>"
        ];
        
      };
      "num-traits 0.1.43" = rec {
        crateName = "num-traits";
        version = "0.1.43";
        edition = "2015";
        sha256 = "0c9whknf2dm74a3cqirafy6gj83a76gl56g4v3g19k6lkwz13rcj";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "num-traits";
            packageId = "num-traits 0.2.0";
          }
        ];
        
      };
      "num-traits 0.2.0" = rec {
        crateName = "num-traits";
        version = "0.2.0";
        edition = "2015";
        sha256 = "046g0jjnlxmxmk1li6whf7g9mzc12vvxi3pf8l6957fv8vqj1pp7";
        authors = [
          "The Rust Project Developers"
        ];
        features = {
          "default" = [ "std" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "proc-macro2" = rec {
        crateName = "proc-macro2";
        version = "0.3.6";
        edition = "2015";
        sha256 = "0651cjx7d0mnpirfm0027hpmlvglbpq1q38ylpll7dl1vhhsbdj9";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        dependencies = [
          {
            name = "unicode-xid";
            packageId = "unicode-xid 0.1.0";
          }
        ];
        features = {
          "default" = [ "proc-macro" ];
          "nightly" = [ "proc-macro" ];
        };
        resolvedDefaultFeatures = [ "proc-macro" ];
      };
      "quote 0.3.15" = rec {
        crateName = "quote";
        version = "0.3.15";
        edition = "2015";
        sha256 = "0yhnnix4dzsv8y4wwz4csbnqjfh73al33j35msr10py6cl5r4vks";
        authors = [
          "David Tolnay <dtolnay@gmail.com>"
        ];
        
      };
      "quote 0.5.1" = rec {
        crateName = "quote";
        version = "0.5.1";
        edition = "2015";
        sha256 = "0aixw7xp4fxhv0gqx9nvl1g7rrx2xa7jjm6i7ysw33gjh89ga3vv";
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
      "serde" = rec {
        crateName = "serde";
        version = "1.0.27";
        edition = "2015";
        sha256 = "09l53dkxlqg73jdi61jskc0qb1hx0gsmfq4rn8dsbyi0ks8z76fv";
        authors = [
          "Erick Tryzelaar <erick.tryzelaar@gmail.com>"
          "David Tolnay <dtolnay@gmail.com>"
        ];
        features = {
          "alloc" = [ "unstable" ];
          "default" = [ "std" ];
          "derive" = [ "serde_derive" ];
          "playground" = [ "serde_derive" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "serde_derive" = rec {
        crateName = "serde_derive";
        version = "1.0.27";
        edition = "2015";
        sha256 = "1l1zpl1jm769mvk50002kf128ml8d33brkgfkvl5adz9ry8pbfpl";
        procMacro = true;
        authors = [
          "Erick Tryzelaar <erick.tryzelaar@gmail.com>"
          "David Tolnay <dtolnay@gmail.com>"
        ];
        dependencies = [
          {
            name = "quote";
            packageId = "quote 0.3.15";
          }
          {
            name = "serde_derive_internals";
            packageId = "serde_derive_internals";
            usesDefaultFeatures = false;
          }
          {
            name = "syn";
            packageId = "syn 0.11.11";
            features = [ "visit" ];
          }
        ];
        features = {
        };
        resolvedDefaultFeatures = [ "default" ];
      };
      "serde_derive_internals" = rec {
        crateName = "serde_derive_internals";
        version = "0.19.0";
        edition = "2015";
        sha256 = "1damvp27z4dc2bspapcrmqhmjsi4v6yjdf69lnhb0gqcag4z20vf";
        authors = [
          "Erick Tryzelaar <erick.tryzelaar@gmail.com>"
          "David Tolnay <dtolnay@gmail.com>"
        ];
        dependencies = [
          {
            name = "syn";
            packageId = "syn 0.11.11";
            usesDefaultFeatures = false;
            features = [ "parsing" ];
          }
          {
            name = "synom";
            packageId = "synom";
          }
        ];
        
      };
      "serde_json" = rec {
        crateName = "serde_json";
        version = "1.0.9";
        edition = "2015";
        sha256 = "1jqbn6gh0fwk9wbln4nnpvqsqlfxrib9cwg8gx5lqfnnqxk75ny9";
        authors = [
          "Erick Tryzelaar <erick.tryzelaar@gmail.com>"
          "David Tolnay <dtolnay@gmail.com>"
        ];
        dependencies = [
          {
            name = "dtoa";
            packageId = "dtoa";
          }
          {
            name = "itoa";
            packageId = "itoa";
          }
          {
            name = "num-traits";
            packageId = "num-traits 0.1.43";
          }
          {
            name = "serde";
            packageId = "serde";
          }
        ];
        features = {
          "preserve_order" = [ "linked-hash-map" ];
        };
        resolvedDefaultFeatures = [ "default" ];
      };
      "slog" = rec {
        crateName = "slog";
        version = "2.5.2";
        edition = "2015";
        sha256 = "16bv6zrdn1sm315vbnia02g31xvsmbjyz5gv3z0vrgxdli0cdj8w";
        authors = [
          "Dawid Ciężarkiewicz <dpc@dpc.pw>"
        ];
        features = {
          "default" = [ "std" ];
          "nested-values" = [ "erased-serde" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "syn 0.11.11" = rec {
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
            packageId = "quote 0.3.15";
            optional = true;
          }
          {
            name = "synom";
            packageId = "synom";
            optional = true;
          }
          {
            name = "unicode-xid";
            packageId = "unicode-xid 0.0.4";
            optional = true;
          }
        ];
        features = {
          "default" = [ "parsing" "printing" ];
          "parsing" = [ "unicode-xid" "synom" ];
          "printing" = [ "quote" ];
        };
        resolvedDefaultFeatures = [ "default" "parsing" "printing" "quote" "synom" "unicode-xid" "visit" ];
      };
      "syn 0.13.1" = rec {
        crateName = "syn";
        version = "0.13.1";
        edition = "2015";
        sha256 = "0ngzrvjz2gd62zzh97i56pay6hc591w92jyjhc7411r0axvjidci";
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
            packageId = "quote 0.5.1";
            optional = true;
            usesDefaultFeatures = false;
          }
          {
            name = "unicode-xid";
            packageId = "unicode-xid 0.1.0";
          }
        ];
        features = {
          "default" = [ "derive" "parsing" "printing" "clone-impls" "proc-macro" ];
          "printing" = [ "quote" ];
          "proc-macro" = [ "proc-macro2/proc-macro" "quote/proc-macro" ];
        };
        resolvedDefaultFeatures = [ "clone-impls" "default" "derive" "extra-traits" "parsing" "printing" "proc-macro" "quote" ];
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
            packageId = "unicode-xid 0.0.4";
          }
        ];
        
      };
      "unicode-xid 0.0.4" = rec {
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
      "unicode-xid 0.1.0" = rec {
        crateName = "unicode-xid";
        version = "0.1.0";
        edition = "2015";
        sha256 = "1z57lqh4s18rr4x0j4fw4fmp9hf9346h0kmdgqsqx0fhjr3k0wpw";
        authors = [
          "erick.tryzelaar <erick.tryzelaar@gmail.com>"
          "kwantam <kwantam@gmail.com>"
        ];
        features = {
        };
        resolvedDefaultFeatures = [ "default" ];
      };
      "xc2bit" = rec {
        crateName = "xc2bit";
        version = "0.0.4";
        edition = "2018";
        crateBin = [
          { name = "xc2structuretest"; path = "src/bin/xc2structuretest.rs"; }
          { name = "xc2jedroundtrip"; path = "src/bin/xc2jedroundtrip.rs"; }
          { name = "xc2jeddump"; path = "src/bin/xc2jeddump.rs"; }
          { name = "xc2jedblank"; path = "src/bin/xc2jedblank.rs"; }
          { name = "xc2jed2json"; path = "src/bin/xc2jed2json.rs"; }
          { name = "xc2jed2crbit"; path = "src/bin/xc2jed2crbit.rs"; }
          { name = "xc2crbit2jed"; path = "src/bin/xc2crbit2jed.rs"; }
        ];
        src = pkgs.callPackage ./tarball-v0.0.4.nix {};
        authors = [
          "Robert Ou <rqou@robertou.com>"
        ];
        dependencies = [
          {
            name = "bittwiddler";
            packageId = "bittwiddler";
          }
          {
            name = "jedec";
            packageId = "jedec";
          }
          {
            name = "serde";
            packageId = "serde";
          }
          {
            name = "serde_derive";
            packageId = "serde_derive";
          }
          {
            name = "yosys-netlist-json";
            packageId = "yosys-netlist-json";
          }
        ];
        
      };
      "yosys-netlist-json" = rec {
        crateName = "yosys-netlist-json";
        version = "0.0.3";
        edition = "2018";
        sha256 = "0qg82bww8cvbwlmrnj0diyvvsf1gz1k9fkg5h0gb8ax80z9i48qh";type = [ "rlib" ];
        authors = [
          "Robert Ou <rqou@robertou.com>"
        ];
        dependencies = [
          {
            name = "serde";
            packageId = "serde";
          }
          {
            name = "serde_derive";
            packageId = "serde_derive";
          }
          {
            name = "serde_json";
            packageId = "serde_json";
          }
          {
            name = "slog";
            packageId = "slog";
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
