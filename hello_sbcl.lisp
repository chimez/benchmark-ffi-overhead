(cl:defpackage "HELLO-C-CALL" (:use "CL" "SB-ALIEN" "SB-C-CALL"))
(cl:in-package "HELLO-C-CALL")

(declaim (inline plus))
(define-alien-routine plus
    int
  (x int)
  (y int))

(declaim (inline plusone))
(define-alien-routine plusone
    int
  (x int))

(declaim (inline current_timestamp))
(define-alien-routine current_timestamp
    long)

(defun run (count)
  (with-alien ((start long (current_timestamp)))
    (let ((x 0))
      (dotimes (i count)
        (setf x (with-alien ((xx int (plusone x))) xx)))
      (with-alien ((end long (current_timestamp)))
        (format t "result=~d, time=~d~%" x (- end start))))))
