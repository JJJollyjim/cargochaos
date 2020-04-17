
# This file was @generated by crate2nix 0.9.0-alpha.1 with the command:
#   "generate" "-o" "/home/jamie/Misc/cratesioout/pretty_env_logger/v0.4.0.nix.tmp"
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
    packageId = "pretty_env_logger";

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
    "pretty_env_logger" = rec {
      packageId = "pretty_env_logger";
      build = internal.buildRustCrateWithFeatures {
        packageId = "pretty_env_logger";
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
      "aho-corasick" = rec {
        crateName = "aho-corasick";
        version = "0.7.7";
        edition = "2015";
        sha256 = "0i2p0c424q2xizl7wpavi5syiisz1dcggmhiz7g4khkd4mvc8mjz";
        libName = "aho_corasick";
        authors = [
          "Andrew Gallant <jamslam@gmail.com>"
        ];
        dependencies = [
          {
            name = "memchr";
            packageId = "memchr";
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "default" = [ "std" ];
          "std" = [ "memchr/use_std" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "atty" = rec {
        crateName = "atty";
        version = "0.2.14";
        edition = "2015";
        sha256 = "1s7yslcs6a28c5vz7jwj63lkfgyx8mx99fdirlhi9lbhhzhrpcyr";
        authors = [
          "softprops <d.tangren@gmail.com>"
        ];
        dependencies = [
          {
            name = "hermit-abi";
            packageId = "hermit-abi";
            target = { target, features }: (target."os" == "hermit");
          }
          {
            name = "libc";
            packageId = "libc";
            usesDefaultFeatures = false;
            target = { target, features }: target."unix";
          }
          {
            name = "winapi";
            packageId = "winapi";
            target = { target, features }: target."windows";
            features = [ "consoleapi" "processenv" "minwinbase" "minwindef" "winbase" ];
          }
        ];
        
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
      "env_logger" = rec {
        crateName = "env_logger";
        version = "0.7.1";
        edition = "2018";
        sha256 = "0djx8h8xfib43g5w94r1m1mkky5spcw4wblzgnhiyg5vnfxknls4";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "atty";
            packageId = "atty";
            optional = true;
          }
          {
            name = "humantime";
            packageId = "humantime";
            optional = true;
          }
          {
            name = "log";
            packageId = "log";
            features = [ "std" ];
          }
          {
            name = "regex";
            packageId = "regex";
            optional = true;
          }
          {
            name = "termcolor";
            packageId = "termcolor";
            optional = true;
          }
        ];
        features = {
          "default" = [ "termcolor" "atty" "humantime" "regex" ];
        };
        resolvedDefaultFeatures = [ "atty" "default" "humantime" "regex" "termcolor" ];
      };
      "hermit-abi" = rec {
        crateName = "hermit-abi";
        version = "0.1.6";
        edition = "2015";
        sha256 = "0wippj5nkw9q5yyyaqpdrgdhag3l3nbrwja7149cwn7ii1nnbwpg";
        authors = [
          "Stefan Lankes"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "rustc-dep-of-std" = [ "core" "compiler_builtins/rustc-dep-of-std" "libc/rustc-dep-of-std" ];
        };
        resolvedDefaultFeatures = [ "default" ];
      };
      "humantime" = rec {
        crateName = "humantime";
        version = "1.3.0";
        edition = "2015";
        sha256 = "0krwgbf35pd46xvkqg14j070vircsndabahahlv3rwhflpy4q06z";
        authors = [
          "Paul Colomiets <paul@colomiets.name>"
        ];
        dependencies = [
          {
            name = "quick-error";
            packageId = "quick-error";
          }
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
        version = "0.2.66";
        edition = "2015";
        sha256 = "0n0mwry21fxfwc063k33mvxk8xj7ia5ar8m42c9ymbam2ksb25fm";
        authors = [
          "The Rust Project Developers"
        ];
        features = {
          "default" = [ "std" ];
          "rustc-dep-of-std" = [ "align" "rustc-std-workspace-core" ];
          "use_std" = [ "std" ];
        };
      };
      "log" = rec {
        crateName = "log";
        version = "0.4.8";
        edition = "2015";
        sha256 = "1xz18ixccl5c6np4linv3ypc7hpmmgpc5zzd2ymp2ssfx0mhbdhl";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "cfg-if";
            packageId = "cfg-if";
          }
        ];
        features = {
          "kv_unstable_sval" = [ "kv_unstable" "sval/fmt" ];
        };
        resolvedDefaultFeatures = [ "std" ];
      };
      "memchr" = rec {
        crateName = "memchr";
        version = "2.3.0";
        edition = "2015";
        sha256 = "08r2qw1wwvvahicjj94ci05qx3ya5ixgrpbiq23kya6vgq6f55ri";
        authors = [
          "Andrew Gallant <jamslam@gmail.com>"
          "bluss"
        ];
        features = {
          "default" = [ "std" ];
          "use_std" = [ "std" ];
        };
        resolvedDefaultFeatures = [ "default" "std" "use_std" ];
      };
      "pretty_env_logger" = rec {
        crateName = "pretty_env_logger";
        version = "0.4.0";
        edition = "2015";
        src = pkgs.callPackage ./tarball-v0.4.0.nix {};
        authors = [
          "Sean McArthur <sean@seanmonstar>"
        ];
        dependencies = [
          {
            name = "env_logger";
            packageId = "env_logger";
          }
          {
            name = "log";
            packageId = "log";
          }
        ];
        
      };
      "quick-error" = rec {
        crateName = "quick-error";
        version = "1.2.3";
        edition = "2015";
        sha256 = "1q6za3v78hsspisc197bg3g7rpc989qycy8ypr8ap8igv10ikl51";
        authors = [
          "Paul Colomiets <paul@colomiets.name>"
          "Colin Kiegel <kiegel@gmx.de>"
        ];
        
      };
      "regex" = rec {
        crateName = "regex";
        version = "1.3.3";
        edition = "2015";
        sha256 = "11syqmfvbsah805z6ih8vxf8p6jssdsz1gjsjqcwprz484cqql5m";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "aho-corasick";
            packageId = "aho-corasick";
            optional = true;
          }
          {
            name = "memchr";
            packageId = "memchr";
            optional = true;
          }
          {
            name = "regex-syntax";
            packageId = "regex-syntax";
            usesDefaultFeatures = false;
          }
          {
            name = "thread_local";
            packageId = "thread_local";
            optional = true;
          }
        ];
        features = {
          "default" = [ "std" "perf" "unicode" ];
          "perf" = [ "perf-cache" "perf-dfa" "perf-inline" "perf-literal" ];
          "perf-cache" = [ "thread_local" ];
          "perf-literal" = [ "aho-corasick" "memchr" ];
          "unicode" = [ "unicode-age" "unicode-bool" "unicode-case" "unicode-gencat" "unicode-perl" "unicode-script" "unicode-segment" ];
          "unicode-age" = [ "regex-syntax/unicode-age" ];
          "unicode-bool" = [ "regex-syntax/unicode-bool" ];
          "unicode-case" = [ "regex-syntax/unicode-case" ];
          "unicode-gencat" = [ "regex-syntax/unicode-gencat" ];
          "unicode-perl" = [ "regex-syntax/unicode-perl" ];
          "unicode-script" = [ "regex-syntax/unicode-script" ];
          "unicode-segment" = [ "regex-syntax/unicode-segment" ];
          "unstable" = [ "pattern" ];
          "use_std" = [ "std" ];
        };
        resolvedDefaultFeatures = [ "aho-corasick" "default" "memchr" "perf" "perf-cache" "perf-dfa" "perf-inline" "perf-literal" "std" "thread_local" "unicode" "unicode-age" "unicode-bool" "unicode-case" "unicode-gencat" "unicode-perl" "unicode-script" "unicode-segment" ];
      };
      "regex-syntax" = rec {
        crateName = "regex-syntax";
        version = "0.6.13";
        edition = "2015";
        sha256 = "141xi6yiji0bc04c4skamd4ny9vnd1jrwc7qzfga425lyn8yhd77";
        authors = [
          "The Rust Project Developers"
        ];
        features = {
          "default" = [ "unicode" ];
          "unicode" = [ "unicode-age" "unicode-bool" "unicode-case" "unicode-gencat" "unicode-perl" "unicode-script" "unicode-segment" ];
        };
        resolvedDefaultFeatures = [ "unicode-age" "unicode-bool" "unicode-case" "unicode-gencat" "unicode-perl" "unicode-script" "unicode-segment" ];
      };
      "termcolor" = rec {
        crateName = "termcolor";
        version = "1.1.0";
        edition = "2018";
        sha256 = "0pyp8vc0gx7124y80ixdl6plbfn1yjhw04i875k5fz2dk8lglsxv";
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
      "thread_local" = rec {
        crateName = "thread_local";
        version = "1.0.1";
        edition = "2015";
        sha256 = "054vlrr1vsdy1h4b7n99mr24pnj8928ig9qwzg36wnkld4dns36l";
        authors = [
          "Amanieu d'Antras <amanieu@gmail.com>"
        ];
        dependencies = [
          {
            name = "lazy_static";
            packageId = "lazy_static";
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
        resolvedDefaultFeatures = [ "consoleapi" "errhandlingapi" "fileapi" "minwinbase" "minwindef" "processenv" "std" "winbase" "wincon" "winerror" "winnt" ];
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
        version = "0.1.3";
        edition = "2018";
        sha256 = "105dq898nah3dwrzr96vvb5srp6g2v5dl5vmzf211lba9iavzksc";
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
