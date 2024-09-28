#lang racket

(printf "Racket Runtime Environment\n")
(printf "Racket version: ~a\n" (version))
(printf "Current working directory: ~a\n" (current-directory))
(printf "Operating System: ~a\n" (system-type 'os))
(printf "Machine Architecture: ~a\n" (system-type 'machine))

; Measure execution time
(define start-time (current-inexact-milliseconds))

; Add your application logic here
; For example:
; (require "app.rkt")
; (start-app)

(define end-time (current-inexact-milliseconds))
(printf "Execution time: ~a seconds\n" (/ (- end-time start-time) 1000))

; To run: racket runtime.rkt
