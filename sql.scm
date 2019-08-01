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
