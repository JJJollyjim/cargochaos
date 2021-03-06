
# This file was @generated by crate2nix 0.9.0-alpha.1 with the command:
#   "generate" "-o" "/home/jamie/Misc/cratesioout/gobbledygit/v0.1.0.nix.tmp"
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
    packageId = "gobbledygit";

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
    "gobbledygit" = rec {
      packageId = "gobbledygit";
      build = internal.buildRustCrateWithFeatures {
        packageId = "gobbledygit";
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
        version = "0.1.6";
        edition = "2015";
        sha256 = "0x8q946yy321rlpxhqf3mkd965x8kbjs2jwcw55dsmxlf7xwhwdn";
        authors = [
          "Josh Stone <cuviper@gmail.com>"
        ];
        
      };
      "bitflags" = rec {
        crateName = "bitflags";
        version = "1.1.0";
        edition = "2015";
        sha256 = "1zc1qb1hwsnl2d8rhzicsv9kqd5b2hwbrscrcfw5as4sfr35659x";
        authors = [
          "The Rust Project Developers"
        ];
        features = {
        };
        resolvedDefaultFeatures = [ "default" ];
      };
      "cc" = rec {
        crateName = "cc";
        version = "1.0.45";
        edition = "2018";
        crateBin = [];
        sha256 = "1gm1llpdm3ch58myngjca6id47k7837scjy5bygfp4223xga7jag";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        dependencies = [
          {
            name = "jobserver";
            packageId = "jobserver";
            optional = true;
          }
          {
            name = "num_cpus";
            packageId = "num_cpus";
            optional = true;
          }
        ];
        features = {
          "parallel" = [ "num_cpus" "jobserver" ];
        };
        resolvedDefaultFeatures = [ "jobserver" "num_cpus" "parallel" ];
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
      "either" = rec {
        crateName = "either";
        version = "1.5.3";
        edition = "2015";
        sha256 = "1qyz1b1acad6w0k5928jw5zaq900zhsk7p8dlcp4hh61w4f6n7xv";
        authors = [
          "bluss"
        ];
        features = {
          "default" = [ "use_std" ];
        };
      };
      "getrandom" = rec {
        crateName = "getrandom";
        version = "0.1.12";
        edition = "2018";
        sha256 = "0w9mj0nrzhhkl4n8l18n14hfabiwxs6az8fhij01xzy8miji4fj7";
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
      };
      "git2" = rec {
        crateName = "git2";
        version = "0.10.1";
        edition = "2018";
        sha256 = "10jazcfnni2j1dxv1faizk1x7bn55clr0sd5x7n6gv5mzf373wir";
        authors = [
          "Josh Triplett <josh@joshtriplett.org>"
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        dependencies = [
          {
            name = "bitflags";
            packageId = "bitflags";
          }
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "libgit2-sys";
            packageId = "libgit2-sys";
          }
          {
            name = "log";
            packageId = "log";
          }
          {
            name = "openssl-probe";
            packageId = "openssl-probe";
            optional = true;
            target = { target, features }: (target."unix" && (!(target."os" == "macos")));
          }
          {
            name = "openssl-sys";
            packageId = "openssl-sys";
            optional = true;
            target = { target, features }: (target."unix" && (!(target."os" == "macos")));
          }
          {
            name = "url";
            packageId = "url";
          }
        ];
        features = {
          "default" = [ "ssh" "https" "ssh_key_from_memory" ];
          "https" = [ "libgit2-sys/https" "openssl-sys" "openssl-probe" ];
          "ssh" = [ "libgit2-sys/ssh" ];
          "ssh_key_from_memory" = [ "libgit2-sys/ssh_key_from_memory" ];
          "vendored-openssl" = [ "openssl-sys/vendored" ];
        };
        resolvedDefaultFeatures = [ "default" "https" "openssl-probe" "openssl-sys" "ssh" "ssh_key_from_memory" ];
      };
      "gobbledygit" = rec {
        crateName = "gobbledygit";
        version = "0.1.0";
        edition = "2018";
        crateBin = [
          { name = "gobbledygit"; path = "src/main.rs"; }
        ];
        src = pkgs.callPackage ./tarball-v0.1.0.nix {};
        authors = [
          "Vijay Kiran <mail@vijaykiran.com>"
        ];
        dependencies = [
          {
            name = "git2";
            packageId = "git2";
          }
          {
            name = "itertools";
            packageId = "itertools";
          }
        ];
        
      };
      "idna" = rec {
        crateName = "idna";
        version = "0.2.0";
        edition = "2015";
        sha256 = "1a9066imqpdrm1aavfasdyb1zahqaz8jmdcwdawvb1pf60y6gqh2";
        authors = [
          "The rust-url developers"
        ];
        dependencies = [
          {
            name = "matches";
            packageId = "matches";
          }
          {
            name = "unicode-bidi";
            packageId = "unicode-bidi";
          }
          {
            name = "unicode-normalization";
            packageId = "unicode-normalization";
          }
        ];
        
      };
      "itertools" = rec {
        crateName = "itertools";
        version = "0.8.0";
        edition = "2015";
        sha256 = "0n2k13b6w4x2x6np2lykh9bj3b3z4hwh2r4cn3z2dgnfq7cng12v";
        authors = [
          "bluss"
        ];
        dependencies = [
          {
            name = "either";
            packageId = "either";
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "default" = [ "use_std" ];
        };
        resolvedDefaultFeatures = [ "default" "use_std" ];
      };
      "jobserver" = rec {
        crateName = "jobserver";
        version = "0.1.17";
        edition = "2015";
        sha256 = "0q61p39nw0bdx6w0wkjv1kcha5mbhcfdl4z1hxrhpcskyhpd9cgj";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        dependencies = [
          {
            name = "getrandom";
            packageId = "getrandom";
            target = { target, features }: target."windows";
          }
          {
            name = "libc";
            packageId = "libc";
            target = { target, features }: target."unix";
          }
          {
            name = "log";
            packageId = "log";
          }
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
      "libgit2-sys" = rec {
        crateName = "libgit2-sys";
        version = "0.9.1";
        edition = "2018";
        sha256 = "1cy11h35drwd4fw1b9j3hgflvvl1yzgnl3x0p3inwqarxcvqc3x3";
        libName = "libgit2_sys";
        libPath = "lib.rs";
        authors = [
          "Josh Triplett <josh@joshtriplett.org>"
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "libssh2-sys";
            packageId = "libssh2-sys";
            optional = true;
          }
          {
            name = "libz-sys";
            packageId = "libz-sys";
          }
          {
            name = "openssl-sys";
            packageId = "openssl-sys";
            optional = true;
            target = { target, features }: target."unix";
          }
        ];
        buildDependencies = [
          {
            name = "cc";
            packageId = "cc";
            features = [ "parallel" ];
          }
          {
            name = "pkg-config";
            packageId = "pkg-config";
          }
        ];
        features = {
          "https" = [ "openssl-sys" ];
          "ssh" = [ "libssh2-sys" ];
        };
        resolvedDefaultFeatures = [ "https" "libssh2-sys" "openssl-sys" "ssh" "ssh_key_from_memory" ];
      };
      "libssh2-sys" = rec {
        crateName = "libssh2-sys";
        version = "0.2.12";
        edition = "2015";
        sha256 = "1zb6gsw795nq848nk5x2smzpfnn1s15wjlzjnvr8ihlz2l5x2549";
        libName = "libssh2_sys";
        libPath = "lib.rs";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
          {
            name = "libz-sys";
            packageId = "libz-sys";
          }
          {
            name = "openssl-sys";
            packageId = "openssl-sys";
            target = { target, features }: target."unix";
          }
        ];
        buildDependencies = [
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
          "vendored-openssl" = [ "openssl-sys/vendored" ];
        };
      };
      "libz-sys" = rec {
        crateName = "libz-sys";
        version = "1.0.25";
        edition = "2015";
        sha256 = "1gjycyl2283525abks98bhxa4r259m617xfm5z52p3p3c8ry9d9f";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
        ];
        buildDependencies = [
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
      };
      "matches" = rec {
        crateName = "matches";
        version = "0.1.8";
        edition = "2015";
        sha256 = "020axl4q7rk9vz90phs7f8jas4imxal9y9kxl4z4v7a6719mrz3z";
        libPath = "lib.rs";
        authors = [
          "Simon Sapin <simon.sapin@exyr.org>"
        ];
        
      };
      "num_cpus" = rec {
        crateName = "num_cpus";
        version = "1.10.1";
        edition = "2015";
        sha256 = "0wrj3zvj6h3q26sqj9zxpd59frjb54n7jhjwf307clq31ic47vxw";
        authors = [
          "Sean McArthur <sean@seanmonstar.com>"
        ];
        dependencies = [
          {
            name = "libc";
            packageId = "libc";
          }
        ];
        
      };
      "openssl-probe" = rec {
        crateName = "openssl-probe";
        version = "0.1.2";
        edition = "2015";
        sha256 = "1pijrdifgsdwd45b08c2g0dsmnhz7c3kmagb70839ngrd7d29bvp";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        
      };
      "openssl-sys" = rec {
        crateName = "openssl-sys";
        version = "0.9.49";
        edition = "2015";
        sha256 = "1168vivyqbzaxl48bvv9r1x714c03f5c1za8pv5x8fyj9gjxkypl";
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
      "percent-encoding" = rec {
        crateName = "percent-encoding";
        version = "2.1.0";
        edition = "2015";
        sha256 = "0bp3zrsk3kr47fbpipyczidbbx4g54lzxdm77ni1i3qws10mdzfl";
        libPath = "lib.rs";
        authors = [
          "The rust-url developers"
        ];
        
      };
      "pkg-config" = rec {
        crateName = "pkg-config";
        version = "0.3.16";
        edition = "2015";
        sha256 = "1slikl3p0qbxy37crxynz7zznaf5gzl7ag9w0fyp17zlj06kgmbj";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        
      };
      "smallvec" = rec {
        crateName = "smallvec";
        version = "0.6.10";
        edition = "2015";
        sha256 = "1dyl43rgzny79jjpgzi07y0ly2ggx1xwsn64csxj0j91bsf6lq5b";
        libPath = "lib.rs";
        authors = [
          "Simon Sapin <simon.sapin@exyr.org>"
        ];
        features = {
          "default" = [ "std" ];
        };
        resolvedDefaultFeatures = [ "default" "std" ];
      };
      "unicode-bidi" = rec {
        crateName = "unicode-bidi";
        version = "0.3.4";
        edition = "2015";
        sha256 = "1malx8ljgm7v1gbaazkn7iicy5wj0bwcyadj3l727a38ch6bvwj9";
        libName = "unicode_bidi";
        authors = [
          "The Servo Project Developers"
        ];
        dependencies = [
          {
            name = "matches";
            packageId = "matches";
          }
        ];
        features = {
          "flame_it" = [ "flame" "flamer" ];
          "with_serde" = [ "serde" ];
        };
        resolvedDefaultFeatures = [ "default" ];
      };
      "unicode-normalization" = rec {
        crateName = "unicode-normalization";
        version = "0.1.8";
        edition = "2015";
        sha256 = "09i49va90rvia1agvgni4gicnqv50y5zy1naw8mr8bcqifh3j4ql";
        authors = [
          "kwantam <kwantam@gmail.com>"
        ];
        dependencies = [
          {
            name = "smallvec";
            packageId = "smallvec";
          }
        ];
        
      };
      "url" = rec {
        crateName = "url";
        version = "2.1.0";
        edition = "2015";
        sha256 = "0qcxx9kr0wfawsr83h0kfgxl6dxw4cgrbgxsz7bpkj34qkv19d3m";
        authors = [
          "The rust-url developers"
        ];
        dependencies = [
          {
            name = "idna";
            packageId = "idna";
          }
          {
            name = "matches";
            packageId = "matches";
          }
          {
            name = "percent-encoding";
            packageId = "percent-encoding";
          }
        ];
        
      };
      "vcpkg" = rec {
        crateName = "vcpkg";
        version = "0.2.7";
        edition = "2015";
        sha256 = "15dzk1b96q946v9aisbd1bbhi33n93wvgziwh1shmscn1xflbp9k";
        authors = [
          "Jim McGrath <jimmc2@gmail.com>"
        ];
        
      };
      "wasi" = rec {
        crateName = "wasi";
        version = "0.7.0";
        edition = "2018";
        sha256 = "03apg3sa4hjn6xwa4pkyvzjiscya51wyrygadgxwdg8lrvj3r75q";
        authors = [
          "The Cranelift Project Developers"
        ];
        features = {
          "default" = [ "alloc" ];
          "rustc-dep-of-std" = [ "compiler_builtins" "core" "rustc-std-workspace-alloc" ];
        };
        resolvedDefaultFeatures = [ "alloc" "default" ];
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
