(define-module (check)
  #:use-module (guix)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system haskell)

  #:use-module (control)
  #:use-module (text)

  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check))

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
