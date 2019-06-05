(define-module (more-data)
  #:use-module (guix)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system haskell)

  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-web))

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
