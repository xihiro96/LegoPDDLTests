(define (domain comp)
  (:requirements :strips :fluents)
  (:predicates 
	(leftSide ?x)
	(rightSide ?x))
  (:functions
	(side ?x))
  (:action moveLeft
	:parameters (?x)
	:precondition (and (> (side ?x) 8))
	:effect (and
		(leftSide ?x)))
  (:action moveRight
	:parameters (?x)	
	:precondition (and (<= (side ?x) 8))
	:effect (and
		(rightSide ?x))))
