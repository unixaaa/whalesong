#lang planet dyoo/whalesong
(require (planet dyoo/whalesong/js))

(define js-plus
  (js-function->procedure "function(x, y) { return x + y; }"))

(define js-minus
  (js-function->procedure "function(x, y) { return x - y; }"))

(define raw-sleep
  (js-async-function->procedure
   "function(success, fail, n) { setTimeout(success, n); }"))
(define (sleep n)
  (unless (real? n)
    (raise-type-error 'sleep "real" n))
  (void (raw-sleep (inexact->exact (floor (* n 1000))))))


"plus: " (js-plus 3 4)
"wait for one second: " (sleep 1)
"minus:" (js-minus 239748 23)


(for-each (lambda (x)
            (display x)
            (sleep 1))
          '(hello world testing))


;; I need exception handling...
;;
;(define i-should-fail
;  (js-async-function->procedure  "function(success, fail) { fail('I should fail'); }"))
;(i-should-fail)