
# This file was @generated by crate2nix 0.9.0-alpha.1 with the command:
#   "generate" "-o" "/home/jamie/Misc/cratesioout/tree-automata/v0.1.0.nix.tmp"
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
    packageId = "tree-automata";

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
    "tree-automata" = rec {
      packageId = "tree-automata";
      build = internal.buildRustCrateWithFeatures {
        packageId = "tree-automata";
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
      "c2-chacha" = rec {
        crateName = "c2-chacha";
        version = "0.2.2";
        edition = "2018";
        sha256 = "00a11qdc8mg3z0k613rhprkc9p6xz0y7b1681x32ixg0hr3x0r3x";
        authors = [
          "The CryptoCorrosion Contributors"
        ];
        dependencies = [
          {
            name = "lazy_static";
            packageId = "lazy_static";
            optional = true;
          }
          {
            name = "ppv-lite86";
            packageId = "ppv-lite86";
            rename = "ppv-lite86";
          }
        ];
        features = {
          "default" = [ "std" "simd" "rustcrypto_api" ];
          "rustcrypto_api" = [ "stream-cipher" "byteorder" ];
          "simd" = [ "ppv-lite86/simd" ];
          "std" = [ "lazy_static" ];
        };
        resolvedDefaultFeatures = [ "lazy_static" "simd" "std" ];
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
      "crossbeam-channel" = rec {
        crateName = "crossbeam-channel";
        version = "0.3.9";
        edition = "2015";
        sha256 = "1ylyzb1m9qbvd1nd3vy38x9073wdmcy295ncjs7wf7ap476pzv68";
        authors = [
          "The Crossbeam Project Developers"
        ];
        dependencies = [
          {
            name = "crossbeam-utils";
            packageId = "crossbeam-utils";
          }
        ];
        
      };
      "crossbeam-utils" = rec {
        crateName = "crossbeam-utils";
        version = "0.6.6";
        edition = "2015";
        sha256 = "1rk0r9n04bmq4a3g2q5qhvvlmrmx780gc6h9lmc94mwndslkz5q4";
        authors = [
          "The Crossbeam Project Developers"
        ];
        dependencies = [
          {
            name = "cfg-if";
            packageId = "cfg-if";
          }
          {
            name = "lazy_static";
            packageId = "lazy_static";
            optional = true;
          }
        ];
        features = {
          "default" = [ "std" ];
          "std" = [ "lazy_static" ];
        };
        resolvedDefaultFeatures = [ "default" "lazy_static" "std" ];
      };
      "getrandom" = rec {
        crateName = "getrandom";
        version = "0.1.11";
        edition = "2018";
        sha256 = "0wiq4i9vh4zwc4q4kbvr4sa45k51n2wy4pwb3q9yp3w6sc14nd7w";
        authors = [
          "The Rand Project Developers"
        ];
        dependencies = [
          {
            name = "cfg-if";
            packageId = "cfg-if";
          }
          {
            name = "libc";
            packageId = "libc";
            usesDefaultFeatures = false;
            target = { target, features }: (target."unix" || (target."os" == "redox"));
          }
          {
            name = "wasi";
            packageId = "wasi";
            target = { target, features }: (target."os" == "wasi");
          }
        ];
        features = {
          "rustc-dep-of-std" = [ "compiler_builtins" "core" ];
        };
        resolvedDefaultFeatures = [ "std" ];
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
      };
      "ppv-lite86" = rec {
        crateName = "ppv-lite86";
        version = "0.2.5";
        edition = "2018";
        sha256 = "06snnv338w341nicfqba2jgln5dsla72ndkgrw7h1dfdb3vgkjz3";
        authors = [
          "The CryptoCorrosion Contributors"
        ];
        features = {
          "default" = [ "std" "simd" ];
        };
        resolvedDefaultFeatures = [ "default" "simd" "std" ];
      };
      "rand" = rec {
        crateName = "rand";
        version = "0.7.0";
        edition = "2018";
        sha256 = "0b05gwx8nnxr9bydyjxd1rszdvqnm946ky15z103ssfrhc7anznl";
        authors = [
          "The Rand Project Developers"
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "getrandom";
            packageId = "getrandom";
            rename = "getrandom_package";
            optional = true;
          }
          {
            name = "libc";
            packageId = "libc";
            usesDefaultFeatures = false;
            target = { target, features }: target."unix";
          }
          {
            name = "rand_chacha";
            packageId = "rand_chacha";
            target = { target, features }: (!(target."os" == "emscripten"));
          }
          {
            name = "rand_core";
            packageId = "rand_core";
          }
          {
            name = "rand_hc";
            packageId = "rand_hc";
            target = { target, features }: (target."os" == "emscripten");
          }
        ];
        devDependencies = [
          {
            name = "rand_hc";
            packageId = "rand_hc";
          }
        ];
        features = {
          "alloc" = [ "rand_core/alloc" ];
          "default" = [ "std" ];
          "getrandom" = [ "getrandom_package" "rand_core/getrandom" ];
          "nightly" = [ "simd_support" ];
          "simd_support" = [ "packed_simd" ];
          "small_rng" = [ "rand_pcg" ];
          "std" = [ "rand_core/std" "alloc" "getrandom" ];
          "stdweb" = [ "getrandom_package/stdweb" ];
          "wasm-bindgen" = [ "getrandom_package/wasm-bindgen" ];
        };
        resolvedDefaultFeatures = [ "alloc" "default" "getrandom" "getrandom_package" "std" ];
      };
      "rand_chacha" = rec {
        crateName = "rand_chacha";
        version = "0.2.1";
        edition = "2018";
        sha256 = "0lv8imzzl4h2glm6sjj8mkvasgi8jym23ya48dakyln7m06sk8h3";
        authors = [
          "The Rand Project Developers"
          "The Rust Project Developers"
          "The CryptoCorrosion Contributors"
        ];
        dependencies = [
          {
            name = "c2-chacha";
            packageId = "c2-chacha";
            usesDefaultFeatures = false;
            features = [ "simd" ];
          }
          {
            name = "rand_core";
            packageId = "rand_core";
          }
        ];
        features = {
          "default" = [ "std" "simd" ];
          "std" = [ "c2-chacha/std" ];
        };
        resolvedDefaultFeatures = [ "default" "simd" "std" ];
      };
      "rand_core" = rec {
        crateName = "rand_core";
        version = "0.5.0";
        edition = "2015";
        sha256 = "1jis94x9ri8xlxki2w2w5k29sjpfwgzkjylg7paganp74hrnhpk1";
        authors = [
          "The Rand Project Developers"
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "getrandom";
            packageId = "getrandom";
            optional = true;
          }
        ];
        features = {
          "serde1" = [ "serde" "serde_derive" ];
          "std" = [ "alloc" "getrandom" "getrandom/std" ];
        };
        resolvedDefaultFeatures = [ "alloc" "getrandom" "std" ];
      };
      "rand_hc" = rec {
        crateName = "rand_hc";
        version = "0.2.0";
        edition = "2018";
        sha256 = "0g31sqwpmsirdlwr0svnacr4dbqyz339im4ssl9738cjgfpjjcfa";
        authors = [
          "The Rand Project Developers"
        ];
        dependencies = [
          {
            name = "rand_core";
            packageId = "rand_core";
          }
        ];
        
      };
      "terms" = rec {
        crateName = "terms";
        version = "0.1.1";
        edition = "2018";
        sha256 = "0g40j82qrrjj8cnj43dm2rbm7x6f494hmvmsdqa71zf9bf91dp6r";
        authors = [
          "Timothée Haudebourg <timothee.haudebourg@irisa.fr>"
        ];
        dependencies = [
          {
            name = "rand";
            packageId = "rand";
          }
        ];
        
      };
      "tree-automata" = rec {
        crateName = "tree-automata";
        version = "0.1.0";
        edition = "2018";
        src = pkgs.callPackage ./tarball-v0.1.0.nix {};
        authors = [
          "timothee.haudebourg@irisa.fr"
        ];
        dependencies = [
          {
            name = "crossbeam-channel";
            packageId = "crossbeam-channel";
          }
          {
            name = "terms";
            packageId = "terms";
          }
        ];
        
      };
      "wasi" = rec {
        crateName = "wasi";
        version = "0.5.0";
        edition = "2018";
        sha256 = "1ir3pd4phdfml0cbziw9bqp7mnk0vfp9biy8bh25lln6raml4m7x";
        authors = [
          "The Cranelift Project Developers"
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
