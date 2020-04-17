
# This file was @generated by crate2nix 0.9.0-alpha.1 with the command:
#   "generate" "-o" "/home/jamie/Misc/cratesioout/longan-nano/v0.1.1.nix.tmp"
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
    packageId = "longan-nano";

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
    "longan-nano" = rec {
      packageId = "longan-nano";
      build = internal.buildRustCrateWithFeatures {
        packageId = "longan-nano";
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
        version = "1.0.0";
        edition = "2015";
        sha256 = "17cv6pwb4q08s0ynpr4n8hv5299hcmhdgvdchzixfpw8y5qcgapq";
        authors = [
          "Josh Stone <cuviper@gmail.com>"
        ];
        
      };
      "bare-metal" = rec {
        crateName = "bare-metal";
        version = "0.2.5";
        edition = "2015";
        sha256 = "1cy5pbb92fznnri72y6drfpjxj4qdmd62f0rrlgy70dxlppn9ssx";
        authors = [
          "Jorge Aparicio <jorge@japaric.io>"
        ];
        buildDependencies = [
          {
            name = "rustc_version";
            packageId = "rustc_version";
          }
        ];
        features = {
        };
      };
      "bit_field" = rec {
        crateName = "bit_field";
        version = "0.9.0";
        edition = "2015";
        sha256 = "0mjxkfcz2biq469iwsrj7jrj1cr54qrpssxbfiwn22chky86b1zd";
        authors = [
          "Philipp Oppermann <dev@phil-opp.com>"
        ];
        
      };
      "cast" = rec {
        crateName = "cast";
        version = "0.2.3";
        edition = "2015";
        sha256 = "1c5z7zryj0zwnhdgs6rw5dfvnlwc1vm19jzrlgx5055alnwk952b";
        authors = [
          "Jorge Aparicio <jorge@japaric.io>"
        ];
        buildDependencies = [
          {
            name = "rustc_version";
            packageId = "rustc_version";
          }
        ];
        features = {
          "default" = [ "std" ];
        };
      };
      "embedded-graphics" = rec {
        crateName = "embedded-graphics";
        version = "0.5.2";
        edition = "2018";
        sha256 = "1xszhzlsgy8zpwm2wdwk6yji2cxhsp665bl5q6779k36rfzpjikh";
        authors = [
          "James Waples <james@wapl.es>"
        ];
        features = {
          "bmp" = [ "tinybmp" ];
          "nalgebra_support" = [ "nalgebra" ];
          "tga" = [ "tinytga" ];
        };
        resolvedDefaultFeatures = [ "default" ];
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
      "gd32vf103-pac" = rec {
        crateName = "gd32vf103-pac";
        version = "0.2.0";
        edition = "2018";
        sha256 = "1bg8qf67w27cma7bqvnpp4cddxqs0m98xrbrzx3z4rx6krpvbli3";
        authors = [
          "The RISC-V Team <risc-v@teams.rust-embedded.org>"
        ];
        dependencies = [
          {
            name = "bare-metal";
            packageId = "bare-metal";
          }
          {
            name = "riscv";
            packageId = "riscv";
          }
          {
            name = "vcell";
            packageId = "vcell";
          }
        ];
        features = {
          "rt" = [ "riscv-rt" ];
        };
      };
      "gd32vf103xx-hal" = rec {
        crateName = "gd32vf103xx-hal";
        version = "0.2.1";
        edition = "2018";
        sha256 = "14kvm0siy128gdbnbpn5q2g25jkmpks6ja96yxzvq7dqbyrrql5p";
        authors = [
          "The RISC-V Team <risc-v@teams.rust-embedded.org>"
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
            name = "gd32vf103-pac";
            packageId = "gd32vf103-pac";
          }
          {
            name = "nb";
            packageId = "nb";
          }
          {
            name = "riscv";
            packageId = "riscv";
          }
          {
            name = "vcell";
            packageId = "vcell";
          }
          {
            name = "void";
            packageId = "void";
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "rt" = [ "riscv-rt" ];
        };
      };
      "longan-nano" = rec {
        crateName = "longan-nano";
        version = "0.1.1";
        edition = "2018";
        src = pkgs.callPackage ./tarball-v0.1.1.nix {};
        authors = [
          "Vadim Kaushan <admin@disasm.info>"
        ];
        dependencies = [
          {
            name = "embedded-hal";
            packageId = "embedded-hal";
          }
          {
            name = "gd32vf103xx-hal";
            packageId = "gd32vf103xx-hal";
          }
          {
            name = "nb";
            packageId = "nb";
          }
          {
            name = "riscv";
            packageId = "riscv";
          }
          {
            name = "st7735-lcd";
            packageId = "st7735-lcd";
            optional = true;
          }
        ];
        devDependencies = [
          {
            name = "embedded-graphics";
            packageId = "embedded-graphics";
          }
          {
            name = "panic-halt";
            packageId = "panic-halt";
          }
          {
            name = "riscv-rt";
            packageId = "riscv-rt";
          }
        ];
        features = {
          "lcd" = [ "st7735-lcd" ];
        };
        resolvedDefaultFeatures = [ "lcd" "st7735-lcd" ];
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
      "num-derive" = rec {
        crateName = "num-derive";
        version = "0.2.5";
        edition = "2015";
        sha256 = "1wnv7776fh4i40r3zfxcxcmm0dh029skx7gp4sjknz2kqm2hpzga";
        procMacro = true;
        libName = "num_derive";
        authors = [
          "The Rust Project Developers"
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
        features = {
          "full-syntax" = [ "syn/full" ];
        };
      };
      "num-traits" = rec {
        crateName = "num-traits";
        version = "0.2.11";
        edition = "2015";
        sha256 = "15khrlm1bra50nd48ijl1vln13m9xg4fxzghf28jp16ic5zf8ay6";
        authors = [
          "The Rust Project Developers"
        ];
        buildDependencies = [
          {
            name = "autocfg";
            packageId = "autocfg";
          }
        ];
        features = {
          "default" = [ "std" ];
        };
      };
      "panic-halt" = rec {
        crateName = "panic-halt";
        version = "0.2.0";
        edition = "2015";
        sha256 = "04nqaa97ph20ppyy58grwr23hrbw83pn0gf7apf73rdx1q7595ny";
        authors = [
          "Emil Fresk <emil.fresk@gmail.com>"
        ];
        
      };
      "proc-macro2" = rec {
        crateName = "proc-macro2";
        version = "0.4.30";
        edition = "2015";
        sha256 = "0nd71fl24sys066jrha6j7i34nfkjv44yzw8yww9742wmc8j0gfg";
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
        version = "0.6.13";
        edition = "2015";
        sha256 = "1qgqq48jymp5h4y082aanf25hrw6bpb678xh3zw993qfhxmkpqkc";
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
      "r0" = rec {
        crateName = "r0";
        version = "0.2.2";
        edition = "2015";
        sha256 = "07wl91ljvr8ca0d08j5d33fbv5p3v129f62lhrz5r3awn7sqv8z2";
        authors = [
          "Jorge Aparicio <japaricious@gmail.com>"
        ];
        
      };
      "rand" = rec {
        crateName = "rand";
        version = "0.5.6";
        edition = "2015";
        sha256 = "1fdcgja9167hlzkf4g5daqwp498lwiyq7aqm05whklpbsdyc8666";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "rand_core";
            packageId = "rand_core 0.3.1";
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "alloc" = [ "rand_core/alloc" ];
          "default" = [ "std" ];
          "nightly" = [ "i128_support" ];
          "serde1" = [ "serde" "serde_derive" "rand_core/serde1" ];
          "std" = [ "rand_core/std" "alloc" "libc" "winapi" "cloudabi" "fuchsia-cprng" ];
        };
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
      "riscv" = rec {
        crateName = "riscv";
        version = "0.5.4";
        edition = "2015";
        sha256 = "1sq2f3b6yzjvz7kk26l7spcq3w03xdp2cmyks6w8ggg0h778bdvb";
        authors = [
          "The RISC-V Team <risc-v@teams.rust-embedded.org>"
        ];
        dependencies = [
          {
            name = "bare-metal";
            packageId = "bare-metal";
          }
          {
            name = "bit_field";
            packageId = "bit_field";
          }
        ];
        features = {
        };
      };
      "riscv-rt" = rec {
        crateName = "riscv-rt";
        version = "0.6.1";
        edition = "2015";
        sha256 = "0d16nviqbs1m11vv7czm150cj7rb8v04z0lcfsfngqqkhl6jxsrv";
        authors = [
          "The RISC-V Team <risc-v@teams.rust-embedded.org>"
        ];
        dependencies = [
          {
            name = "r0";
            packageId = "r0";
          }
          {
            name = "riscv";
            packageId = "riscv";
          }
          {
            name = "riscv-rt-macros";
            packageId = "riscv-rt-macros";
          }
        ];
        devDependencies = [
          {
            name = "riscv";
            packageId = "riscv";
          }
        ];
        features = {
          "inline-asm" = [ "riscv/inline-asm" ];
        };
      };
      "riscv-rt-macros" = rec {
        crateName = "riscv-rt-macros";
        version = "0.1.6";
        edition = "2015";
        sha256 = "0lrxl8cmq9h9fz2arbqq53jwzqb9b6hvg1r0g1hc1plq30sgh99m";
        procMacro = true;
        authors = [
          "The RISC-V Team <risc-v@teams.rust-embedded.org>"
          "Jorge Aparicio <jorge@japaric.io>"
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
            name = "rand";
            packageId = "rand";
            usesDefaultFeatures = false;
          }
          {
            name = "syn";
            packageId = "syn";
            features = [ "extra-traits" "full" ];
          }
        ];
        
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
      "st7735-lcd" = rec {
        crateName = "st7735-lcd";
        version = "0.6.2";
        edition = "2018";
        sha256 = "1473nm6v94vhbka2prk3xlsh6b5m9cz2b8jzn6rdw1y616xwzsf7";
        authors = [
          "Paul Sajna <sajattack@gmail.com>"
        ];
        dependencies = [
          {
            name = "embedded-graphics";
            packageId = "embedded-graphics";
            optional = true;
          }
          {
            name = "embedded-hal";
            packageId = "embedded-hal";
          }
          {
            name = "nb";
            packageId = "nb";
          }
          {
            name = "num-derive";
            packageId = "num-derive";
            usesDefaultFeatures = false;
          }
          {
            name = "num-traits";
            packageId = "num-traits";
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "default" = [ "graphics" ];
          "graphics" = [ "embedded-graphics" ];
        };
        resolvedDefaultFeatures = [ "default" "embedded-graphics" "graphics" ];
      };
      "syn" = rec {
        crateName = "syn";
        version = "0.15.44";
        edition = "2015";
        sha256 = "1id5g6x6zihv3j7hwrw3m1jp636bg8dpi671r7zy3jvpkavb794w";
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
        resolvedDefaultFeatures = [ "clone-impls" "default" "derive" "extra-traits" "full" "parsing" "printing" "proc-macro" "quote" ];
      };
      "unicode-xid" = rec {
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
      "vcell" = rec {
        crateName = "vcell";
        version = "0.1.2";
        edition = "2015";
        sha256 = "0g2b99b6zam4idgc8p9inrig75qi775zg579i513lmpympf34vl7";
        authors = [
          "Jorge Aparicio <japaricious@gmail.com>"
        ];
        features = {
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
