
# This file was @generated by crate2nix 0.9.0-alpha.1 with the command:
#   "generate" "-o" "/home/jamie/Misc/cratesioout/ad983x/v0.2.0.nix.tmp"
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
    packageId = "ad983x";

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
    "ad983x" = rec {
      packageId = "ad983x";
      build = internal.buildRustCrateWithFeatures {
        packageId = "ad983x";
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
      "ad983x" = rec {
        crateName = "ad983x";
        version = "0.2.0";
        edition = "2015";
        src = pkgs.callPackage ./tarball-v0.2.0.nix {};
        authors = [
          "Diego Barrios Romero <eldruin@gmail.com>"
        ];
        dependencies = [
          {
            name = "embedded-hal";
            packageId = "embedded-hal";
          }
        ];
        devDependencies = [
          {
            name = "embedded-hal-mock";
            packageId = "embedded-hal-mock";
          }
          {
            name = "linux-embedded-hal";
            packageId = "linux-embedded-hal";
          }
        ];
        
      };
      "bitflags 0.3.3" = rec {
        crateName = "bitflags";
        version = "0.3.3";
        edition = "2015";
        sha256 = "171qfyjn5z86z6i5jynpwmwf03m8n6hql5di3n5l6kiw216nz1ij";
        authors = [
          "The Rust Project Developers"
        ];
        
      };
      "bitflags 0.4.0" = rec {
        crateName = "bitflags";
        version = "0.4.0";
        edition = "2015";
        sha256 = "18q4xvy9m7lhqwx46x1gzy5ywvpb6h4yb89ig5iwy9qi3i3dgsld";
        authors = [
          "The Rust Project Developers"
        ];
        features = {
        };
      };
      "bitflags 1.2.1" = rec {
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
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "cast" = rec {
        crateName = "cast";
        version = "0.2.2";
        edition = "2015";
        sha256 = "09yl2700crxa4n860b080msij25klvs1kfzazhp2aihchvr16q4j";
        authors = [
          "Jorge Aparicio <jorge@japaric.io>"
        ];
        features = {
          "default" = [ "std" ];
        };
      };
      "cc" = rec {
        crateName = "cc";
        version = "1.0.47";
        edition = "2018";
        crateBin = [];
        sha256 = "1f08560cwbalni1fc2jcmh1dszl3rc31azvr45bgz8vhrs6hb1xa";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        features = {
          "parallel" = [ "num_cpus" "jobserver" ];
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
      "embedded-hal" = rec {
        crateName = "embedded-hal";
        version = "0.2.3";
        edition = "2015";
        sha256 = "02qpdjksa1njjgidkhzw9qxiw1i0p0bxcq1d7irafk89anhhhjgf";
        authors = [
          "Jorge Aparicio <jorge@japaric.io>"
          "Jonathan 'theJPster' Pallant <github@thejpster.org.uk>"
        ];
        dependencies = [
          {
            name = "nb";
            packageId = "nb";
          }
          {
            name = "void";
            packageId = "void";
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "unproven" = [ "nb/unstable" ];
        };
        resolvedDefaultFeatures = [ "unproven" ];
      };
      "embedded-hal-mock" = rec {
        crateName = "embedded-hal-mock";
        version = "0.7.0";
        edition = "2018";
        sha256 = "115jm7w26rzw9dm5zdibyn1br08zjpybifls0zs032ips470wbsp";
        authors = [
          "Danilo Bargen <mail@dbrgn.ch>"
        ];
        dependencies = [
          {
            name = "embedded-hal";
            packageId = "embedded-hal";
            features = [ "unproven" ];
          }
          {
            name = "nb";
            packageId = "nb";
          }
        ];
        
      };
      "i2cdev" = rec {
        crateName = "i2cdev";
        version = "0.4.2";
        edition = "2015";
        sha256 = "1ng3wfbbdaz5ah0q58kapd1sinsqm8s04hs4rfx344ci00sz0z6v";
        authors = [
          "Paul Osborne <osbpau@gmail.com>"
        ];
        dependencies = [
          {
            name = "bitflags";
            packageId = "bitflags 1.2.1";
          }
          {
            name = "byteorder";
            packageId = "byteorder";
          }
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "nix";
            packageId = "nix 0.14.1";
          }
        ];
        
      };
      "libc" = rec {
        crateName = "libc";
        version = "0.2.65";
        edition = "2015";
        sha256 = "1s14bjxnz6haw0gr1h3j4sr7s2s407hpgm8dxhwnl7yzgxia0c8s";
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
      "linux-embedded-hal" = rec {
        crateName = "linux-embedded-hal";
        version = "0.2.2";
        edition = "2015";
        sha256 = "117vr35fkvmqf1xrb2bni9l4d80vgfly3hwinnpj41nbxv09cl3r";
        authors = [
          "Jorge Aparicio <jorge@japaric.io>"
        ];
        dependencies = [
          {
            name = "cast";
            packageId = "cast";
            usesDefaultFeatures = false;
          }
          {
            name = "embedded-hal";
            packageId = "embedded-hal";
            features = [ "unproven" ];
          }
          {
            name = "i2cdev";
            packageId = "i2cdev";
          }
          {
            name = "spidev";
            packageId = "spidev";
          }
          {
            name = "sysfs_gpio";
            packageId = "sysfs_gpio";
          }
        ];
        
      };
      "nb" = rec {
        crateName = "nb";
        version = "0.1.2";
        edition = "2015";
        sha256 = "1p6v8ngaabssq8sgzkf2ks5x4ivb4pxa140azgnivhdkpr8iahdi";
        authors = [
          "Jorge Aparicio <jorge@japaric.io>"
        ];
        features = {
        };
        resolvedDefaultFeatures = [ "unstable" ];
      };
      "nix 0.14.1" = rec {
        crateName = "nix";
        version = "0.14.1";
        edition = "2015";
        sha256 = "1kmxdlmvnmq8cfpmr3g6wk37rwi2ybdvp1z6z3831m1p23p2nwkc";
        authors = [
          "The nix-rust Project Developers"
        ];
        dependencies = [
          {
            name = "bitflags";
            packageId = "bitflags 1.2.1";
          }
          {
            name = "cfg-if";
            packageId = "cfg-if";
          }
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "void";
            packageId = "void";
          }
        ];
        buildDependencies = [
          {
            name = "cc";
            packageId = "cc";
            target = {target, features}: (target."os" == "dragonfly");
          }
        ];
        
      };
      "nix 0.6.0" = rec {
        crateName = "nix";
        version = "0.6.0";
        edition = "2015";
        sha256 = "1ck4pkhcw1qrxqmqsixgcpkdkzq9sn0wcgx7znzkrnp75gdb2yvs";
        authors = [
          "Carl Lerche <me@carllerche.com>"
        ];
        dependencies = [
          {
            name = "bitflags";
            packageId = "bitflags 0.4.0";
          }
          {
            name = "cfg-if";
            packageId = "cfg-if";
          }
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "void";
            packageId = "void";
          }
        ];
        buildDependencies = [
          {
            name = "rustc_version";
            packageId = "rustc_version";
          }
          {
            name = "semver";
            packageId = "semver";
          }
        ];
        features = {
        };
      };
      "rustc_version" = rec {
        crateName = "rustc_version";
        version = "0.1.7";
        edition = "2015";
        sha256 = "1160jjsqhqr25cvhr48hmpp8v61bjvjcnxzb0cyf4373lmp3gxf5";
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
        version = "0.1.20";
        edition = "2015";
        sha256 = "1b10m0hxrr947gp41lj9vnmgl5ddwx3d41vnblsg06ppvkz11x6l";
        authors = [
          "The Rust Project Developers"
        ];
        
      };
      "spidev" = rec {
        crateName = "spidev";
        version = "0.3.0";
        edition = "2015";
        sha256 = "011y5727i5ldc23hgmz2jn9rjg5kw79nriyazscfhdraz4z1v80v";
        authors = [
          "Paul Osborne <osbpau@gmail.com>"
        ];
        dependencies = [
          {
            name = "bitflags";
            packageId = "bitflags 0.3.3";
          }
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "nix";
            packageId = "nix 0.6.0";
          }
        ];
        
      };
      "sysfs_gpio" = rec {
        crateName = "sysfs_gpio";
        version = "0.5.4";
        edition = "2015";
        sha256 = "1ldmm5xa040726kkc0wpsvcgw5jijhc8ghyfyvjdh8v6hiaim5i4";
        authors = [
          "Paul Osborne <osbpau@gmail.com>"
        ];
        dependencies = [
          {
            name = "nix";
            packageId = "nix 0.14.1";
          }
        ];
        features = {
          "mio-evented" = [ "mio" ];
          "use_tokio" = [ "futures" "tokio" "mio-evented" ];
        };
      };
      "void" = rec {
        crateName = "void";
        version = "1.0.2";
        edition = "2015";
        sha256 = "0zc8f0ksxvmhvgx4fdg0zyn6vdnbxd2xv9hfx4nhzg6kbs4f80ka";
        authors = [
          "Jonathan Reem <jonathan.reem@gmail.com>"
        ];
        features = {
          "default" = [ "std" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
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
