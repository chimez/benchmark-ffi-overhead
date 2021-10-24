;; (compile-file "hello_sbcl.lisp")
(load-shared-object "libplus.so")
(load "hello_sbcl.fasl")


(defun main ()
  (let* ((argv *posix-argv*)
         (count (parse-integer (car (cdr argv)))))
    (when (or (< count 0) (> count 2000000000))
      (format t "Must be a positive number not exceeding 2 billion.~%")
      (quit))

    (hello-c-call::run count))) 

(main)
