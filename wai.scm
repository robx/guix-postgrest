(define-module (wai)
  #:use-module (guix)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system haskell)

  #:use-module (containers)

  #:use-module (gnu packages)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-crypto)
  #:use-module (gnu packages haskell-web))

(define-public ghc-wai-cors
  (package
    (name "ghc-wai-cors")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/wai-cors/wai-cors-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "11m9d8hn9pb9brprz0kglldmcqj83kjkjdwdpxdbl12430ii1ina"))
       (patches (search-patches "ghc-wai-cors-skip-phantomjs-tests.patch"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-base-unicode-symbols"
        ,ghc-base-unicode-symbols)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-http-types" ,ghc-http-types)
       ("ghc-wai" ,ghc-wai)))
    (native-inputs
     `(("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)
       ("ghc-transformers-compat" ,ghc-transformers-compat)
       ("ghc-wai-extra" ,ghc-wai-extra)
       ("ghc-wai-websockets" ,ghc-wai-websockets)
       ("ghc-warp" ,ghc-warp)
       ("ghc-websockets" ,ghc-websockets)))
    (arguments
     `(#:configure-flags '("--flags=-wai-2" "--flags=-wai-1")))
    (home-page
     "https://github.com/larskuhtz/wai-cors")
    (synopsis "CORS for WAI")
    (description
     "This package provides an implemenation of Cross-Origin resource sharing (CORS) for <http://hackage.haskell.org/package/wai Wai> that aims to be compliant with <http://www.w3.org/TR/cors>.")
    (license expat)))

(define-public ghc-wai-middleware-static
  (package
    (name "ghc-wai-middleware-static")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/wai-middleware-static/wai-middleware-static-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1z5yapcf8j9w71f2na30snmalsajlyi8an2f9qrjdmajabyykr0b"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-cryptonite" ,ghc-cryptonite)
       ("ghc-memory" ,ghc-memory)
       ("ghc-expiring-cache-map"
        ,ghc-expiring-cache-map)
       ("ghc-http-types" ,ghc-http-types)
       ("ghc-mime-types" ,ghc-mime-types)
       ("ghc-old-locale" ,ghc-old-locale)
       ("ghc-semigroups" ,ghc-semigroups)
       ("ghc-wai" ,ghc-wai)))
    (arguments
     `(#:cabal-revision
       ("2"
        "17vq38dh7x1kqzfwla1s0rldd5hzm5mcrx49sjlzy8b66gd2n3ac")))
    (home-page
     "https://github.com/scotty-web/wai-middleware-static")
    (synopsis
     "WAI middleware that serves requests to static files.")
    (description
     "WAI middleware that intercepts requests to static files and serves them if they exist. . [WAI] <http://hackage.haskell.org/package/wai>")
    (license bsd-3)))

(define-public ghc-websockets
  (package
    (name "ghc-websockets")
    (version "0.12.5.3")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/websockets/websockets-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0mkxl7iwl5pl2w0svji9248v4c0hi45k725jj5ybaknb73650ns4"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-attoparsec" ,ghc-attoparsec)
        ("ghc-base64-bytestring" ,ghc-base64-bytestring)
        ("ghc-bytestring-builder"
         ,ghc-bytestring-builder)
        ("ghc-case-insensitive" ,ghc-case-insensitive)
        ("ghc-network" ,ghc-network)
        ("ghc-random" ,ghc-random)
        ("ghc-sha" ,ghc-sha)
        ("ghc-streaming-commons" ,ghc-streaming-commons)
        ("ghc-entropy" ,ghc-entropy)))
    (native-inputs
      `(("ghc-hunit" ,ghc-hunit)
        ("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-test-framework" ,ghc-test-framework)
        ("ghc-test-framework-hunit"
         ,ghc-test-framework-hunit)
        ("ghc-test-framework-quickcheck2"
         ,ghc-test-framework-quickcheck2)))
    (home-page "http://jaspervdj.be/websockets")
    (synopsis
      "A sensible and clean way to write WebSocket-capable servers in Haskell.")
    (description
      "This library allows you to write WebSocket-capable servers. . An example server: <https://github.com/jaspervdj/websockets/blob/master/example/server.lhs> . An example client: <https://github.com/jaspervdj/websockets/blob/master/example/client.hs> . See also: . * The specification of the WebSocket protocol: <http://www.whatwg.org/specs/web-socket-protocol/> . * The JavaScript API for dealing with WebSockets: <http://www.w3.org/TR/websockets/>")
    (license bsd-3)))

(define-public ghc-wai-websockets
  (package
    (name "ghc-wai-websockets")
    (version "3.0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/wai-websockets/wai-websockets-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0b2xmdsrsqpssyib53wbr6r8hf75789ndyyanv37sv99iyqcwz4i"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-wai" ,ghc-wai)
        ("ghc-case-insensitive" ,ghc-case-insensitive)
        ("ghc-network" ,ghc-network)
        ("ghc-websockets" ,ghc-websockets)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-warp" ,ghc-warp)
        ("ghc-wai-app-static" ,ghc-wai-app-static)
        ("ghc-file-embed" ,ghc-file-embed)))
    (home-page "http://github.com/yesodweb/wai")
    (synopsis
      "Provide a bridge between WAI and the websockets package.")
    (description
      "API docs and the README are available at <http://www.stackage.org/package/wai-websockets>.")
    (license expat)))

(define-public ghc-wai-app-static
  (package
    (name "ghc-wai-app-static")
    (version "3.1.6.3")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/wai-app-static/wai-app-static-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0s6bpz5gmjy797bnnw1y5mwy9761h46bjp1srnrh7cxlnvm93c4c"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-wai" ,ghc-wai)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-unix-compat" ,ghc-unix-compat)
        ("ghc-old-locale" ,ghc-old-locale)
        ("ghc-file-embed" ,ghc-file-embed)
        ("ghc-cryptonite" ,ghc-cryptonite)
        ("ghc-memory" ,ghc-memory)
        ("ghc-http-date" ,ghc-http-date)
        ("ghc-blaze-html" ,ghc-blaze-html)
        ("ghc-blaze-markup" ,ghc-blaze-markup)
        ("ghc-mime-types" ,ghc-mime-types)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-zlib" ,ghc-zlib)
        ("ghc-wai-extra" ,ghc-wai-extra)
        ("ghc-optparse-applicative"
         ,ghc-optparse-applicative)
        ("ghc-warp" ,ghc-warp)))
    (native-inputs
      `(("ghc-hspec" ,ghc-hspec)
        ("ghc-network" ,ghc-network)
        ("ghc-temporary" ,ghc-temporary)
        ("ghc-mockery" ,ghc-mockery)))
    (arguments
      `(#:cabal-revision
        ("2"
         "17wd7cxqwimhww53qihchrr62hnzirggk86migi9bcwv4wjykmqc")))
    (home-page
      "http://www.yesodweb.com/book/web-application-interface")
    (synopsis "WAI application for static serving")
    (description
      "API docs and the README are available at <http://www.stackage.org/package/wai-app-static>.")
    (license expat)))
