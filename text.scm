(define-module (text)
  #:use-module (guix)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system haskell)

  #:use-module (data)

  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check))

(define-public ghc-wl-pprint-annotated
  (package
    (name "ghc-wl-pprint-annotated")
    (version "0.1.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/wl-pprint-annotated/wl-pprint-annotated-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1br7qyf27iza213inwhf9bm2k6in0zbmfw6w4clqlc9f9cj2nrkb"))))
    (build-system haskell-build-system)
    (native-inputs
      `(("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-hunit" ,ghc-tasty-hunit)))
    (home-page
      "https://github.com/minad/wl-pprint-annotated#readme")
    (synopsis
      "Pretty printer with annotation support")
    (description
      "Wadler/Leijen pretty printer with support for annotations and modernized API. Annotations are useful for coloring. See wl-pprint-console.")
    (license bsd-3)))

(define-public ghc-text-builder
  (package
    (name "ghc-text-builder")
    (version "0.5.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/text-builder/text-builder-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1xcyi3bw44anzah5c4c0wm18vnyqsr3q7ww2kp2psk41ql6gan2h"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-base-prelude" ,ghc-base-prelude)
       ("ghc-semigroups" ,ghc-semigroups)))
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-quickcheck-instances" ,ghc-quickcheck-instances)
       ("ghc-rerebase" ,ghc-rerebase)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page
     "https://github.com/nikita-volkov/text-builder")
    (synopsis "An efficient strict text builder")
    (description "")
    (license expat)))

(define-public ghc-text-latin1
  (package
    (name "ghc-text-latin1")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/text-latin1/text-latin1-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1wxbv6m567n3330baw2k0xxd50nhn2k6w3lgmpk6zq7x1jp84x3c"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-data-checked" ,ghc-data-checked)
       ("ghc-semigroups" ,ghc-semigroups)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-hashable" ,ghc-hashable)))
    (home-page "https://github.com/mvv/text-latin1")
    (synopsis
     "Latin-1 (including ASCII) utility functions")
    (description
     "This package provides various functions over the ASCII ang Latin-1 portions of the 'Char' and 'Word8' data types.")
    (license bsd-3)))

(define-public ghc-text-printer
  (package
    (name "ghc-text-printer")
    (version "0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/text-printer/text-printer-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "02sadjd19dbxzawr1q8z3j7w6vhp5mvz1dbssk118hsvl6k0234g"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-text-latin1" ,ghc-text-latin1)
       ("ghc-semigroups" ,ghc-semigroups)))
    (arguments `(#:tests? #f))
    (home-page "https://github.com/mvv/text-printer")
    (synopsis
     "Abstract interface for text builders/printers.")
    (description
     "This package provides an interface for injecting text into monoids such as builders and printers.")
    (license bsd-3)))

(define-public ghc-text-short
  (package
    (name "ghc-text-short")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/text-short/text-short-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0rqiwgjkgyfy8596swl0s0x2jqk6ddh2h02qxa32az2cs5kviwmk"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-hashable" ,ghc-hashable)))
    (arguments
     `(#:cabal-revision
       ("2"
        "106p7c0399zxdlh9f9qkgy7g2gp3bxqdpy6m6lnfhzi0pm5y8mks")))
    (native-inputs
     `(("ghc-quickcheck-instances" ,ghc-quickcheck-instances)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page
     "http://hackage.haskell.org/package/text-short")
    (synopsis
     "Memory-efficient representation of Unicode text strings")
    (description
     "This package provides the 'ShortText' type which is suitable for keeping many short strings in memory. This is similiar to how 'ShortByteString' relates to 'ByteString'. . The main difference between 'Text' and 'ShortText' is that 'ShortText' uses UTF-8 instead of UTF-16 internally and also doesn't support zero-copy slicing (thereby saving 2 words). Consequently, the memory footprint of a (boxed) 'ShortText' value is 4 words (2 words when unboxed) plus the length of the UTF-8 encoded payload.")
    (license bsd-3)))
