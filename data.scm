(define-module (data)
  #:use-module (guix)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system haskell)

  #:use-module (more-data)

  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages haskell-check))

(define-public ghc-only
  (package
    (name "ghc-only")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/Only/Only-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0rdj3a629fk2vp121jq8mf2smkblrz5w3cxhlsyx6my2x29s2ymb"))))
    (build-system haskell-build-system)
    (arguments
     `(#:cabal-revision
       ("1"
        "1ahk7p34kmh041mz7lyc10nhcxgv2i4z8nvzxvqm2x34gslmsbzr")))
    (home-page
     "http://hackage.haskell.org/package/Only")
    (synopsis
     "The 1-tuple type or single-value \"collection\"")
    (description
     "This package provides a canonical anonymous 1-tuple type missing from Haskell for attaching typeclass instances. . NOTE: There is also the </package/OneTuple OneTuple package> which by using a boxed @data@-type provides a 1-tuple type which has laziness properties which are more faithful to the ones of Haskell's native tuples; whereas the primary purpose of 'Only' is to provide the traditionally so named type-wrapper for attaching typeclass instances.")
    (license bsd-3)))

(define-public ghc-ranged-sets
  (package
    (name "ghc-ranged-sets")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/Ranged-sets/Ranged-sets-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1skd2a6yw7dd5vq8x81kwh28gi8sgyzg9qqqyadxmgpvy11sh9ab"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-hunit" ,ghc-hunit)
       ("ghc-quickcheck" ,ghc-quickcheck)))
    (home-page
     "https://github.com/PaulJohnson/Ranged-sets")
    (synopsis "Ranged sets for Haskell")
    (description
     "A ranged set is an ordered list of ranges.  This allows sets such as all reals x such that: . > (0.25 < x <= 0.75 or 1.4 <= x < 2.3 or 4.5 < x) . Alternatively you can have all strings s such that: . >    (\"F\" <= s < \"G\")")
    (license bsd-3)))

(define-public ghc-data-bword
  (package
    (name "ghc-data-bword")
    (version "0.1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/data-bword/data-bword-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0zfvk7b7qi6inra0kc03rhsic2rj0818n4i03lfwzvb5g22izw3h"))))
    (build-system haskell-build-system)
    (native-inputs
     `(("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page "https://github.com/mvv/data-bword")
    (synopsis
     "Extra operations on binary words of fixed length")
    (description
     "This package provides extra (vs. 'Data.Bits') operations on binary words of fixed length.")
    (license bsd-3)))

(define-public ghc-data-dword
  (package
    (name "ghc-data-dword")
    (version "0.3.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/data-dword/data-dword-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "084invjg8zj7ndxnz9clqmq06ch47k1d9lhxwap6xs0x4807crvb"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-hashable" ,ghc-hashable)
       ("ghc-data-bword" ,ghc-data-bword)))
    (native-inputs
     `(("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page "https://github.com/mvv/data-dword")
    (synopsis
     "Stick two binary words together to get a bigger one")
    (description
     "This package provides Template Haskell utilities for declaring fixed-length binary word data types. Signed and unsigned 96, 128, 160, 192, 224, and 256-bit types are predefined.")
    (license bsd-3)))

(define-public ghc-data-endian
  (package
    (name "ghc-data-endian")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/data-endian/data-endian-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1h1abz87nha7cpw50yvf8fwvcca350wnnz2d3z9k30sg6wq4y7cc"))))
    (build-system haskell-build-system)
    (home-page "https://github.com/mvv/data-endian")
    (synopsis "Endian-sensitive data")
    (description
     "This package provides helpers for converting endian-sensitive data.")
    (license bsd-3)))

(define-public ghc-data-serializer
  (package
    (name "ghc-data-serializer")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/data-serializer/data-serializer-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1ijy8l5lxmm8wpzx4h2vh9q21zz66xgh979s32aa4b16l9m1b4z7"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-semigroups" ,ghc-semigroups)
       ("ghc-cereal" ,ghc-cereal)
       ("ghc-data-endian" ,ghc-data-endian)
       ("ghc-parsers" ,ghc-parsers)
       ("ghc-split" ,ghc-split)))
    (native-inputs
     `(("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page
     "https://github.com/mvv/data-serializer")
    (synopsis
     "Common API for serialization libraries")
    (description
     "This package provides a common API for serialization libraries like <http://hackage.haskell.org/package/binary binary> and <http://hackage.haskell.org/package/cereal cereal>.")
    (license bsd-3)))

(define-public ghc-data-textual
  (package
    (name "ghc-data-textual")
    (version "0.3.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/data-textual/data-textual-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0c4qs923dj4jnvvkjvbij0c1yg922iw66140cq6wb1m4h6q31ia4"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-text-latin1" ,ghc-text-latin1)
       ("ghc-text-printer" ,ghc-text-printer)
       ("ghc-parsers" ,ghc-parsers)))
    (native-inputs
     `(("ghc-test-framework" ,ghc-test-framework)
       ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2)
       ("ghc-type-hint" ,ghc-type-hint)))
    (home-page "https://github.com/mvv/data-textual")
    (synopsis
     "Human-friendly textual representations.")
    (description
     "This package provides an interface for converting between data and its (human-friendly) textual representation.")
    (license bsd-3)))

(define-public ghc-directory
  (package
    (name "ghc-directory")
    (version "1.3.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/directory/directory-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0zkqihmdfz7bzv3sxh1p9ijl4vra880kfy3qy9h96flq7d2if0f2"))))
    (build-system haskell-build-system)
    (home-page
     "http://hackage.haskell.org/package/directory")
    (synopsis
     "Platform-agnostic library for filesystem operations")
    (description
     "This library provides a basic set of operations for manipulating files and directories in a portable way.")
    (license bsd-3)))

(define-public ghc-network-ip
  (package
    (name "ghc-network-ip")
    (version "0.3.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/network-ip/network-ip-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1zjy232pamkd3977cyaq5w5r6ksbpqpgzzlds15zrahjccirs9gf"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-data-default-class"
        ,ghc-data-default-class)
       ("ghc-data-endian" ,ghc-data-endian)
       ("ghc-data-dword" ,ghc-data-dword)
       ("ghc-type-hint" ,ghc-type-hint)
       ("ghc-hashable" ,ghc-hashable)
       ("ghc-data-serializer" ,ghc-data-serializer)
       ("ghc-text-printer" ,ghc-text-printer)
       ("ghc-data-textual" ,ghc-data-textual)
       ("ghc-parsers" ,ghc-parsers)))
    (native-inputs
     `(("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page "https://github.com/mvv/network-ip")
    (synopsis "Internet Protocol data structures")
    (description
     "This package provides Internet Protocol data structures")
    (license bsd-3)))

(define-public ghc-http-media
  (package
    (name "ghc-http-media")
    (version "0.7.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/http-media/http-media-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0kqjzvh5y8r6x5rw2kgd816w2963c6cbyw2qjvaj2mv59zxzqkrr"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-utf8-string" ,ghc-utf8-string)))
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-test-framework" ,ghc-test-framework)
       ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2)))
    (arguments
     `(#:cabal-revision
       ("1"
        "19py5pspx80gg679p9dzqr3iidflppxc1x4vkldamjkidyi406j8")))
    (home-page "https://github.com/zmthy/http-media")
    (synopsis
     "Processing HTTP Content-Type and Accept headers")
    (description
     "This library is intended to be a comprehensive solution to parsing and selecting quality-indexed values in HTTP headers.  It is capable of parsing both media types and language parameters from the Accept and Content header families, and can be extended to match against other accept headers as well.  Selecting the appropriate header value is achieved by comparing a list of server options against the quality-indexed values supplied by the client. . In the following example, the Accept header is parsed and then matched against a list of server options to serve the appropriate media using 'mapAcceptMedia': . > getHeader >>= maybe send406Error sendResourceWith . mapAcceptMedia >     [ (\"text/html\",        asHtml) >     , (\"application/json\", asJson) >     ] . Similarly, the Content-Type header can be used to produce a parser for request bodies based on the given content type with 'mapContentMedia': . > getContentType >>= maybe send415Error readRequestBodyWith . mapContentMedia >     [ (\"application/json\", parseJson) >     , (\"text/plain\",       parseText) >     ] . The API is agnostic to your choice of server.")
    (license expat)))
