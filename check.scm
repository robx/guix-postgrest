(define-module (check)
  #:use-module (guix)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system haskell)

  #:use-module (control)
  #:use-module (text)

  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check))

(define-public ghc-tasty-hedgehog
  (package
    (name "ghc-tasty-hedgehog")
    (version "0.2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/tasty-hedgehog/tasty-hedgehog-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "10m1akbiblnjq9ljk469725k30b254d36d267rk51z2f171py42s"))))
    (build-system haskell-build-system)
    (arguments
     `(#:cabal-revision
       ("6"
        "0d7s1474pvnyad6ilr5rvpama7s468ya9ns4ksbl0827z9vvga43")))
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
