(define (domain jug-pouring)
(:requirements :typing :fluents :conditional-effects)
(:types jug)
(:functions
  (amount ?j - jug) - number
  (capacity ?j - jug) - number)
(:action pour
  :parameters (?jug1 ?jug2 - jug)
  :precondition (> (- (capacity ?jug2) (amount ?jug2)) 0)
  :effect (and
                (when (>= (- (capacity ?jug2) (amount ?jug2)) (amount ?jug1))
                  (and
		     (increase (amount ?jug2) (amount ?jug1))
                     (assign (amount ?jug1) 0)
                  ))
      	     	(when (< (- (capacity ?jug2) (amount ?jug2)) (amount ?jug1))
                  (and
                     (decrease (amount ?jug1) (- (capacity ?jug2) (amount ?jug2)))
		     (assign (amount ?jug2) (capacity ?jug2))
		  ))
           ))
)
