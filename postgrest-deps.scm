(define-module (postgrest-deps)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (guix git-download)
  #:use-module (guix build-system haskell)
  #:use-module (guix licenses)
  #:use-module (guix packages)

  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-crypto)
  #:use-module (gnu packages haskell-web)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages databases))

(define-public ghc-configurator-pg
  (package
    (name "ghc-configurator-pg")
    (version "0.1.0.3")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/configurator-pg/configurator-pg-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0fc77ihnablff8v0kgr88pcc3rn41ca14bvfxr21jx807fn8g63p"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-attoparsec" ,ghc-attoparsec)
        ("ghc-protolude" ,ghc-protolude)
        ("ghc-scientific" ,ghc-scientific)))
    (native-inputs
      `(("ghc-hunit" ,ghc-hunit)
        ("ghc-test-framework" ,ghc-test-framework)
        ("ghc-test-framework-hunit"
         ,ghc-test-framework-hunit)))
    (home-page
      "https://github.com/robx/configurator-pg")
    (synopsis
      "Reduced parser for configurator-ng config files")
    (description
      "This module provides a simplified and updated interface to the configuration file format of <https://hackage.haskell.org/package/configurator configurator> and <https://hackage.haskell.org/package/configurator-ng configurator-ng>. Its aim is primarily to allow updating programs that depend on configurator-ng to new versions of GHC without changing the configuration file format.")
    (license bsd-3)))

(define-public ghc-only
  (package
    (name "ghc-only")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/Only/Only-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0rdj3a629fk2vp121jq8mf2smkblrz5w3cxhlsyx6my2x29s2ymb"))))
    (build-system haskell-build-system)
    (arguments
     `(#:cabal-revision
       ("1"
        "1ahk7p34kmh041mz7lyc10nhcxgv2i4z8nvzxvqm2x34gslmsbzr")))
    (home-page
     "http://hackage.haskell.org/package/Only")
    (synopsis
     "The 1-tuple type or single-value \"collection\"")
    (description
     "This package provides a canonical anonymous 1-tuple type missing from Haskell for attaching typeclass instances. . NOTE: There is also the </package/OneTuple OneTuple package> which by using a boxed @data@-type provides a 1-tuple type which has laziness properties which are more faithful to the ones of Haskell's native tuples; whereas the primary purpose of 'Only' is to provide the traditionally so named type-wrapper for attaching typeclass instances.")
    (license bsd-3)))

(define-public ghc-ranged-sets
  (package
    (name "ghc-ranged-sets")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/Ranged-sets/Ranged-sets-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1skd2a6yw7dd5vq8x81kwh28gi8sgyzg9qqqyadxmgpvy11sh9ab"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-hunit" ,ghc-hunit)
       ("ghc-quickcheck" ,ghc-quickcheck)))
    (home-page
     "https://github.com/PaulJohnson/Ranged-sets")
    (synopsis "Ranged sets for Haskell")
    (description
     "A ranged set is an ordered list of ranges.  This allows sets such as all reals x such that: . > (0.25 < x <= 0.75 or 1.4 <= x < 2.3 or 4.5 < x) . Alternatively you can have all strings s such that: . >    (\"F\" <= s < \"G\")")
    (license bsd-3)))

(define-public ghc-base-compat-batteries
  (package
    (name "ghc-base-compat-batteries")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/base-compat-batteries/base-compat-batteries-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1j8ky6241mj1ymbwm9scvyvbknj7n2r56cnkg9y1zf2xwjpqnmqm"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-base-compat" ,ghc-base-compat)))
    (native-inputs
     `(("ghc-hspec" ,ghc-hspec)
       ("hspec-discover" ,hspec-discover)))
    (home-page
     "http://hackage.haskell.org/package/base-compat-batteries")
    (synopsis "base-compat with extra batteries")
    (description
     "Provides functions available in later versions of @base@ to a wider range of compilers, without requiring you to use CPP pragmas in your code. . This package provides the same API as the @<http://hackage.haskell.org/package/base-compat base-compat>@ library, but depends on compatibility packages (such as @semigroups@) to offer a wider support window than @base-compat@, which has no dependencies. Most of the modules in this library have the same names as in @base-compat@ to make it easier to switch between the two. There also exist versions of each module with the suffix @.Repl.Batteries@, which are distinct from anything in @base-compat@, to allow for easier use in GHCi. . See @<https://github.com/haskell-compat/base-compat/blob/master/base-compat/README.markdown#dependencies here>@ for a more comprehensive list of differences between @base-compat@ and @base-compat-batteries@.")
    (license expat)))

(define-public ghc-binary-parser
  (package
    (name "ghc-binary-parser")
    (version "0.5.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/binary-parser/binary-parser-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1cs3zrhgnng2h84xnnvqcy6yrdm0xay1494dsa612y590s773aqx"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-base-prelude" ,ghc-base-prelude)))
    (arguments
     `(#:tests?  ; rely on outdated test library versions
       #f        ; https://github.com/nikita-volkov/binary-parser/pull/3
       #:cabal-revision
       ("3"
        "14n41yazmks2qw0v4krxcqw3ac0wdy2z53d0qz0rdjcd94fpghjf")))
    (home-page
     "https://github.com/nikita-volkov/binary-parser")
    (synopsis
     "A highly-efficient but limited parser API specialised for bytestrings")
    (description "")
    (license expat)))

(define-public ghc-bytestring-strict-builder
  (package
    (name "ghc-bytestring-strict-builder")
    (version "0.4.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/bytestring-strict-builder/bytestring-strict-builder-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "17n6ll8k26312fgxbhws1yrswvy5dbsgyf57qksnj0akdssysy8q"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-semigroups" ,ghc-semigroups)
       ("ghc-base-prelude" ,ghc-base-prelude)))
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-quickcheck-instances" ,ghc-quickcheck-instances)
       ("ghc-rerebase" ,ghc-rerebase)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (arguments
     `(#:cabal-revision
       ("1"
        "1snn8qb17maa76zji75i4yfz9x8ci16xp6zwg6kgwb33lf06imnd")))
    (home-page
     "https://github.com/nikita-volkov/bytestring-strict-builder")
    (synopsis
     "An efficient strict bytestring builder")
    (description
     "According to <https://github.com/nikita-volkov/bytestring-builders-benchmark the competition benchmarks>, this library provides on average the fastest builder of strict bytestrings. . Practical benchmarks have proven it to be highly performant as well. The encoders from the \\\"postgresql-binary\\\" library have shown a stable performance improvement by factors of up to 10 after the migration from the standard builder to \\\"bytestring-strict-builder\\\".")
    (license expat)))

(define-public ghc-bytestring-tree-builder
  (package
    (name "ghc-bytestring-tree-builder")
    (version "0.2.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/bytestring-tree-builder/bytestring-tree-builder-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "03h2nmhyrr63gw4xmflsrmwf80gvayhs32wnpg3k9aqfjzpz4bd1"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-semigroups" ,ghc-semigroups)
       ("ghc-base-prelude" ,ghc-base-prelude)))
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-quickcheck-instances" ,ghc-quickcheck-instances)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page
     "https://github.com/nikita-volkov/bytestring-tree-builder")
    (synopsis
     "A very efficient ByteString builder implementation based on the binary tree")
    (description
     "According to <https://github.com/nikita-volkov/bytestring-builders-benchmark the benchmarks> this builder implementation beats all the alternatives. It is especially well-suited for generating strict bytestrings, beating the standard builder by at least the factor of 4.")
    (license expat)))

(define-public ghc-cassava
  (package
    (name "ghc-cassava")
    (version "0.5.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/cassava/cassava-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0xs2c5lpy0g5lsmp2cx0dm5lnxij7cgry6xd5gsn3bfdlap8lb3n"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-hashable" ,ghc-hashable)
       ("ghc-scientific" ,ghc-scientific)
       ("ghc-unordered-containers"
        ,ghc-unordered-containers)
       ("ghc-vector" ,ghc-vector)
       ("ghc-only" ,ghc-only)
       ("ghc-text-short" ,ghc-text-short)
       ("ghc-bytestring-builder"
        ,ghc-bytestring-builder)))
    ;(native-inputs
    ; `(("ghc-quickcheck" ,ghc-quickcheck)
    ;   ("ghc-quickcheck-instances" ,ghc-quickcheck-instances)
    ;   ("ghc-hunit" ,ghc-hunit)
    ;   ("ghc-test-framework" ,ghc-test-framework)
    ;   ("ghc-test-framework-hunit" ,ghc-test-framework-hunit)
    ;   ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2)))
    (arguments
     `(#:tests? ; required outdated QuickCheck==2.10.*
       #f
       #:cabal-revision
       ("2"
        "13mbhan3agzf8ki8hcac1xf50h9nbzx2b47zjqrch2050v6xa351")))
    (home-page "https://github.com/hvr/cassava")
    (synopsis "A CSV parsing and encoding library")
    (description
     "@cassava@ is a library for parsing and encoding [RFC 4180](https://tools.ietf.org/html/rfc4180)
compliant [comma-separated values (CSV)](https://en.wikipedia.org/wiki/Comma-separated_values) data,
which is a textual line-oriented format commonly used for exchanging tabular data.
.
@cassava@'s API includes support for
.
- Index-based record-conversion
- Name-based record-conversion
- Typeclass directed conversion of fields and records
- Built-in field-conversion instances for standard types
- Customizable record-conversion instance derivation via GHC generics
- Low-level [bytestring](https://hackage.haskell.org/package/bytestring) builders (see \"Data.Csv.Builder\")
- Incremental decoding and encoding API (see \"Data.Csv.Incremental\")
- Streaming API for constant-space decoding (see \"Data.Csv.Streaming\")
.
Moreover, this library is designed to be easy to use; for instance, here's a
very simple example of encoding CSV data:
.
>>> Data.Csv.encode [(\"John\",27),(\"Jane\",28)]
\"John,27\\r\
Jane,28\\r\
\"
.
Please refer to the documentation in \"Data.Csv\" and the included [README](#readme) for more usage examples.")
    (license bsd-3)))

(define-public ghc-concise
  (package
    (name "ghc-concise")
    (version "0.1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/concise/concise-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "09crgc6gjfidlad6263253xx1di6wfhc9awhira21s0z7rddy9sw"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-lens" ,ghc-lens)))
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-quickcheck-instances" ,ghc-quickcheck-instances)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page
     "https://github.com/frasertweedale/hs-concise")
    (synopsis "Utilities for Control.Lens.Cons")
    (description
     "concise provides a handful of functions to extend what you can do with Control.Lens.Cons.")
    (license bsd-3)))

(define-public ghc-data-bword
  (package
    (name "ghc-data-bword")
    (version "0.1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/data-bword/data-bword-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0zfvk7b7qi6inra0kc03rhsic2rj0818n4i03lfwzvb5g22izw3h"))))
    (build-system haskell-build-system)
    (native-inputs
     `(("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page "https://github.com/mvv/data-bword")
    (synopsis
     "Extra operations on binary words of fixed length")
    (description
     "This package provides extra (vs. 'Data.Bits') operations on binary words of fixed length.")
    (license bsd-3)))

(define-public ghc-data-checked
  (package
    (name "ghc-data-checked")
    (version "0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/data-checked/data-checked-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0xjn7iqlsgi51h8gz4x40kc2qb5lwf6nw5kjwgkck1w5gjfd11yw"))))
    (build-system haskell-build-system)
    (home-page "https://github.com/mvv/data-checked")
    (synopsis
     "Type-indexed runtime-checked properties")
    (description
     "This package provides a (phantom) type-indexed newtype evidence-wrapper for values that are checked to satisfy the property associated with the type.")
    (license bsd-3)))

(define-public ghc-data-dword
  (package
    (name "ghc-data-dword")
    (version "0.3.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/data-dword/data-dword-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "084invjg8zj7ndxnz9clqmq06ch47k1d9lhxwap6xs0x4807crvb"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-hashable" ,ghc-hashable)
       ("ghc-data-bword" ,ghc-data-bword)))
    (native-inputs
     `(("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page "https://github.com/mvv/data-dword")
    (synopsis
     "Stick two binary words together to get a bigger one")
    (description
     "This package provides Template Haskell utilities for declaring fixed-length binary word data types. Signed and unsigned 96, 128, 160, 192, 224, and 256-bit types are predefined.")
    (license bsd-3)))

(define-public ghc-data-endian
  (package
    (name "ghc-data-endian")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/data-endian/data-endian-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1h1abz87nha7cpw50yvf8fwvcca350wnnz2d3z9k30sg6wq4y7cc"))))
    (build-system haskell-build-system)
    (home-page "https://github.com/mvv/data-endian")
    (synopsis "Endian-sensitive data")
    (description
     "This package provides helpers for converting endian-sensitive data.")
    (license bsd-3)))

(define-public ghc-data-serializer
  (package
    (name "ghc-data-serializer")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/data-serializer/data-serializer-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1ijy8l5lxmm8wpzx4h2vh9q21zz66xgh979s32aa4b16l9m1b4z7"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-semigroups" ,ghc-semigroups)
       ("ghc-cereal" ,ghc-cereal)
       ("ghc-data-endian" ,ghc-data-endian)
       ("ghc-parsers" ,ghc-parsers)
       ("ghc-split" ,ghc-split)))
    (native-inputs
     `(("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page
     "https://github.com/mvv/data-serializer")
    (synopsis
     "Common API for serialization libraries")
    (description
     "This package provides a common API for serialization libraries like <http://hackage.haskell.org/package/binary binary> and <http://hackage.haskell.org/package/cereal cereal>.")
    (license bsd-3)))

(define-public ghc-data-textual
  (package
    (name "ghc-data-textual")
    (version "0.3.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/data-textual/data-textual-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0c4qs923dj4jnvvkjvbij0c1yg922iw66140cq6wb1m4h6q31ia4"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-text-latin1" ,ghc-text-latin1)
       ("ghc-text-printer" ,ghc-text-printer)
       ("ghc-parsers" ,ghc-parsers)))
    (native-inputs
     `(("ghc-test-framework" ,ghc-test-framework)
       ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2)
       ("ghc-type-hint" ,ghc-type-hint)))
    (home-page "https://github.com/mvv/data-textual")
    (synopsis
     "Human-friendly textual representations.")
    (description
     "This package provides an interface for converting between data and its (human-friendly) textual representation.")
    (license bsd-3)))

(define-public ghc-directory
  (package
    (name "ghc-directory")
    (version "1.3.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/directory/directory-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0zkqihmdfz7bzv3sxh1p9ijl4vra880kfy3qy9h96flq7d2if0f2"))))
    (build-system haskell-build-system)
    (home-page
     "http://hackage.haskell.org/package/directory")
    (synopsis
     "Platform-agnostic library for filesystem operations")
    (description
     "This library provides a basic set of operations for manipulating files and directories in a portable way.")
    (license bsd-3)))

(define-public ghc-expiring-cache-map
  (package
    (name "ghc-expiring-cache-map")
    (version "0.0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/expiring-cache-map/expiring-cache-map-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1fb47hsn06ybn2yzw7r6pjkmvvfpbdx7wjhbpxcywilbjyac4fqf"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-hashable" ,ghc-hashable)
       ("ghc-unordered-containers"
        ,ghc-unordered-containers)))
    (home-page
     "https://github.com/elblake/expiring-cache-map")
    (synopsis "General purpose simple caching.")
    (description
     "A simple general purpose shared state cache map with automatic expiration of values, for caching the results of accessing a resource such as reading a file. With variations for Ord and Hashable keys using \"Data.Map.Strict\" and \"Data.HashMap.Strict\", respectively.")
    (license bsd-3)))

(define-public ghc-bug
  (package
    (name "ghc-bug")
    (version "1.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/bug/bug-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1xfynvp5fyn46gg3p5qq9cmb1dnw2dyf3bz6w5wdvikfvs19dwhq"))))
    (build-system haskell-build-system)
    (home-page
      "https://github.com/nikita-volkov/bug")
    (synopsis
      "Better alternatives to the \"error\" function")
    (description "")
    (license expat)))

(define-public ghc-hasql
  (package
    (name "ghc-hasql")
    (version "1.3.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/hasql/hasql-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "01vl4p67yhcm8cmbmajgyd7ggj3p5f6350f8sky8kv3dn31wg6ji"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-postgresql-binary" ,ghc-postgresql-binary)
       ("ghc-postgresql-libpq" ,ghc-postgresql-libpq)
       ("ghc-bytestring-strict-builder"
        ,ghc-bytestring-strict-builder)
       ("ghc-dlist" ,ghc-dlist)
       ("ghc-vector" ,ghc-vector)
       ("ghc-hashtables" ,ghc-hashtables)
       ("ghc-text-builder" ,ghc-text-builder)
       ("ghc-hashable" ,ghc-hashable)
       ("ghc-data-default-class"
        ,ghc-data-default-class)
       ("ghc-profunctors" ,ghc-profunctors)
       ("ghc-contravariant-extras"
        ,ghc-contravariant-extras)
       ("ghc-contravariant" ,ghc-contravariant)
       ("ghc-loch-th" ,ghc-loch-th)
       ("ghc-placeholders" ,ghc-placeholders)
       ("ghc-base-prelude" ,ghc-base-prelude)))
    ;(native-inputs
    ; `(("ghc-bug" ,ghc-bug)
    ;   ("ghc-quickcheck" ,ghc-quickcheck)
    ;   ("ghc-quickcheck-instances" ,ghc-quickcheck-instances)
    ;   ("ghc-rerebase" ,ghc-rerebase)
    ;   ("ghc-tasty" ,ghc-tasty)
    ;   ("ghc-tasty-hunit" ,ghc-tasty-hunit)
    ;   ("ghc-tasty-quickchec" ,ghc-tasty-quickcheck)))
    (arguments
     `(#:tests?  ; tests require a running postgres
       #f
       #:cabal-revision
       ("2"
        "14063k0dald0i2cqk70kdja1df587vn8vrzgw3rb62nxwycr0r9b")))
    (home-page
     "https://github.com/nikita-volkov/hasql")
    (synopsis
     "An efficient PostgreSQL driver and a flexible mapping API")
    (description
     "This package is the root of the \\\"hasql\\\" ecosystem. . The API is completely disinfected from exceptions. All error-reporting is explicit and is presented using the 'Either' type. . The version 1 is completely backward-compatible with 0.19.")
    (license expat)))

(define-public ghc-hasql-pool
  (package
    (name "ghc-hasql-pool")
    (version "0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/hasql-pool/hasql-pool-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0bsxh9yf5p2iknrnssrif563n42ih14cj95qmy9z2lz2kbycscrs"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-resource-pool" ,ghc-resource-pool)
       ("ghc-hasql" ,ghc-hasql)
       ("ghc-base-prelude" ,ghc-base-prelude)))
    (arguments `(#:tests? #f)) ; tests require running postgres
    (home-page
     "https://github.com/nikita-volkov/hasql-pool")
    (synopsis "A pool of connections for Hasql")
    (description "")
    (license expat)))

(define-public ghc-hasql-transaction
  (package
    (name "ghc-hasql-transaction")
    (version "0.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/hasql-transaction/hasql-transaction-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1kvzj16mw471z2vgm27k0nfwfgf5cq3w6qaqwqz4247p11dkrjyy"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-hasql" ,ghc-hasql)
       ("ghc-bytestring-tree-builder"
        ,ghc-bytestring-tree-builder)
       ("ghc-contravariant" ,ghc-contravariant)
       ("ghc-contravariant-extras"
        ,ghc-contravariant-extras)
       ("ghc-base-prelude" ,ghc-base-prelude)))
    (arguments `(#:tests? #f))  ; required running postgresql
    (home-page
     "https://github.com/nikita-volkov/hasql-transaction")
    (synopsis
     "A composable abstraction over the retryable transactions for Hasql")
    (description "")
    (license expat)))

(define-public ghc-heredoc
  (package
    (name "ghc-heredoc")
    (version "0.2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/heredoc/heredoc-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0h0g2f7yscwl1ba1yn3jnz2drvd6ns9m910hwlmq3kdq3k39y3f9"))))
    (build-system haskell-build-system)
    (home-page
     "http://hackage.haskell.org/package/heredoc")
    (synopsis
     "multi-line string / here document using QuasiQuotes")
    (description
     "multi-line string / here document using QuasiQuotes")
    (license public-domain)))

(define-public ghc-http-media
  (package
    (name "ghc-http-media")
    (version "0.7.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/http-media/http-media-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0kqjzvh5y8r6x5rw2kgd816w2963c6cbyw2qjvaj2mv59zxzqkrr"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-utf8-string" ,ghc-utf8-string)))
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-test-framework" ,ghc-test-framework)
       ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2)))
    (arguments
     `(#:cabal-revision
       ("1"
        "19py5pspx80gg679p9dzqr3iidflppxc1x4vkldamjkidyi406j8")))
    (home-page "https://github.com/zmthy/http-media")
    (synopsis
     "Processing HTTP Content-Type and Accept headers")
    (description
     "This library is intended to be a comprehensive solution to parsing and selecting quality-indexed values in HTTP headers.  It is capable of parsing both media types and language parameters from the Accept and Content header families, and can be extended to match against other accept headers as well.  Selecting the appropriate header value is achieved by comparing a list of server options against the quality-indexed values supplied by the client. . In the following example, the Accept header is parsed and then matched against a list of server options to serve the appropriate media using 'mapAcceptMedia': . > getHeader >>= maybe send406Error sendResourceWith . mapAcceptMedia >     [ (\"text/html\",        asHtml) >     , (\"application/json\", asJson) >     ] . Similarly, the Content-Type header can be used to produce a parser for request bodies based on the given content type with 'mapContentMedia': . > getContentType >>= maybe send415Error readRequestBodyWith . mapContentMedia >     [ (\"application/json\", parseJson) >     , (\"text/plain\",       parseText) >     ] . The API is agnostic to your choice of server.")
    (license expat)))

(define-public ghc-insert-ordered-containers
  (package
    (name "ghc-insert-ordered-containers")
    (version "0.2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/insert-ordered-containers/insert-ordered-containers-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1612f455dw37da9g7bsd1s5kyi84mnr1ifnjw69892amyimi47fp"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-aeson" ,ghc-aeson)
       ("ghc-base-compat" ,ghc-base-compat)
       ("ghc-hashable" ,ghc-hashable)
       ("ghc-lens" ,ghc-lens)
       ("ghc-semigroupoids" ,ghc-semigroupoids)
       ("ghc-semigroups" ,ghc-semigroups)
       ("ghc-unordered-containers"
        ,ghc-unordered-containers)))
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (arguments
     `(#:cabal-revision
       ("9"
        "02d4zqyb9dbahkpcbpgxylrc5xxc0zbw1awj5w0jyrql2g2b6a5f")))
    (home-page
     "https://github.com/phadej/insert-ordered-containers#readme")
    (synopsis
     "Associative containers retaining insertion order for traversals.")
    (description
     "Associative containers retaining insertion order for traversals. . The implementation is based on `unordered-containers`.")
    (license bsd-3)))

(define-public ghc-interpolatedstring-perl6
  (package
    (name "ghc-interpolatedstring-perl6")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/interpolatedstring-perl6/interpolatedstring-perl6-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0n3j6qvzp6as5ji93rn0sy873w5hdsplik51lkrah42cl95vmbay"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-haskell-src-meta" ,ghc-haskell-src-meta)))
    (home-page
     "http://hackage.haskell.org/package/interpolatedstring-perl6")
    (synopsis
     "QuasiQuoter for Perl6-style multi-line interpolated strings")
    (description
     "QuasiQuoter for Perl6-style multi-line interpolated strings with \\\"q\\\", \\\"qq\\\" and \\\"qc\\\" support.")
    (license public-domain)))

(define-public ghc-tasty-hspec
  (package
    (name "ghc-tasty-hspec")
    (version "1.1.5.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/tasty-hspec/tasty-hspec-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0i9kdzjpk750sa078jj3iyhp72k0177zk7vxl131r6dkyz09x27y"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-hspec" ,ghc-hspec)
        ("ghc-hspec-core" ,ghc-hspec-core)
        ("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-smallcheck" ,ghc-tasty-smallcheck)
        ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (arguments
      `(#:cabal-revision
        ("3"
         "1wgz3z5bnq5qml8d0i18gvz30dmmax3686lmqz3vf4hxd3vqfkpj")))
    (home-page
      "https://github.com/mitchellwrosen/tasty-hspec")
    (synopsis
      "Hspec support for the Tasty test framework.")
    (description
      "This package provides a Tasty provider for Hspec test suites.")
    (license bsd-3)))

(define-public ghc-jose
  (package
    (name "ghc-jose")
    (version "0.7.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/jose/jose-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "051rjqfskizgm9j927zh500q54lii3scldsymgcdfbaw40d0mncc"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-base64-bytestring" ,ghc-base64-bytestring)
       ("ghc-concise" ,ghc-concise)
       ("ghc-cryptonite" ,ghc-cryptonite)
       ("ghc-lens" ,ghc-lens)
       ("ghc-memory" ,ghc-memory)
       ("ghc-monad-time" ,ghc-monad-time)
       ("ghc-semigroups" ,ghc-semigroups)
       ("ghc-safe" ,ghc-safe)
       ("ghc-aeson" ,ghc-aeson)
       ("ghc-unordered-containers"
        ,ghc-unordered-containers)
       ("ghc-network-uri" ,ghc-network-uri)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-quickcheck-instances"
        ,ghc-quickcheck-instances)
       ("ghc-x509" ,ghc-x509)
       ("ghc-vector" ,ghc-vector)))
    (native-inputs
     `(("ghc-hspec" ,ghc-hspec)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hspec" ,ghc-tasty-hspec)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page
     "https://github.com/frasertweedale/hs-jose")
    (synopsis
     "Javascript Object Signing and Encryption and JSON Web Token library")
    (description
     ". An implementation of the Javascript Object Signing and Encryption (JOSE) and JSON Web Token (JWT; RFC 7519) formats. . The JSON Web Signature (JWS; RFC 7515) implementation is complete. . EdDSA signatures (RFC 8037) are supported (Ed25519 only). . JWK Thumbprint (RFC 7638) is supported (requires /aeson/ >= 0.10). . JSON Web Encryption (JWE; RFC 7516) is not yet implemented. . The __ECDSA implementation is vulnerable to timing attacks__ and should only be used for verification.")
    (license asl2.0)))

(define-public ghc-lens-aeson
  (package
    (name "ghc-lens-aeson")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/lens-aeson/lens-aeson-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1k028ycmhz7mnjlrap88fqix4nmmpyy6b88m16kv77d3r8sz04a3"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-lens" ,ghc-lens)
       ("ghc-vector" ,ghc-vector)
       ("ghc-unordered-containers"
        ,ghc-unordered-containers)
       ("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-aeson" ,ghc-aeson)
       ("ghc-scientific" ,ghc-scientific)))
    (native-inputs
     `(("cabal-doctest" ,cabal-doctest)
       ("ghc-doctest" ,ghc-doctest)
       ("ghc-generic-deriving" ,ghc-generic-deriving)
       ("ghc-simple-reflect" ,ghc-simple-reflect)))
    (arguments
     `(#:cabal-revision
       ("6"
        "1pg5v8fnlqw1krgi3d2a03a0zkjjdv5yp5f5z6q4mlb5jldz99a8")))
    (home-page "http://github.com/lens/lens-aeson/")
    (synopsis "Law-abiding lenses for aeson")
    (description "Law-abiding lenses for aeson")
    (license expat)))

(define-public ghc-loch-th
  (package
    (name "ghc-loch-th")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/loch-th/loch-th-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1hvdkcyrlnv65q8x8h0441x30wr9bbfbg3961xd3fy9an5r961fc"))))
    (build-system haskell-build-system)
    (home-page "https://github.com/liskin/loch-th")
    (synopsis
     "Support for precise error locations in source files (Template Haskell version)")
    (description
     "This module provides a Template Haskell based mechanism to tag failures with the location of the failure call. The location message includes the file name, line and column numbers.")
    (license bsd-3)))

(define-public ghc-monad-time
  (package
    (name "ghc-monad-time")
    (version "0.3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/monad-time/monad-time-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0z30c0k5bqlz86vwajnm6kj26i09zx6dzqwd00z6ba8hqyzm1x0a"))))
    (build-system haskell-build-system)
    (home-page
     "https://github.com/scrive/monad-time")
    (synopsis
     "Type class for monads which carry the notion of the current time.")
    (description
     "'MonadTime' type class for monads which carry the notion of the current time.")
    (license bsd-3)))

(define-public ghc-mtl-compat
  (package
    (name "ghc-mtl-compat")
    (version "0.2.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/mtl-compat/mtl-compat-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "15388p9ybdn6digk6cpdsw6havd0yva8vvwl3p7fnc9sb59wln34"))))
    (build-system haskell-build-system)
    (arguments
     `(#:haddock?
       #f
       #:cabal-revision
       ("4"
        "1mfrx8cpx0502sjv0bmlfkl0h46c4krldg8m89k4fj6iawwg2ab5")))
    (home-page
     "https://github.com/haskell-compat/mtl-compat")
    (synopsis
     "Backported Control.Monad.Except module from mtl")
    (description
     "This package backports the \"Control.Monad.Except\" module from @mtl@ (if using @mtl-2.2.0.1@ or earlier), which reexports the @ExceptT@ monad transformer and the @MonadError@ class. . This package should only be used if there is a need to use the @Control.Monad.Except@ module specifically. If you just want the @mtl@ class instances for @ExceptT@, use @transformers-compat@ instead, since @mtl-compat@ does nothing but reexport the instances from that package. . Note that unlike how @mtl-2.2@ or later works, the \"Control.Monad.Except\" module defined in this package exports all of @ExceptT@'s monad class instances. Therefore, you may have to declare @import Control.Monad.Except ()@ at the top of your file to get all of the @ExceptT@ instances in scope.")
    (license bsd-3)))

(define-public ghc-network-ip
  (package
    (name "ghc-network-ip")
    (version "0.3.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/network-ip/network-ip-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1zjy232pamkd3977cyaq5w5r6ksbpqpgzzlds15zrahjccirs9gf"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-data-default-class"
        ,ghc-data-default-class)
       ("ghc-data-endian" ,ghc-data-endian)
       ("ghc-data-dword" ,ghc-data-dword)
       ("ghc-type-hint" ,ghc-type-hint)
       ("ghc-hashable" ,ghc-hashable)
       ("ghc-data-serializer" ,ghc-data-serializer)
       ("ghc-text-printer" ,ghc-text-printer)
       ("ghc-data-textual" ,ghc-data-textual)
       ("ghc-parsers" ,ghc-parsers)))
    (native-inputs
     `(("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page "https://github.com/mvv/network-ip")
    (synopsis "Internet Protocol data structures")
    (description
     "This package provides Internet Protocol data structures")
    (license bsd-3)))

(define-public ghc-placeholders
  (package
    (name "ghc-placeholders")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/placeholders/placeholders-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0ih35n2pw5gr9ggj2xz5zfcs4bdk200fdw6q9hdy3xna7maphak5"))))
    (build-system haskell-build-system)
    (home-page
     "http://github.com/ahammar/placeholders")
    (synopsis
     "Placeholders for use while developing Haskell code")
    (description
     "While working on some Haskell code, it is often useful to work incrementally by inserting @undefined@ as a placeholder for missing code. . This library provides placeholders that produce better messages when evaluated at run-time and also generate compile-time warnings so that they do not get forgotten so easily. For details, see <http://github.com/ahammar/placeholders>")
    (license bsd-3)))

(define-public ghc-postgresql-binary
  (package
    (name "ghc-postgresql-binary")
    (version "0.12.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/postgresql-binary/postgresql-binary-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "181npyfnz9xbmwjfzcrmbwlzw2xchy2fsibiw6d3c01y45xv607v"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-binary-parser" ,ghc-binary-parser)
       ("ghc-bytestring-strict-builder"
        ,ghc-bytestring-strict-builder)
       ("ghc-aeson" ,ghc-aeson)
       ("ghc-uuid" ,ghc-uuid)
       ("ghc-scientific" ,ghc-scientific)
       ("ghc-vector" ,ghc-vector)
       ("ghc-network-ip" ,ghc-network-ip)
       ("ghc-unordered-containers"
        ,ghc-unordered-containers)
       ("ghc-loch-th" ,ghc-loch-th)
       ("ghc-placeholders" ,ghc-placeholders)
       ("ghc-base-prelude" ,ghc-base-prelude)))
    (arguments `(#:tests? #f)) ; relies on running postgres
    (home-page
     "https://github.com/nikita-volkov/postgresql-binary")
    (synopsis
     "Encoders and decoders for the PostgreSQL's binary format")
    (description
     "An API for dealing with PostgreSQL's binary data format. . It can be used to implement performant bindings to Postgres. E.g., <http://hackage.haskell.org/package/hasql \"hasql\"> is based on this library. . It supports all Postgres versions starting from 8.3 and is tested against 8.3, 9.3 and 9.5 with the @integer_datetimes@ setting off and on.")
    (license expat)))

(define-public ghc-postgresql-libpq
  (package
    (name "ghc-postgresql-libpq")
    (version "0.9.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/postgresql-libpq/postgresql-libpq-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1y86kysakfcf3zq252yl2llrx3765vxvkdwda4q5ql7ikv3m786f"))))
    (build-system haskell-build-system)
    (inputs
     `(("postgresql" ,postgresql)))
    (home-page
     "https://github.com/phadej/postgresql-libpq")
    (synopsis "low-level binding to libpq")
    (description
     "This is a binding to libpq: the C application programmer's interface to PostgreSQL. libpq is a set of library functions that allow client programs to pass queries to the PostgreSQL backend server and to receive the results of these queries.")
    (license bsd-3)))

(define-public ghc-protolude
  (package
    (name "ghc-protolude")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/protolude/protolude-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0z251xxv8rhds981acdf6dr34ac2kc062mbq9gl2nj339grhqpb8"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-async" ,ghc-async)
       ("ghc-hashable" ,ghc-hashable)
       ("ghc-mtl-compat" ,ghc-mtl-compat)
       ("ghc-transformers-compat"
        ,ghc-transformers-compat)))
    (home-page "https://github.com/sdiehl/protolude")
    (synopsis "A small prelude.")
    (description
     "A sensible set of defaults for writing custom Preludes.")
    (license expat)))

(define-public ghc-wl-pprint-annotated
  (package
    (name "ghc-wl-pprint-annotated")
    (version "0.1.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/wl-pprint-annotated/wl-pprint-annotated-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1br7qyf27iza213inwhf9bm2k6in0zbmfw6w4clqlc9f9cj2nrkb"))))
    (build-system haskell-build-system)
    (native-inputs
      `(("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-hunit" ,ghc-tasty-hunit)))
    (home-page
      "https://github.com/minad/wl-pprint-annotated#readme")
    (synopsis
      "Pretty printer with annotation support")
    (description
      "Wadler/Leijen pretty printer with support for annotations and modernized API. Annotations are useful for coloring. See wl-pprint-console.")
    (license bsd-3)))

(define-public ghc-concurrent-output
  (package
    (name "ghc-concurrent-output")
    (version "1.10.9")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/concurrent-output/concurrent-output-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0mwf155w89nbbkjln7hhbn8k3f8p0ylcvgrg31cm7ijpx4499i4c"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-async" ,ghc-async)
        ("ghc-exceptions" ,ghc-exceptions)
        ("ghc-ansi-terminal" ,ghc-ansi-terminal)
        ("ghc-terminal-size" ,ghc-terminal-size)))
    (home-page
      "http://hackage.haskell.org/package/concurrent-output")
    (synopsis
      "Ungarble output from several threads or commands")
    (description
      "Lets multiple threads and external processes concurrently output to the console, without it getting all garbled up. . Built on top of that is a way of defining multiple output regions, which are automatically laid out on the screen and can be individually updated by concurrent threads. Can be used for progress displays etc. . <<https://joeyh.name/code/concurrent-output/demo2.gif>>")
    (license bsd-2)))

(define-public ghc-hedgehog
  (package
    (name "ghc-hedgehog")
    (version "1.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/hedgehog/hedgehog-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1np9xg58x20kalfci9dxbd4wsg0sl3ka56ragzy3i9p0nx29pmns"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-ansi-terminal" ,ghc-ansi-terminal)
        ("ghc-async" ,ghc-async)
        ("ghc-concurrent-output" ,ghc-concurrent-output)
        ("ghc-exceptions" ,ghc-exceptions)
        ("ghc-fail" ,ghc-fail)
        ("ghc-lifted-async" ,ghc-lifted-async)
        ("ghc-mmorph" ,ghc-mmorph)
        ("ghc-monad-control" ,ghc-monad-control)
        ("ghc-pretty-show" ,ghc-pretty-show)
        ("ghc-primitive" ,ghc-primitive)
        ("ghc-random" ,ghc-random)
        ("ghc-resourcet" ,ghc-resourcet)
        ("ghc-semigroups" ,ghc-semigroups)
        ("ghc-transformers-base" ,ghc-transformers-base)
        ("ghc-wl-pprint-annotated"
         ,ghc-wl-pprint-annotated)))
    (arguments
      `(#:cabal-revision
        ("1"
         "1b2hvd3z5mnwfdp5xwdwrh2f1l0wshnnz6ggak2dqqm57wyifdql")))
    (home-page "https://hedgehog.qa")
    (synopsis "Release with confidence.")
    (description
      "<http://hedgehog.qa/ Hedgehog> automatically generates a comprehensive array of test cases, exercising your software in ways human testers would never imagine. . Generate hundreds of test cases automatically, exposing even the most insidious of corner cases. Failures are automatically simplified, giving developers coherent, intelligible error messages. . To get started quickly, see the <https://github.com/hedgehogqa/haskell-hedgehog/tree/master/hedgehog-example examples>.")
    (license bsd-3)))

(define-public ghc-tasty-hedgehog
  (package
    (name "ghc-tasty-hedgehog")
    (version "1.0.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/tasty-hedgehog/tasty-hedgehog-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1mbg5q0c0xfrk4npfj60pi693igb7r5l78x6xf9fk2jglw0nmxhz"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-tagged" ,ghc-tagged)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-hedgehog" ,ghc-hedgehog)))
    (native-inputs
      `(("ghc-tasty-expected-failure"
         ,ghc-tasty-expected-failure)))
    (home-page
      "https://github.com/qfpl/tasty-hedgehog")
    (synopsis "Integration for tasty and hedgehog.")
    (description
      "Integrates the <https://hackage.haskell.org/package/hedgehog hedgehog testing library> with the <https://hackage.haskell.org/package/tasty tasty testing framework>.")
    (license bsd-3)))

(define-public ghc-retry
  (package
    (name "ghc-retry")
    (version "0.7.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/retry/retry-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0v6irf01xykhv0mwr1k5i08jn77irqbz8h116j8p435d11xc5jrw"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-data-default-class"
        ,ghc-data-default-class)
       ("ghc-exceptions" ,ghc-exceptions)
       ("ghc-random" ,ghc-random)))
    (native-inputs
     `(("ghc-hunit" ,ghc-hunit)
       ("ghc-hedgehog" ,ghc-hedgehog)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hedgehog" ,ghc-tasty-hedgehog)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)))
    (home-page "http://github.com/Soostone/retry")
    (synopsis
     "Retry combinators for monadic actions that may fail")
    (description
     "This package exposes combinators that can wrap arbitrary monadic actions. They run the action and potentially retry running it with some configurable delay for a configurable number of times. The purpose is to make it easier to work with IO and especially network IO actions that often experience temporary failure and warrant retrying of the original action. For example, a database query may time out for a while, in which case we should hang back for a bit and retry the query instead of simply raising an exception.")
    (license bsd-3)))

(define-public ghc-swagger2
  (package
    (name "ghc-swagger2")
    (version "2.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/swagger2/swagger2-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1jkfmfrldqrfqqnjf0g4spd03w9xjmi35k33xnhsmfj122455lw2"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-base-compat-batteries"
        ,ghc-base-compat-batteries)
       ("ghc-aeson" ,ghc-aeson)
       ("ghc-generics-sop" ,ghc-generics-sop)
       ("ghc-hashable" ,ghc-hashable)
       ("ghc-http-media" ,ghc-http-media)
       ("ghc-insert-ordered-containers"
        ,ghc-insert-ordered-containers)
       ("ghc-lens" ,ghc-lens)
       ("ghc-network" ,ghc-network)
       ("ghc-scientific" ,ghc-scientific)
       ("ghc-transformers-compat"
        ,ghc-transformers-compat)
       ("ghc-unordered-containers"
        ,ghc-unordered-containers)
       ("ghc-uuid-types" ,ghc-uuid-types)
       ("ghc-vector" ,ghc-vector)))
    (native-inputs
     `(("cabal-doctest" ,cabal-doctest)
       ("hspec-discover" ,hspec-discover)
       ("ghc-glob" ,ghc-glob)
       ("ghc-hunit" ,ghc-hunit)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-aeson-qq" ,ghc-aeson-qq)
       ("ghc-doctest" ,ghc-doctest)
       ("ghc-hspec" ,ghc-hspec)
       ("ghc-quickcheck-instances" ,ghc-quickcheck-instances)))
    (arguments
     `(#:cabal-revision
       ("3"
        "187jl8slpyr6blcxnhdp7wf85ab54pgqnbl11n816xg6fyqy7ylk")))
    (home-page
     "https://github.com/GetShopTV/swagger2")
    (synopsis "Swagger 2.0 data model")
    (description
     "This library is inteded to be used for decoding and encoding Swagger 2.0 API specifications as well as manipulating them. . The original Swagger 2.0 specification is available at http://swagger.io/specification/.")
    (license bsd-3)))

(define-public ghc-text-builder
  (package
    (name "ghc-text-builder")
    (version "0.5.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/text-builder/text-builder-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1xcyi3bw44anzah5c4c0wm18vnyqsr3q7ww2kp2psk41ql6gan2h"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-base-prelude" ,ghc-base-prelude)
       ("ghc-semigroups" ,ghc-semigroups)))
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-quickcheck-instances" ,ghc-quickcheck-instances)
       ("ghc-rerebase" ,ghc-rerebase)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page
     "https://github.com/nikita-volkov/text-builder")
    (synopsis "An efficient strict text builder")
    (description "")
    (license expat)))

(define-public ghc-text-latin1
  (package
    (name "ghc-text-latin1")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/text-latin1/text-latin1-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1wxbv6m567n3330baw2k0xxd50nhn2k6w3lgmpk6zq7x1jp84x3c"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-data-checked" ,ghc-data-checked)
       ("ghc-semigroups" ,ghc-semigroups)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-hashable" ,ghc-hashable)))
    (home-page "https://github.com/mvv/text-latin1")
    (synopsis
     "Latin-1 (including ASCII) utility functions")
    (description
     "This package provides various functions over the ASCII ang Latin-1 portions of the 'Char' and 'Word8' data types.")
    (license bsd-3)))

(define-public ghc-text-printer
  (package
    (name "ghc-text-printer")
    (version "0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/text-printer/text-printer-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "02sadjd19dbxzawr1q8z3j7w6vhp5mvz1dbssk118hsvl6k0234g"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-text-latin1" ,ghc-text-latin1)
       ("ghc-semigroups" ,ghc-semigroups)))
    (arguments `(#:tests? #f))
    (home-page "https://github.com/mvv/text-printer")
    (synopsis
     "Abstract interface for text builders/printers.")
    (description
     "This package provides an interface for injecting text into monoids such as builders and printers.")
    (license bsd-3)))

(define-public ghc-text-short
  (package
    (name "ghc-text-short")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/text-short/text-short-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0rqiwgjkgyfy8596swl0s0x2jqk6ddh2h02qxa32az2cs5kviwmk"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-hashable" ,ghc-hashable)))
    (arguments
     `(#:cabal-revision
       ("2"
        "106p7c0399zxdlh9f9qkgy7g2gp3bxqdpy6m6lnfhzi0pm5y8mks")))
    (native-inputs
     `(("ghc-quickcheck-instances" ,ghc-quickcheck-instances)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page
     "http://hackage.haskell.org/package/text-short")
    (synopsis
     "Memory-efficient representation of Unicode text strings")
    (description
     "This package provides the 'ShortText' type which is suitable for keeping many short strings in memory. This is similiar to how 'ShortByteString' relates to 'ByteString'. . The main difference between 'Text' and 'ShortText' is that 'ShortText' uses UTF-8 instead of UTF-16 internally and also doesn't support zero-copy slicing (thereby saving 2 words). Consequently, the memory footprint of a (boxed) 'ShortText' value is 4 words (2 words when unboxed) plus the length of the UTF-8 encoded payload.")
    (license bsd-3)))

(define-public ghc-type-hint
  (package
    (name "ghc-type-hint")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/type-hint/type-hint-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1fcrma7m6y7i1y42rzhv7qch8xkk93lkh1767saw4hsb9fzwsq8i"))))
    (build-system haskell-build-system)
    (home-page "https://github.com/mvv/type-hint")
    (synopsis
     "Guide type inference with proxy values")
    (description
     "This package provides 'Proxy' values for various types from the @base@ library and functions to use these values as hints for type inference.")
    (license bsd-3)))

(define-public ghc-wai-cors
  (package
    (name "ghc-wai-cors")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/wai-cors/wai-cors-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "11m9d8hn9pb9brprz0kglldmcqj83kjkjdwdpxdbl12430ii1ina"))
       (patches (search-patches "ghc-wai-cors-skip-phantomjs-tests.patch"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-base-unicode-symbols"
        ,ghc-base-unicode-symbols)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-http-types" ,ghc-http-types)
       ("ghc-wai" ,ghc-wai)))
    (native-inputs
     `(("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)
       ("ghc-transformers-compat" ,ghc-transformers-compat)
       ("ghc-wai-extra" ,ghc-wai-extra)
       ("ghc-wai-websockets" ,ghc-wai-websockets)
       ("ghc-warp" ,ghc-warp)
       ("ghc-websockets" ,ghc-websockets)))
    (arguments
     `(#:configure-flags '("--flags=-wai-2" "--flags=-wai-1")))
    (home-page
     "https://github.com/larskuhtz/wai-cors")
    (synopsis "CORS for WAI")
    (description
     "This package provides an implemenation of Cross-Origin resource sharing (CORS) for <http://hackage.haskell.org/package/wai Wai> that aims to be compliant with <http://www.w3.org/TR/cors>.")
    (license expat)))

(define-public ghc-wai-middleware-static
  (package
    (name "ghc-wai-middleware-static")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/wai-middleware-static/wai-middleware-static-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1z5yapcf8j9w71f2na30snmalsajlyi8an2f9qrjdmajabyykr0b"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-cryptonite" ,ghc-cryptonite)
       ("ghc-memory" ,ghc-memory)
       ("ghc-expiring-cache-map"
        ,ghc-expiring-cache-map)
       ("ghc-http-types" ,ghc-http-types)
       ("ghc-mime-types" ,ghc-mime-types)
       ("ghc-old-locale" ,ghc-old-locale)
       ("ghc-semigroups" ,ghc-semigroups)
       ("ghc-wai" ,ghc-wai)))
    (arguments
     `(#:cabal-revision
       ("2"
        "17vq38dh7x1kqzfwla1s0rldd5hzm5mcrx49sjlzy8b66gd2n3ac")))
    (home-page
     "https://github.com/scotty-web/wai-middleware-static")
    (synopsis
     "WAI middleware that serves requests to static files.")
    (description
     "WAI middleware that intercepts requests to static files and serves them if they exist. . [WAI] <http://hackage.haskell.org/package/wai>")
    (license bsd-3)))

(define-public ghc-wai-app-static
  (package
    (name "ghc-wai-app-static")
    (version "3.1.6.3")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/wai-app-static/wai-app-static-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0s6bpz5gmjy797bnnw1y5mwy9761h46bjp1srnrh7cxlnvm93c4c"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-wai" ,ghc-wai)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-unix-compat" ,ghc-unix-compat)
        ("ghc-old-locale" ,ghc-old-locale)
        ("ghc-file-embed" ,ghc-file-embed)
        ("ghc-cryptonite" ,ghc-cryptonite)
        ("ghc-memory" ,ghc-memory)
        ("ghc-http-date" ,ghc-http-date)
        ("ghc-blaze-html" ,ghc-blaze-html)
        ("ghc-blaze-markup" ,ghc-blaze-markup)
        ("ghc-mime-types" ,ghc-mime-types)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-zlib" ,ghc-zlib)
        ("ghc-wai-extra" ,ghc-wai-extra)
        ("ghc-optparse-applicative"
         ,ghc-optparse-applicative)
        ("ghc-warp" ,ghc-warp)))
    (native-inputs
      `(("ghc-hspec" ,ghc-hspec)
        ("ghc-network" ,ghc-network)
        ("ghc-temporary" ,ghc-temporary)
        ("ghc-mockery" ,ghc-mockery)))
    (arguments
      `(#:cabal-revision
        ("2"
         "17wd7cxqwimhww53qihchrr62hnzirggk86migi9bcwv4wjykmqc")))
    (home-page
      "http://www.yesodweb.com/book/web-application-interface")
    (synopsis "WAI application for static serving")
    (description
      "API docs and the README are available at <http://www.stackage.org/package/wai-app-static>.")
    (license expat)))

(define-public ghc-websockets
  (package
    (name "ghc-websockets")
    (version "0.12.5.3")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/websockets/websockets-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0mkxl7iwl5pl2w0svji9248v4c0hi45k725jj5ybaknb73650ns4"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-attoparsec" ,ghc-attoparsec)
        ("ghc-base64-bytestring" ,ghc-base64-bytestring)
        ("ghc-bytestring-builder"
         ,ghc-bytestring-builder)
        ("ghc-case-insensitive" ,ghc-case-insensitive)
        ("ghc-network" ,ghc-network)
        ("ghc-random" ,ghc-random)
        ("ghc-sha" ,ghc-sha)
        ("ghc-streaming-commons" ,ghc-streaming-commons)
        ("ghc-entropy" ,ghc-entropy)))
    (native-inputs
      `(("ghc-hunit" ,ghc-hunit)
        ("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-test-framework" ,ghc-test-framework)
        ("ghc-test-framework-hunit"
         ,ghc-test-framework-hunit)
        ("ghc-test-framework-quickcheck2"
         ,ghc-test-framework-quickcheck2)))
    (home-page "http://jaspervdj.be/websockets")
    (synopsis
      "A sensible and clean way to write WebSocket-capable servers in Haskell.")
    (description
      "This library allows you to write WebSocket-capable servers. . An example server: <https://github.com/jaspervdj/websockets/blob/master/example/server.lhs> . An example client: <https://github.com/jaspervdj/websockets/blob/master/example/client.hs> . See also: . * The specification of the WebSocket protocol: <http://www.whatwg.org/specs/web-socket-protocol/> . * The JavaScript API for dealing with WebSockets: <http://www.w3.org/TR/websockets/>")
    (license bsd-3)))

(define-public ghc-wai-websockets
  (package
    (name "ghc-wai-websockets")
    (version "3.0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/wai-websockets/wai-websockets-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0b2xmdsrsqpssyib53wbr6r8hf75789ndyyanv37sv99iyqcwz4i"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-wai" ,ghc-wai)
        ("ghc-case-insensitive" ,ghc-case-insensitive)
        ("ghc-network" ,ghc-network)
        ("ghc-websockets" ,ghc-websockets)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-warp" ,ghc-warp)
        ("ghc-wai-app-static" ,ghc-wai-app-static)
        ("ghc-file-embed" ,ghc-file-embed)))
    (home-page "http://github.com/yesodweb/wai")
    (synopsis
      "Provide a bridge between WAI and the websockets package.")
    (description
      "API docs and the README are available at <http://www.stackage.org/package/wai-websockets>.")
    (license expat)))
