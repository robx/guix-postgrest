(define-module (postgrest-deps)
  #:use-module (guix)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system haskell)

  #:use-module (check)
  #:use-module (containers)
  #:use-module (control)
  #:use-module (core)
  #:use-module (data)
  #:use-module (more-data)

  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-crypto)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages haskell-web))

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
