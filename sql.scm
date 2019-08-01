(define-module (sql)
  #:use-module (guix)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system haskell)

  #:use-module (gnu packages databases)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages haskell-web))

(define-public ghc-hasql
  (package
    (name "ghc-hasql")
    (version "1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/hasql/hasql-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0j2arb96i1dinpz1yxl2cjl4qhbljk9yph52cj9az50mvl8vx3w4"))))
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
       #f))
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
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/hasql-pool/hasql-pool-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0agl5ilp0amsp9pidhmgivdyaq43x3xi7hb80c91n9l92pv6163k"))))
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
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/hasql-transaction/hasql-transaction-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "13d5zisr34bdbiypvpcb114d4c9yi6pyb9wnhigqpwd90vzpzsb5"))))
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
