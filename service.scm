(define-module (service)

  #:use-module (postgrest)

  #:use-module (guix gexp)
  #:use-module (guix modules)
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
  (postgrest     postgrest-configuration-postgrest ;<package>
                 (default postgrest))
  (db-uri        postgrest-configuration-db-uri
                 (default "postgres://postgrest@localhost:5432/postgrestdb"))
  (db-schema     postgrest-configuration-db-schema
                 (default "public"))
  (db-anon-role  postgrest-configuration-db-anon-role
                 (default "postgrest-anon"))
  (server-host   postgrest-configuration-server-host
                 (default "127.0.0.1"))
  (server-port   postgrest-configuration-server-port
                 (default 3000))
  (config-file   postgrest-configuration-config-file
                 (default #f)))

(define (default-postgrest.conf db-uri db-schema db-anon-role server-host server-port)
  (mixed-text-file "postgrest.conf"
                   "db-uri = \"" db-uri "\"\n"
                   "db-schema = \"" db-schema "\"\n"
                   "db-anon-role = \"" db-anon-role "\"\n"
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

(define* (logger-wrapper name exec . args)
  "Return a derivation that builds a script to start a process with
standard output and error redirected to syslog via logger."
  (define exp
    #~(begin
        (use-modules (ice-9 popen))
        (let* ((pid    (number->string (getpid)))
               (logger #$(file-append inetutils "/bin/logger"))
               (args   (list logger "-t" #$name (string-append "--id=" pid))
               (pipe   (open-pipe* OPEN_WRITE logger . args)))
          (dup log 1)
          (dup log 2)
          (execl #$exec #$exec #$@args))))
  (program-file (string-append name "-logger") exp))

(define postgrest-shepherd-service
  (match-lambda
    (($ <postgrest-configuration> postgrest db-uri db-schema db-anon-role
                                  server-port server-host config-file)
     (let* ((config-file
             (or config-file
                 (default-postgrest.conf db-uri db-schema db-anon-role
                   server-port server-host)))
            (postgrest-logger
             (logger-wrapper "postgrest"
                             (file-append postgrest "/bin/postgrest")
                             config-file)))

       (list (shepherd-service
              (provision '(postgrest))
              (documentation "Run the PostgREST daemon.")
              (requirement '(user-processes postgres))
              (start #~(make-forkexec-constructor
                        '(#$postgrest-logger)
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
