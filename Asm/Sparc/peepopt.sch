; Larceny -- the generic assembler.
; Peephole optimization code.
;
; $Id: peepopt.sch,v 1.2 1997/07/18 13:43:13 lth Exp $
;
; The procedure peep is called with the as structure as an argument
; before every instruction is emitted. It may replace the prefix of the
; instruction stream by some other instruction sequence.
;
; The current structure is not quite right; if we have a stream ABD and
; the patterns are AB, ABC, and BD, and BD is preferred over AB, then AB
; will still be chosen because it comes first. Hard to see a good way
; around this.
;
; Invariant: if the peephole optimizer finds nothing to fix, then 
;
;  (let ((t1 (as-source as)))
;    (peep as)
;    (eq? t1 (as-source as)))
;
; that is, the source list is not changed, and indeed, if the optimizer
; does change something, then the above does not hold.
;
; Beware: not all primitives accept SW registers, and not all check their
; arguments... this is a source of subtle bugs. In general, if a source
; register is involved in a peeped optimization, it should satisfy the 
; 'hwreg?' predicate.
;
; This should be table-driven, or better, auto-generated from a spec.

; Characters are large and therefore not suitable.
;(define (peep-immediate? x)
;  (or (char? x)
;      (immediate-int? x)))

(define (peep-immediate? x) 
  (and (number? x) (immediate-int? x)))

(define peep 
  (let ((o1  `(car cdr ,name:CELL-REF))	; unary ops for reg-op-setreg
	(o2  '(+ - eq? cons))		; binary ditto
	(o2i '(+ -))			; ditto with immediate
	(b1  '(null? pair? zero?))	; unary ops for reg-test-branch
	(b2  '(< > >= <= = eq? char=? char>=? char>? char<=? char<?))
	(b2i '(< > >= <= = eq? char=? char>=? char>? char<=? char<?))
	(vn  '#(make-vector:0 make-vector:1 make-vector:2 make-vector:3
	        make-vector:4 make-vector:5 make-vector:6 make-vector:7
		make-vector:8 make-vector:9)))
    (lambda (as)
      (let* ((t0 (as-source as))
	     (i1 (if (null? t0) '(-1 0 0 0) (car t0)))
	     (t1 (if (null? t0) t0 (cdr t0)))
	     (i2 (if (null? t1) '(-1 0 0 0) (car t1)))
	     (t2 (if (null? t1) t1 (cdr t1)))
	     (i3 (if (null? t2) '(-1 0 0 0) (car t2)))
	     (t3 (if (null? t2) t2 (cdr t2)))
	     (i4 (if (null? t3) '(-1 0 0 0) (car t3))))
	(cond ((and (= (car i1) $reg) (hwreg? (cadr i1)))
	       (cond ((and (= (car i2) $op1) (memq (cadr i2) o1))
		      (cond ((and (= (car i3) $setreg) (hwreg? (cadr i3)))
			     ; (reg n)
			     ; (op1 op)
			     ; (setreg m)
			     (as-source! as (cons `(,$dresop1 ,(cadr i2)
							      ,(cadr i1)
							      ,(cadr i3))
						  t3)))
			    (else
			     ; (reg n)
			     ; (op1 op)
			     (as-source! as (cons `(,$dresop1 ,(cadr i2)
							      ,(cadr i1)
							      RESULT)
						  t2)))))
		     ((and (= (car i2) $op2) (memq (cadr i2) o2))
		      (cond ((and (= (car i3) $setreg) (hwreg? (cadr i3)))
			     ; (reg n)
			     ; (op2 op m)
			     ; (setreg l)
			     (as-source! as (cons `(,$dresop2 ,(cadr i2)
							      ,(cadr i1)
							      ,(caddr i2)
							      ,(cadr i3))
						  t3)))
			    (else
			     ; (reg n)
			     ; (op2 op m)
			     (as-source! as (cons `(,$dresop2 ,(cadr i2)
							      ,(cadr i1)
							      ,(caddr i2)
							      RESULT)
						  t2)))))
		     ((and (= (car i2) $op2imm)
			   (memq (cadr i2) o2i)
			   (peep-immediate? (caddr i2)))
		      (cond ((and (= (car i3) $setreg) (hwreg? (cadr i3)))
			     ; (reg n)
			     ; (op2imm op i)
			     ; (setreg m)
			     (as-source! as (cons `(,$dresop2imm ,(cadr i2)
								 ,(cadr i1)
								 ,(caddr i2)
								 ,(cadr i3))
						  t3)))
			    (else
			     ; (reg n)
			     ; (op2imm op i)
			     (as-source! as (cons `(,$dresop2imm ,(cadr i2)
								 ,(cadr i1)
								 ,(caddr i2)
								 RESULT)
						  t2)))))
		     ; (reg n)
		     ; (op1 op)
		     ; (branchf L)
		     ((and (= (car i2) $op1)
			   (memq (cadr i2) b1)
			   (= (car i3) $branchf))
		      (as-source! as (cons `(,$optbreg1 ,(cadr i2)
							,(cadr i1)
							,(cadr i3))
					   t3)))
		     ; (reg n)
		     ; (op2 op m)
		     ; (branchf L)
		     ((and (= (car i2) $op2)
			   (memq (cadr i2) b2)
			   (= (car i3) $branchf))
		      (as-source! as (cons `(,$optbreg2 ,(cadr i2)
							,(cadr i1)
							,(caddr i2)
							,(cadr i3))
					   t3)))
		     ; (reg n)
		     ; (op2imm op i)
		     ; (branchf L)
		     ((and (= (car i2) $op2imm)
			   (memq (cadr i2) b2i)
			   (= (car i3) $branchf)
			   (peep-immediate? (caddr i2)))
		      (as-source! as (cons `(,$optbreg2imm ,(cadr i2)
							   ,(cadr i1)
							   ,(caddr i2)
							   ,(cadr i3))
					   t3)))
		     ; (reg n)
		     ; (setreg m)
		     ((= (car i2) $setreg)
		      (if (= (cadr i1) (cadr i2))
			  (as-source! as t2)
			  (as-source! as (cons `(,$movereg ,(cadr i1)
							   ,(cadr i2))
					       t2))))
		     ; (reg n)
		     ; (branchf L)
		     ((= (car i2) $branchf)
		      (as-source! as (cons `(,$branchfreg ,(cadr i1) 
							  ,(cadr i2))
					   t2)))
		     (else
		      #f)))
	      ; (op1 op)
	      ; (branchf L)
	      ((and (= (car i1) $op1)
		    (memq (cadr i1) b1)
		    (= (car i2) $branchf))
	       (as-source! as (cons `(,$optbreg1 ,(cadr i1)
						 RESULT
						 ,(cadr i2))
				    t2)))
	      ; (op2 op n)
	      ; (branchf L)
	      ((and (= (car i1) $op2)
		    (memq (cadr i1) b2)
		    (hwreg? (caddr i1))
		    (= (car i2) $branchf))
	       (as-source! as (cons `(,$optbreg2 ,(cadr i1)
						 RESULT
						 ,(caddr i1)
						 ,(cadr i2))
				    t2)))
	      ; (op2imm op imm)
	      ; (branchf L)
	      ((and (= (car i1) $op2imm)
		    (memq (cadr i1) b2i)
		    (= (car i2) $branchf)
		    (peep-immediate? (caddr i1)))
	       (as-source! as (cons `(,$optbreg2imm ,(cadr i1)
						    RESULT
						    ,(caddr i1)
						    ,(cadr i2))
				    t2)))
	      ; (const c)
	      ; (setreg n)
	      ((and (= (car i1) $const)
		    (= (car i2) $setreg)
		    (hwreg? (cadr i2)))
	       (as-source! as (cons `(,$constreg ,(cadr i1) ,(cadr i2))
				    t2)))
	      ; (op1 op)
	      ; (setreg k)
	      ((and (= (car i1) $op1)
		    (memq (cadr i1) o1)
		    (= (car i2) $setreg)
		    (hwreg? (cadr i2)))
	       (as-source! as (cons `(,$dresop1 ,(cadr i1)
						RESULT
						,(cadr i2))
				    t2)))
	      ; (op2 op k1)
	      ; (setreg k2)
	      ((and (= (car i1) $op2)
		    (memq (cadr i1) o2)
		    (= (car i2) $setreg)
		    (hwreg? (cadr i2)))
	       (as-source! as (cons `(,$dresop2 ,(cadr i1)
						RESULT
						,(caddr i1)
						,(cadr i2))
				    t2)))
	      ; (op2imm op imm)
	      ; (setreg k)
	      ((and (= (car i1) $op2imm)
		    (memq (cadr i1) o2i)
		    (= (car i2) $setreg)
		    (hwreg? (cadr i2)))
	       (as-source! as (cons `(,$dresop2imm ,(cadr i1)
						   RESULT
						   ,(caddr i1)
						   ,(cadr i2))
				    t2)))
	      ;    (const n)            where n <= 10
	      ;    (op2 make-vector r)
	      ; => (op2 make-vector:n r)
	      ((and (= (car i1) $const)
		    (= (car i2) $op2)
		    (eq? (cadr i2) 'make-vector)
		    (fixnum? (cadr i1))
		    (<= 0 (cadr i1) 9))
	       (as-source! as (cons `(,$op2 ,(vector-ref vn (cadr i1))
					    ,(caddr i2))
				    t2)))
	      ; This allows the use of hardware 'call' instructions.
	      ;    (setrtn Lx)
	      ;    (branch Ly k)
	      ;    (.align k)
	      ;    (.label Lx)
	      ; => (branch-with-return Ly k)
	      ;    (.label Lx)
	      ((and (= (car i1) $setrtn)
		    (= (car i2) $branch)
		    (= (car i3) $.align) ;Ignored on SPARC
		    (= (car i4) $.label)
		    (= (cadr i1) (cadr i4)))
	       (as-source! as (cons `(,$branch-with-setrtn ,@(cdr i2))
				    t3)))
	      ; Ditto for 'invoke'.
	      ; Disabled because it does _not_ pay off on the
	      ; SPARC currently -- probably, the dependency created 
	      ; between 'jmpl' and 'st' is not handled well on the
	      ; test machine (an Ultrasparc).  Might work better if
	      ; the return address were to be kept in a register always.
	      ((and #f  ; DISABLED
		    (= (car i1) $setrtn)
		    (= (car i2) $invoke)
		    (= (car i3) $.align) ;Ignored on SPARC
		    (= (car i4) $.label)
		    (= (cadr i1) (cadr i4)))
	       (as-source! as (cons `(,$invoke-with-setrtn ,@(cdr i2))
				    t3)))

	      ; Gets rid of spurious branch-to-next-instruction
	      ;    (branch Lx k)
	      ;    (.align y)
	      ;    (.label Lx)
	      ; => (.align y)
	      ;    (.label Lx)
	      ((and (= (car i1) $branch)
		    (= (car i2) $.align)
		    (= (car i3) $.label)
		    (= (cadr i1) (cadr i3)))
	       (as-source! as t1))

	      (else
	       #f))))))

(define (peeptest istream)
  (let ((as (make-assembly-structure istream)))
    (let loop ((l '()))
      (if (null? (as-source as))
	  (reverse l)
	  (begin (peep as)
		 (let ((a (car (as-source as))))
		   (as-source! as (cdr (as-source as)))
		   (loop (cons a l))))))))


; eof
