#lang racket

(require rackunit)

(define (run-tests)
  (printf "Running Racket tests...\n")
  
  (define passed 0)
  (define failed 0)
  
  (define (custom-test-case name test-thunk)
    (with-handlers ([exn:fail? (lambda (exn)
                                 (printf "Test '~a' failed: ~a\n" name (exn-message exn))
                                 (set! failed (add1 failed)))])
      (test-thunk)
      (printf "Test '~a' passed\n" name)
      (set! passed (add1 passed))))

  (custom-test-case "addition"
    (lambda () (check-equal? (+ 2 2) 4)))

  (custom-test-case "string concatenation"
    (lambda () (check-equal? (string-append "Hello, " "World!") "Hello, World!")))

  (custom-test-case "list operations"
    (lambda ()
      (define lst '(1 2 3))
      (check-equal? (length lst) 3)
      (check-true (member 2 lst))))

  (printf "Tests run: ~a\n" (+ passed failed))
  (printf "Tests passed: ~a\n" passed)
  (printf "Tests failed: ~a\n" failed))

(run-tests)

; To run: racket testscript.rkt
