(define-module (template)
  #:use-module (guix)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system haskell)

  #:use-module (gnu packages haskell))

(define-public ghc-heredoc
  (package
    (name "ghc-heredoc")
    (version "0.2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/heredoc/heredoc-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0h0g2f7yscwl1ba1yn3jnz2drvd6ns9m910hwlmq3kdq3k39y3f9"))))
    (build-system haskell-build-system)
    (home-page
     "http://hackage.haskell.org/package/heredoc")
    (synopsis
     "multi-line string / here document using QuasiQuotes")
    (description
     "multi-line string / here document using QuasiQuotes")
    (license public-domain)))

(define-public ghc-interpolatedstring-perl6
  (package
    (name "ghc-interpolatedstring-perl6")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/interpolatedstring-perl6/interpolatedstring-perl6-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0n3j6qvzp6as5ji93rn0sy873w5hdsplik51lkrah42cl95vmbay"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-haskell-src-meta" ,ghc-haskell-src-meta)))
    (home-page
     "http://hackage.haskell.org/package/interpolatedstring-perl6")
    (synopsis
     "QuasiQuoter for Perl6-style multi-line interpolated strings")
    (description
     "QuasiQuoter for Perl6-style multi-line interpolated strings with \\\"q\\\", \\\"qq\\\" and \\\"qc\\\" support.")
    (license public-domain)))

(define-public ghc-loch-th
  (package
    (name "ghc-loch-th")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/loch-th/loch-th-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1hvdkcyrlnv65q8x8h0441x30wr9bbfbg3961xd3fy9an5r961fc"))))
    (build-system haskell-build-system)
    (home-page "https://github.com/liskin/loch-th")
    (synopsis
     "Support for precise error locations in source files (Template Haskell version)")
    (description
     "This module provides a Template Haskell based mechanism to tag failures with the location of the failure call. The location message includes the file name, line and column numbers.")
    (license bsd-3)))
