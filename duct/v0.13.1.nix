
# This file was @generated by crate2nix 0.9.0-alpha.1 with the command:
#   "generate" "-o" "/home/jamie/Misc/cratesioout/duct/v0.13.1.nix.tmp"
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
    packageId = "duct";

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
    "duct" = rec {
      packageId = "duct";
      build = internal.buildRustCrateWithFeatures {
        packageId = "duct";
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
      "duct" = rec {
        crateName = "duct";
        version = "0.13.1";
        edition = "2018";
        crateBin = [
          { name = "x_to_y"; path = "src/bin/x_to_y.rs"; }
          { name = "status"; path = "src/bin/status.rs"; }
          { name = "sleep"; path = "src/bin/sleep.rs"; }
          { name = "pwd"; path = "src/bin/pwd.rs"; }
          { name = "print_env"; path = "src/bin/print_env.rs"; }
          { name = "exe_in_dir"; path = "src/bin/exe_in_dir.rs"; }
          { name = "echo"; path = "src/bin/echo.rs"; }
          { name = "child_grandchild"; path = "src/bin/child_grandchild.rs"; }
          { name = "cat"; path = "src/bin/cat.rs"; }
        ];
        src = pkgs.callPackage ./tarball-v0.13.1.nix {};
        authors = [
          "oconnor663@gmail.com"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
            target = { target, features }: target."unix";
          }
          {
            name = "once_cell";
            packageId = "once_cell";
          }
          {
            name = "os_pipe";
            packageId = "os_pipe";
          }
          {
            name = "shared_child";
            packageId = "shared_child";
          }
        ];
        devDependencies = [
          {
            name = "tempdir";
            packageId = "tempdir";
          }
        ];
        
      };
      "fuchsia-cprng" = rec {
        crateName = "fuchsia-cprng";
        version = "0.1.1";
        edition = "2018";
        sha256 = "1fnkqrbz7ixxzsb04bsz9p0zzazanma8znfdqjvh39n14vapfvx0";
        authors = [
          "Erick Tryzelaar <etryzelaar@google.com>"
        ];
        
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
      "once_cell" = rec {
        crateName = "once_cell";
        version = "1.2.0";
        edition = "2018";
        sha256 = "1vdz8xlg3r05w3wfjimnc347hgm54i5nrqf72r4mlp0fcdplh7w9";
        authors = [
          "Aleksey Kladov <aleksey.kladov@gmail.com>"
        ];
        features = {
          "default" = [ "std" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "os_pipe" = rec {
        crateName = "os_pipe";
        version = "0.9.1";
        edition = "2018";
        crateBin = [];
        sha256 = "08ma8w5qsi11sz33h9j671a32v22267d1ck5562wx43hb8shckfv";
        authors = [
          "Jack O'Connor"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
            target = { target, features }: (!target."windows");
          }
          {
            name = "winapi";
            packageId = "winapi";
            target = { target, features }: target."windows";
            features = [ "handleapi" "namedpipeapi" "processthreadsapi" "winnt" ];
          }
        ];
        
      };
      "rand" = rec {
        crateName = "rand";
        version = "0.4.6";
        edition = "2015";
        sha256 = "14qjfv3gggzhnma20k0sc1jf8y6pplsaq7n1j9ls5c8kf2wl0a2m";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "fuchsia-cprng";
            packageId = "fuchsia-cprng";
            target = { target, features }: (target."os" == "fuchsia");
          }
          {
            name = "libc";
            packageId = "libc";
            optional = true;
            target = { target, features }: target."unix";
          }
          {
            name = "rand_core";
            packageId = "rand_core 0.3.1";
            usesDefaultFeatures = false;
            target = { target, features }: (target."env" == "sgx");
          }
          {
            name = "rdrand";
            packageId = "rdrand";
            target = { target, features }: (target."env" == "sgx");
          }
          {
            name = "winapi";
            packageId = "winapi";
            target = { target, features }: target."windows";
            features = [ "minwindef" "ntsecapi" "profileapi" "winnt" ];
          }
        ];
        features = {
          "default" = [ "std" ];
          "nightly" = [ "i128_support" ];
          "std" = [ "libc" ];
        };
        resolvedDefaultFeatures = [ "default" "libc" "std" ];
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
      "rdrand" = rec {
        crateName = "rdrand";
        version = "0.4.0";
        edition = "2015";
        sha256 = "1cjq0kwx1bk7jx3kzyciiish5gqsj7620dm43dc52sr8fzmm9037";
        authors = [
          "Simonas Kazlauskas <rdrand@kazlauskas.me>"
        ];
        dependencies = [
          {
            name = "rand_core";
            packageId = "rand_core 0.3.1";
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "default" = [ "std" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "remove_dir_all" = rec {
        crateName = "remove_dir_all";
        version = "0.5.2";
        edition = "2015";
        sha256 = "0bkrlyg26mgizpiy1yb2hhpgscxcag8r5fnckqsvk25608vzm0sa";
        authors = [
          "Aaronepower <theaaronepower@gmail.com>"
        ];
        dependencies = [
          {
            name = "winapi";
            packageId = "winapi";
            target = { target, features }: target."windows";
            features = [ "std" "errhandlingapi" "winerror" "fileapi" "winbase" ];
          }
        ];
        
      };
      "shared_child" = rec {
        crateName = "shared_child";
        version = "0.3.4";
        edition = "2015";
        sha256 = "1lmjmr7931dr9cpalw2n7ss4i9mnl7285j2dygxflk9y80xczswc";
        authors = [
          "jacko"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
            target = { target, features }: (!target."windows");
          }
          {
            name = "winapi";
            packageId = "winapi";
            target = { target, features }: target."windows";
            features = [ "synchapi" "winbase" "winerror" "winnt" ];
          }
        ];
        
      };
      "tempdir" = rec {
        crateName = "tempdir";
        version = "0.3.7";
        edition = "2015";
        sha256 = "1n5n86zxpgd85y0mswrp5cfdisizq2rv3la906g6ipyc03xvbwhm";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "rand";
            packageId = "rand";
          }
          {
            name = "remove_dir_all";
            packageId = "remove_dir_all";
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
        resolvedDefaultFeatures = [ "errhandlingapi" "fileapi" "handleapi" "minwindef" "namedpipeapi" "ntsecapi" "processthreadsapi" "profileapi" "std" "synchapi" "winbase" "winerror" "winnt" ];
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
