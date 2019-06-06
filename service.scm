(define-module (service)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages databases)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu system accounts)
  #:use-module (gnu system shadow)
  #:use-module (ice-9 match)

  #:export (postgrest-configuration
            postgrest-configuration?
            postgrest-service-type))

;;;
;;; PostgREST
;;;

(define-record-type* <postgrest-configuration>
  postgrest-configuration make-postgrest-configuration
  postgrest-configuration?
  (postgrest   postgrest-configuration-postgrest ;<package>
               (default postgrest))
  (server-host postgrest-configuration-server-host
               (default "127.0.0.1"))
  (server-port postgrest-configuration-server-port
               (default 3000))
  ; postgres port, etc.
  (config-file postgrest-configuration-config-file
               (default #f)))

(define (default-postgrest.conf server-host server-port)
  (mixed-text-file "postgrest.conf"
                   "server-host = \"" server-host "\"\n"
                   "server-port = " (number->string server-port) "\n"))

(define %postgrest-accounts
  (list (user-group (name "postgrest") (system? #t))
        (user-account
         (name "postgrest")
         (group "postgrest")
         (system? #t)
         (comment "PostgREST server user")
         (home-directory "/var/empty")
         (shell (file-append shadow "/sbin/nologin")))))

(define postgrest-shepherd-service
  (match-lambda
    (($ <postgrest-configuration> postgrest server-port server-host config-file)
     (let ((config-file
            (or config-file
              (default-postgrest.conf server-port server-host))))
       (list (shepherd-service
              (provision '(postgrest))
              (documentation "Run the PostgREST daemon.")
              (requirement '(user-processes postgresql))
              (start #~(make-forkexec-constructor
                        '(#$(file-append postgrest "/bin/postgrest")
                          #$config-file)
                        #:user "postgrest"
                        #:group "postgrest"))
              (stop #~(make-kill-destructor))))))))

(define postgrest-service-type
  (service-type
    (name 'postgrest)
    (extensions
      (list (service-extension shepherd-root-service-type
                               postgrest-shepherd-service)
            (service-extension account-service-type
                               (const %postgrest-accounts))))
    (default-value (postgrest-configuration))))
