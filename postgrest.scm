(define-module (postgrest)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (guix git-download)
  #:use-module (guix build-system haskell)
  #:use-module (guix licenses)
  #:use-module (guix packages)

  #:use-module (bytestring)
  #:use-module (check)
  #:use-module (containers)
  #:use-module (control)
  #:use-module (core)
  #:use-module (data)
  #:use-module (more-data)
  #:use-module (sql)
  #:use-module (template)
  #:use-module (text)
  #:use-module (wai)
  #:use-module (postgrest-deps)

  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-web))

(define-public postgrest
  (package
    (name "postgrest")
    (version "6.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/postgrest/postgrest-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0m0zplw8f1ncnbmrnsylq2z7pv8r86hsndsgbld52wfdc85b3r0z"))))
    (build-system haskell-build-system)
    (arguments `(#:tests? #f)) ; tests require a running postgresql server
    (inputs
     `(("ghc-aeson" ,ghc-aeson)
       ("ghc-ansi-wl-pprint" ,ghc-ansi-wl-pprint)
       ("ghc-base64-bytestring" ,ghc-base64-bytestring)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-cassava" ,ghc-cassava)
       ("ghc-configurator-pg" ,ghc-configurator-pg)
       ("ghc-contravariant" ,ghc-contravariant)
       ("ghc-contravariant-extras"
        ,ghc-contravariant-extras)
       ("ghc-either" ,ghc-either)
       ("ghc-gitrev" ,ghc-gitrev)
       ("ghc-hasql" ,ghc-hasql)
       ("ghc-hasql-pool" ,ghc-hasql-pool)
       ("ghc-hasql-transaction" ,ghc-hasql-transaction)
       ("ghc-heredoc" ,ghc-heredoc)
       ("ghc-http" ,ghc-http)
       ("ghc-http-types" ,ghc-http-types)
       ("ghc-insert-ordered-containers"
        ,ghc-insert-ordered-containers)
       ("ghc-interpolatedstring-perl6"
        ,ghc-interpolatedstring-perl6)
       ("ghc-jose" ,ghc-jose)
       ("ghc-lens" ,ghc-lens)
       ("ghc-lens-aeson" ,ghc-lens-aeson)
       ("ghc-network-uri" ,ghc-network-uri)
       ("ghc-optparse-applicative"
        ,ghc-optparse-applicative)
       ("ghc-protolude" ,ghc-protolude)
       ("ghc-ranged-sets" ,ghc-ranged-sets)
       ("ghc-regex-tdfa" ,ghc-regex-tdfa)
       ("ghc-scientific" ,ghc-scientific)
       ("ghc-swagger2" ,ghc-swagger2)
       ("ghc-unordered-containers"
        ,ghc-unordered-containers)
       ("ghc-vector" ,ghc-vector)
       ("ghc-wai" ,ghc-wai)
       ("ghc-wai-cors" ,ghc-wai-cors)
       ("ghc-wai-extra" ,ghc-wai-extra)
       ("ghc-wai-middleware-static"
        ,ghc-wai-middleware-static)
       ("ghc-cookie" ,ghc-cookie)
       ("ghc-auto-update" ,ghc-auto-update)
       ("ghc-warp" ,ghc-warp)
       ("ghc-retry" ,ghc-retry)))
    (home-page "https://postgrest.org")
    (synopsis "REST API for any Postgres database")
    (description
     "Reads the schema of a PostgreSQL database and creates RESTful routes for the tables and views, supporting all HTTP verbs that security permits.")
    (license expat)))
