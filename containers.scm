(define-module (containers)
  #:use-module (guix)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system haskell)

  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-web))

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
