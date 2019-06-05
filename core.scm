(define-module (core)
  #:use-module (guix)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system haskell)

  #:use-module (control)

  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check))

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
