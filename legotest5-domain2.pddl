(define (domain lego5b)
(:requirements :strips :typing :fluents)
(:types lego board)
(:predicates
    (onboard ?x - lego)
    (inbox ?x - lego)
    (attached ?x - lego)
    (inhand ?x - lego))

(:functions
    (total-board-space ?c - board)
    (total-area ?x - lego)
    (taken-space ?c - board)
    (exposed-space ?c - board))

(:action pickup
  :parameters (?ob - lego)
  :precondition (and (inbox ?ob))
  :effect (and (inhand ?ob) 
	  (not (inbox ?ob))))

(:action place
  :parameters (?ob - lego ?bd - board)
  :precondition (and (inhand ?ob))  
  :effect (and (onboard ?ob) 
	       (not (inhand ?ob))
	       (decrease (exposed-space ?bd) (total-area ?ob))
	       (increase (taken-space ?bd) (total-area ?ob))))

(:action press
  :parameters (?ob - lego)
  :precondition (and (onboard ?ob))
  :effect (and (onboard ?ob)
	  (attached ?ob)))

)
