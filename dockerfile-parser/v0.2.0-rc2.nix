
# This file was @generated by crate2nix 0.9.0-alpha.1 with the command:
#   "generate" "-o" "/home/jamie/Misc/cratesioout/dockerfile-parser/v0.2.0-rc2.nix.tmp"
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
    packageId = "dockerfile-parser";

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
    "dockerfile-parser" = rec {
      packageId = "dockerfile-parser";
      build = internal.buildRustCrateWithFeatures {
        packageId = "dockerfile-parser";
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
      "block-buffer" = rec {
        crateName = "block-buffer";
        version = "0.7.3";
        edition = "2015";
        sha256 = "12v8wizynqin0hqf140kmp9s38q223mp1b0hkqk8j5pk8720v560";
        authors = [
          "RustCrypto Developers"
        ];
        dependencies = [
          {
            name = "block-padding";
            packageId = "block-padding";
          }
          {
            name = "byte-tools";
            packageId = "byte-tools";
          }
          {
            name = "byteorder";
            packageId = "byteorder";
            usesDefaultFeatures = false;
          }
          {
            name = "generic-array";
            packageId = "generic-array";
          }
        ];
        
      };
      "block-padding" = rec {
        crateName = "block-padding";
        version = "0.1.5";
        edition = "2015";
        sha256 = "1xbkmysiz23vimd17rnsjpw9bgjxipwfslwyygqlkx4in3dxwygs";
        authors = [
          "RustCrypto Developers"
        ];
        dependencies = [
          {
            name = "byte-tools";
            packageId = "byte-tools";
          }
        ];
        
      };
      "byte-tools" = rec {
        crateName = "byte-tools";
        version = "0.3.1";
        edition = "2015";
        sha256 = "1mqi29wsm8njpl51pfwr31wmpzs5ahlcb40wsjyd92l90ixcmdg3";
        authors = [
          "RustCrypto Developers"
        ];
        
      };
      "byteorder" = rec {
        crateName = "byteorder";
        version = "1.3.4";
        edition = "2015";
        sha256 = "1pkjfhgjnq898g1d38ygcfi0msg3m6756cwv0sgysj1d26p8mi08";
        authors = [
          "Andrew Gallant <jamslam@gmail.com>"
        ];
        features = {
          "default" = [ "std" ];
        };
      };
      "digest" = rec {
        crateName = "digest";
        version = "0.8.1";
        edition = "2015";
        sha256 = "1madjl27f3kj5ql7kwgvb9c8b7yb7bv7yfgx7rqzj4i3fp4cil7k";
        authors = [
          "RustCrypto Developers"
        ];
        dependencies = [
          {
            name = "generic-array";
            packageId = "generic-array";
          }
        ];
        features = {
          "dev" = [ "blobby" ];
        };
      };
      "doc-comment" = rec {
        crateName = "doc-comment";
        version = "0.3.3";
        edition = "2015";
        sha256 = "043sprsf3wl926zmck1bm7gw0jq50mb76lkpk49vasfr6ax1p97y";
        libName = "doc_comment";
        authors = [
          "Guillaume Gomez <guillaume1.gomez@gmail.com>"
        ];
        features = {
        };
      };
      "dockerfile-parser" = rec {
        crateName = "dockerfile-parser";
        version = "0.2.0-rc2";
        edition = "2018";
        src = pkgs.callPackage ./tarball-v0.2.0-rc2.nix {};
        libName = "dockerfile_parser";
        authors = [
          "Tim Buckley <timothy.jas.buckley@hpe.com>"
        ];
        dependencies = [
          {
            name = "enquote";
            packageId = "enquote";
          }
          {
            name = "pest";
            packageId = "pest";
          }
          {
            name = "pest_derive";
            packageId = "pest_derive";
          }
          {
            name = "snafu";
            packageId = "snafu";
          }
        ];
        
      };
      "enquote" = rec {
        crateName = "enquote";
        version = "1.0.3";
        edition = "2015";
        sha256 = "0vm687r2wwgc3d3l2iqhag9wgkql6k93sdvjxvmfkdpksajpij1f";
        authors = [
          "reujab <reujab@gmail.com>"
        ];
        
      };
      "fake-simd" = rec {
        crateName = "fake-simd";
        version = "0.1.2";
        edition = "2015";
        sha256 = "1vfylvk4va2ivqx85603lyqqp0zk52cgbs4n5nfbbbqx577qm2p8";
        authors = [
          "The Rust-Crypto Project Developers"
        ];
        
      };
      "generic-array" = rec {
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
      "maplit" = rec {
        crateName = "maplit";
        version = "1.0.2";
        edition = "2015";
        sha256 = "07b5kjnhrrmfhgqm9wprjw8adx6i225lqp49gasgqg74lahnabiy";
        authors = [
          "bluss"
        ];
        
      };
      "opaque-debug" = rec {
        crateName = "opaque-debug";
        version = "0.2.3";
        edition = "2015";
        sha256 = "172j6bs8ndclqxa2m64qc0y1772rr73g4l9fg2svscgicnbfff98";
        authors = [
          "RustCrypto Developers"
        ];
        
      };
      "pest" = rec {
        crateName = "pest";
        version = "2.1.3";
        edition = "2015";
        sha256 = "0lry80bm90x47nq71wxq83kjrm9ashpz4kbm92p90ysdx4m8gx0h";
        authors = [
          "Dragoș Tiselice <dragostiselice@gmail.com>"
        ];
        dependencies = [
          {
            name = "ucd-trie";
            packageId = "ucd-trie";
          }
        ];
        features = {
          "pretty-print" = [ "serde" "serde_json" ];
        };
      };
      "pest_derive" = rec {
        crateName = "pest_derive";
        version = "2.1.0";
        edition = "2015";
        sha256 = "1l5jfa6ril71cw5nsiw0r45br54dd8cj2r1nc2d1wq6wb3jilgc3";
        procMacro = true;
        authors = [
          "Dragoș Tiselice <dragostiselice@gmail.com>"
        ];
        dependencies = [
          {
            name = "pest";
            packageId = "pest";
          }
          {
            name = "pest_generator";
            packageId = "pest_generator";
          }
        ];
        
      };
      "pest_generator" = rec {
        crateName = "pest_generator";
        version = "2.1.3";
        edition = "2015";
        sha256 = "0mfgl0p6v91ywdqr9i8w053v70cnfqjk8y5rhwbvir9idridpf4r";
        authors = [
          "Dragoș Tiselice <dragostiselice@gmail.com>"
        ];
        dependencies = [
          {
            name = "pest";
            packageId = "pest";
          }
          {
            name = "pest_meta";
            packageId = "pest_meta";
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
          }
        ];
        
      };
      "pest_meta" = rec {
        crateName = "pest_meta";
        version = "2.1.3";
        edition = "2015";
        sha256 = "07d1jbbbpxpchk0j37ljas46sdyyg599z3zw2ac0f5sk9x06xgjl";
        authors = [
          "Dragoș Tiselice <dragostiselice@gmail.com>"
        ];
        dependencies = [
          {
            name = "maplit";
            packageId = "maplit";
          }
          {
            name = "pest";
            packageId = "pest";
          }
        ];
        buildDependencies = [
          {
            name = "sha-1";
            packageId = "sha-1";
            usesDefaultFeatures = false;
          }
        ];
        
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
      "sha-1" = rec {
        crateName = "sha-1";
        version = "0.8.2";
        edition = "2015";
        sha256 = "1pv387q0r7llk2cqzyq0nivzvkgqgzsiygqzlv7b68z9xl5lvngp";
        libName = "sha1";
        authors = [
          "RustCrypto Developers"
        ];
        dependencies = [
          {
            name = "block-buffer";
            packageId = "block-buffer";
          }
          {
            name = "digest";
            packageId = "digest";
          }
          {
            name = "fake-simd";
            packageId = "fake-simd";
          }
          {
            name = "opaque-debug";
            packageId = "opaque-debug";
          }
        ];
        devDependencies = [
          {
            name = "digest";
            packageId = "digest";
            features = [ "dev" ];
          }
        ];
        features = {
          "asm" = [ "sha1-asm" ];
          "asm-aarch64" = [ "asm" "libc" ];
          "default" = [ "std" ];
          "std" = [ "digest/std" ];
        };
      };
      "snafu" = rec {
        crateName = "snafu";
        version = "0.6.3";
        edition = "2018";
        sha256 = "0nzr434g95k2591lz3rm7q9z7vgxxn815hc0gqhpkrn6a57jwja8";
        authors = [
          "Jake Goulding <jake.goulding@gmail.com>"
        ];
        dependencies = [
          {
            name = "doc-comment";
            packageId = "doc-comment";
            usesDefaultFeatures = false;
          }
          {
            name = "snafu-derive";
            packageId = "snafu-derive";
          }
        ];
        features = {
          "backtraces" = [ "std" "backtrace" ];
          "backtraces-impl-backtrace-crate" = [ "backtraces" ];
          "default" = [ "std" ];
          "futures" = [ "futures-core-crate" "pin-project" ];
          "futures-01" = [ "futures-01-crate" ];
          "internal-dev-dependencies" = [ "futures-crate" ];
          "unstable-backtraces-impl-std" = [ "backtraces" "snafu-derive/unstable-backtraces-impl-std" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "snafu-derive" = rec {
        crateName = "snafu-derive";
        version = "0.6.3";
        edition = "2018";
        sha256 = "0amw2l3w8jl0vf5haq9ydzfxgncxadr4q0x5znz9kynbaqcc9ldm";
        procMacro = true;
        authors = [
          "Jake Goulding <jake.goulding@gmail.com>"
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
            features = [ "full" ];
          }
        ];
        features = {
        };
      };
      "syn" = rec {
        crateName = "syn";
        version = "1.0.17";
        edition = "2018";
        sha256 = "00xvf772ys4fj9fr8kplmsqb9if215dsipi3nv54aw9q7xkfpw0d";
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
      "ucd-trie" = rec {
        crateName = "ucd-trie";
        version = "0.1.3";
        edition = "2018";
        sha256 = "072cblf8v3wzyaz3lhbpzgil4s03dpzg1ppy3gqx2l4v622y3pjn";
        authors = [
          "Andrew Gallant <jamslam@gmail.com>"
        ];
        features = {
          "default" = [ "std" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
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
