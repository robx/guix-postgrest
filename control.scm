(define-module (control)
  #:use-module (guix)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system haskell)

  #:use-module (check)

  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check))

(define-public ghc-concurrent-output
  (package
    (name "ghc-concurrent-output")
    (version "1.10.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/concurrent-output/concurrent-output-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0mwf155w89nbbkjln7hhbn8k3f8p0ylcvgrg31cm7ijpx4499i4c"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-async" ,ghc-async)
       ("ghc-exceptions" ,ghc-exceptions)
       ("ghc-ansi-terminal" ,ghc-ansi-terminal)
       ("ghc-terminal-size" ,ghc-terminal-size)))
    (home-page
     "http://hackage.haskell.org/package/concurrent-output")
    (synopsis
     "Ungarble output from several threads or commands")
    (description
     "Lets multiple threads and external processes concurrently output to the console, without it getting all garbled up. . Built on top of that is a way of defining multiple output regions, which are automatically laid out on the screen and can be individually updated by concurrent threads. Can be used for progress displays etc. . <<https://joeyh.name/code/concurrent-output/demo2.gif>>")
    (license bsd-2)))

(define-public ghc-retry
  (package
    (name "ghc-retry")
    (version "0.7.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/retry/retry-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0v6irf01xykhv0mwr1k5i08jn77irqbz8h116j8p435d11xc5jrw"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-data-default-class"
        ,ghc-data-default-class)
       ("ghc-exceptions" ,ghc-exceptions)
       ("ghc-random" ,ghc-random)))
    (native-inputs
     `(("ghc-hunit" ,ghc-hunit)
       ("ghc-hedgehog" ,ghc-hedgehog)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hedgehog" ,ghc-tasty-hedgehog)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)))
    (home-page "http://github.com/Soostone/retry")
    (synopsis
     "Retry combinators for monadic actions that may fail")
    (description
     "This package exposes combinators that can wrap arbitrary monadic actions. They run the action and potentially retry running it with some configurable delay for a configurable number of times. The purpose is to make it easier to work with IO and especially network IO actions that often experience temporary failure and warrant retrying of the original action. For example, a database query may time out for a while, in which case we should hang back for a bit and retry the query instead of simply raising an exception.")
    (license bsd-3)))

(define-public ghc-monad-time
  (package
    (name "ghc-monad-time")
    (version "0.3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/monad-time/monad-time-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0z30c0k5bqlz86vwajnm6kj26i09zx6dzqwd00z6ba8hqyzm1x0a"))))
    (build-system haskell-build-system)
    (home-page
     "https://github.com/scrive/monad-time")
    (synopsis
     "Type class for monads which carry the notion of the current time.")
    (description
     "'MonadTime' type class for monads which carry the notion of the current time.")
    (license bsd-3)))

(define-public ghc-mtl-compat
  (package
    (name "ghc-mtl-compat")
    (version "0.2.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/mtl-compat/mtl-compat-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "15388p9ybdn6digk6cpdsw6havd0yva8vvwl3p7fnc9sb59wln34"))))
    (build-system haskell-build-system)
    (arguments
     `(#:haddock?
       #f
       #:cabal-revision
       ("4"
        "1mfrx8cpx0502sjv0bmlfkl0h46c4krldg8m89k4fj6iawwg2ab5")))
    (home-page
     "https://github.com/haskell-compat/mtl-compat")
    (synopsis
     "Backported Control.Monad.Except module from mtl")
    (description
     "This package backports the \"Control.Monad.Except\" module from @mtl@ (if using @mtl-2.2.0.1@ or earlier), which reexports the @ExceptT@ monad transformer and the @MonadError@ class. . This package should only be used if there is a need to use the @Control.Monad.Except@ module specifically. If you just want the @mtl@ class instances for @ExceptT@, use @transformers-compat@ instead, since @mtl-compat@ does nothing but reexport the instances from that package. . Note that unlike how @mtl-2.2@ or later works, the \"Control.Monad.Except\" module defined in this package exports all of @ExceptT@'s monad class instances. Therefore, you may have to declare @import Control.Monad.Except ()@ at the top of your file to get all of the @ExceptT@ instances in scope.")
    (license bsd-3)))

(define-public ghc-bug
  (package
    (name "ghc-bug")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/bug/bug-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1xfynvp5fyn46gg3p5qq9cmb1dnw2dyf3bz6w5wdvikfvs19dwhq"))))
    (build-system haskell-build-system)
    (home-page
     "https://github.com/nikita-volkov/bug")
    (synopsis
     "Better alternatives to the \"error\" function")
    (description "")
    (license expat)))
