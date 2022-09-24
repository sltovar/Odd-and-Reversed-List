#lang racket
;-------------------------------------------------------------
; ODD & REVERSED LISTS
;-------------------------------------------------------------

;-------------------------------------------------------------
; LIST THAT RETURNS AN ODD & REVERSED LIST USING APPEND
;-------------------------------------------------------------
(define (oddRevList revList)
  (if (null? revList)
      ; Return revList when the list is empty. 
      revList
      ;-------------------------------------------------------------
      ; Modulo function that tests if even/odd through division.
      ; Cycles through revList and returns the first element, which
      ; then it tests through Modulo.
      ;-------------------------------------------------------------
      (if (= (modulo (car revList) 2) 0)
          ;----------------------------------------------
          ; Ignore all even values. Recurse with the
          ; cdr of the list, so that it is 'passed over'.
          ;----------------------------------------------
          (oddRevList (cdr revList))
          ;----------------------------------------------------------
          ; For all odd values, recurses with CDR (second element)
          ; and the CAR (first element). It creates the new function
          ; oddRevList, and that runs until the end of the list is
          ; reached. Until null is true (above), the function ends
          ; and cascades backwards. Append puts it all together.
          ; Append adds to the FRONT of the list.
          ;----------------------------------------------------------
          (append (oddRevList (cdr revList)) (list (car revList))))))
;---------------------------------------------
; List function call that should return 
; '(9 7 5 3 1)
(oddRevList (list 1 2 3 4 5 6 7 8 9))

; Second list function call that should return
; '(1 3 1 7 3 5 3)
(oddRevList (list 3 5 2 3 7 1 2 3 1 8))
