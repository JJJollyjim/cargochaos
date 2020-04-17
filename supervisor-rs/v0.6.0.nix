
# This file was @generated by crate2nix 0.9.0-alpha.1 with the command:
#   "generate" "-o" "/home/jamie/Misc/cratesioout/supervisor-rs/v0.6.0.nix.tmp"
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
    packageId = "supervisor-rs";

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
    "supervisor-rs" = rec {
      packageId = "supervisor-rs";
      build = internal.buildRustCrateWithFeatures {
        packageId = "supervisor-rs";
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
      "cc" = rec {
        crateName = "cc";
        version = "1.0.50";
        edition = "2018";
        crateBin = [];
        sha256 = "1kdqm8ka7xg9h56b694pcz29ka33fsz27mzrphqc78gx96h8zqlm";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        features = {
          "parallel" = [ "jobserver" ];
        };
      };
      "cfg-if" = rec {
        crateName = "cfg-if";
        version = "0.1.10";
        edition = "2018";
        sha256 = "08h80ihs74jcyp24cd75wwabygbbdgl05k6p5dmq8akbr78vv1a7";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        features = {
          "rustc-dep-of-std" = [ "core" "compiler_builtins" ];
        };
      };
      "chrono" = rec {
        crateName = "chrono";
        version = "0.4.6";
        edition = "2015";
        sha256 = "0y1qcgnr7g9zgnmlzcrn31vn91x1vakpph9qgjnnzchw2a0ji4a5";
        authors = [
          "Kang Seonghoon <public+rust@mearie.org>"
          "Brandon W Maister <quodlibetor@gmail.com>"
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
          {
            name = "serde";
            packageId = "serde";
            optional = true;
          }
          {
            name = "time";
            packageId = "time";
            optional = true;
          }
        ];
        features = {
          "clock" = [ "time" ];
          "default" = [ "clock" ];
        };
        resolvedDefaultFeatures = [ "clock" "default" "serde" "time" ];
      };
      "foreign-types" = rec {
        crateName = "foreign-types";
        version = "0.3.2";
        edition = "2015";
        sha256 = "1cgk0vyd7r45cj769jym4a6s7vwshvd0z4bqrb92q1fwibmkkwzn";
        authors = [
          "Steven Fackler <sfackler@gmail.com>"
        ];
        dependencies = [
          {
            name = "foreign-types-shared";
            packageId = "foreign-types-shared";
          }
        ];
        
      };
      "foreign-types-shared" = rec {
        crateName = "foreign-types-shared";
        version = "0.1.1";
        edition = "2015";
        sha256 = "0jxgzd04ra4imjv8jgkmdq59kj8fsz6w4zxsbmlai34h26225c00";
        authors = [
          "Steven Fackler <sfackler@gmail.com>"
        ];
        
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
        version = "0.2.51";
        edition = "2015";
        sha256 = "05v9j6xbxgwzw8qkm5lfaldxlqy1xaz5l17ydx45crh716lcgp5y";
        authors = [
          "The Rust Project Developers"
        ];
        features = {
          "default" = [ "use_std" ];
          "rustc-dep-of-std" = [ "align" "rustc-std-workspace-core" ];
        };
        resolvedDefaultFeatures = [ "default" "use_std" ];
      };
      "linked-hash-map" = rec {
        crateName = "linked-hash-map";
        version = "0.5.1";
        edition = "2015";
        sha256 = "17pc0g6qcb8w7slj2nvzlplzdp7jyb64wz460mixgkf7bc13kyvh";
        authors = [
          "Stepan Koltsov <stepan.koltsov@gmail.com>"
          "Andrew Paseltiner <apaseltiner@gmail.com>"
        ];
        features = {
          "heapsize_impl" = [ "heapsize" ];
          "serde_impl" = [ "serde" "serde_test" ];
        };
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
      };
      "num-traits" = rec {
        crateName = "num-traits";
        version = "0.2.6";
        edition = "2015";
        sha256 = "1qdym9m6sbzna1pq3s21cbjgyjakyjds33xwp7c30vbxr5y5sfhb";
        authors = [
          "The Rust Project Developers"
        ];
        features = {
          "default" = [ "std" ];
        };
      };
      "openssl" = rec {
        crateName = "openssl";
        version = "0.10.26";
        edition = "2015";
        sha256 = "11d505lwlrh5a0jc2l6q36gvsaqic3vizq5q860hiqcqkmwwag1s";
        authors = [
          "Steven Fackler <sfackler@gmail.com>"
        ];
        dependencies = [
          {
            name = "bitflags";
            packageId = "bitflags";
          }
          {
            name = "cfg-if";
            packageId = "cfg-if";
          }
          {
            name = "foreign-types";
            packageId = "foreign-types";
          }
          {
            name = "lazy_static";
            packageId = "lazy_static";
          }
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "openssl-sys";
            packageId = "openssl-sys";
          }
        ];
        features = {
          "vendored" = [ "openssl-sys/vendored" ];
        };
      };
      "openssl-sys" = rec {
        crateName = "openssl-sys";
        version = "0.9.53";
        edition = "2015";
        sha256 = "0vvk8vzrc73y8n5rf4yj3x8ygyxjaz7wxrbxiwqi7qy0gyp1cpa6";
        build = "build/main.rs";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
          "Steven Fackler <sfackler@gmail.com>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
        ];
        buildDependencies = [
          {
            name = "autocfg";
            packageId = "autocfg";
          }
          {
            name = "cc";
            packageId = "cc";
          }
          {
            name = "pkg-config";
            packageId = "pkg-config";
          }
          {
            name = "vcpkg";
            packageId = "vcpkg";
            target = {target, features}: (target."env" == "msvc");
          }
        ];
        features = {
          "vendored" = [ "openssl-src" ];
        };
      };
      "pkg-config" = rec {
        crateName = "pkg-config";
        version = "0.3.17";
        edition = "2015";
        sha256 = "0xynnaxdv0gzadlw4h79j855k0q7rj4zb9xb1vk00nc6ss559nh5";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        
      };
      "redox_syscall" = rec {
        crateName = "redox_syscall";
        version = "0.1.52";
        edition = "2015";
        sha256 = "0s9x850ypvl4935nc3h0dgsjnlw9ffcyq7s1q15nxn6fwm9k0ayk";
        libName = "syscall";
        authors = [
          "Jeremy Soller <jackpot51@gmail.com>"
        ];
        
      };
      "serde" = rec {
        crateName = "serde";
        version = "1.0.89";
        edition = "2015";
        sha256 = "0q1mcab7l5czglfnvsm54x65ch3dbh7h4bg34r8rn34hbywlylcj";
        authors = [
          "Erick Tryzelaar <erick.tryzelaar@gmail.com>"
          "David Tolnay <dtolnay@gmail.com>"
        ];
        features = {
          "alloc" = [ "unstable" ];
          "default" = [ "std" ];
          "derive" = [ "serde_derive" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "supervisor-rs" = rec {
        crateName = "supervisor-rs";
        version = "0.6.0";
        edition = "2018";
        crateBin = [
          { name = "supervisor-rs-server"; path = "src/bin/server.rs"; }
          { name = "supervisor-rs-client"; path = "src/bin/client.rs"; }
        ];
        src = pkgs.callPackage ./tarball-v0.6.0.nix {};
        authors = [
          "ccQpein"
        ];
        dependencies = [
          {
            name = "chrono";
            packageId = "chrono";
            features = [ "serde" ];
          }
          {
            name = "openssl";
            packageId = "openssl";
          }
          {
            name = "yaml-rust";
            packageId = "yaml-rust";
          }
        ];
        
      };
      "time" = rec {
        crateName = "time";
        version = "0.1.42";
        edition = "2015";
        sha256 = "0vsbvsz0ryxb35dy9j4anxvy8zlaplmjmi0a4z4l64bc135cz3fv";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "redox_syscall";
            packageId = "redox_syscall";
            target = { target, features }: (target."os" == "redox");
          }
          {
            name = "winapi";
            packageId = "winapi";
            target = { target, features }: target."windows";
            features = [ "std" "minwinbase" "minwindef" "ntdef" "profileapi" "sysinfoapi" "timezoneapi" ];
          }
        ];
        devDependencies = [
          {
            name = "winapi";
            packageId = "winapi";
            features = [ "std" "processthreadsapi" "winbase" ];
          }
        ];
        
      };
      "vcpkg" = rec {
        crateName = "vcpkg";
        version = "0.2.8";
        edition = "2015";
        sha256 = "0s1ijdrsg6917imja2hb07l0z4vbx7ydm8m2i1n9g62fg7r3ki1z";
        authors = [
          "Jim McGrath <jimmc2@gmail.com>"
        ];
        
      };
      "winapi" = rec {
        crateName = "winapi";
        version = "0.3.6";
        edition = "2015";
        sha256 = "1c6479gvfz8iqnrlicqcn5b5rgjpmnn241aa47x6q9qychryphcj";
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
        };
        resolvedDefaultFeatures = [ "minwinbase" "minwindef" "ntdef" "profileapi" "std" "sysinfoapi" "timezoneapi" ];
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
      "yaml-rust" = rec {
        crateName = "yaml-rust";
        version = "0.4.2";
        edition = "2015";
        sha256 = "0ki506c74hd4djv06wzbrbi2bn62djxf1h2yjslpvl0mapdz1b4m";
        authors = [
          "Yuheng Chen <yuhengchen@sensetime.com>"
        ];
        dependencies = [
          {
            name = "linked-hash-map";
            packageId = "linked-hash-map";
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
