(asdf:defsystem #:sheet-clj
  :description "A Common Lisp Jupyter interface to ipysheet."
  :author "Tarn W. Burton"
  :license "MIT"
  :depends-on
    (:common-lisp-jupyter)
  :components
    ((:module lisp
      :serial t
      :components
        ((:file "packages")
         (:file "version")
         (:file "sheet"))))
  . #+asdf3
      (:version "0.1"
       :homepage "https://github.com/yitzchak/sheet-clj/"
       :bug-tracker "https://github.com/yitzchak/sheet-clj/issues")
    #-asdf3 ())


#+asdf3.1
  (asdf:register-system-packages "sheet-clj"
                                 '(:sheet))


