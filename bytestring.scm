(define-module (bytestring)
  #:use-module (guix)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system haskell)

  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check))

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
