(define (domain lego5)
(:requirements :strips :typing :fluents)
(:types lego board)
(:predicates
    (onboard ?x - lego)
    (inbox ?x - lego)
    (attached ?x - lego)
    (inhand ?x - lego)
    (side1_exp ?x)
    (side2_exp ?x)
    (side3_exp ?x)
    (side4_exp ?x))

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

(:action firstPlace
  :parameters (?ob - lego ?bd - board)
  :precondition (and (inhand ?ob) (= (total-board-space ?bd) (exposed-space ?bd)))  
  :effect (and (onboard ?ob) 
	       (not (inhand ?ob))
	       (decrease (exposed-space ?bd) (total-area ?ob))
	       (increase (taken-space ?bd) (total-area ?ob))))

(:action press
  :parameters (?ob - lego)
  :precondition (and (inhand ?ob))
  :effect (and (onboard ?ob)
	  (attached ?ob)))

(:action nextPlace
  :parameters (?ob - lego ?bd - board)
  :precondition (and (inhand ?ob) (< (exposed-space ?bd) (total-board-space ?bd))) ;;;can only be used if there is less exposed space than total board space
  :effect (and (onboard ?ob)
	       (not (inhand ?ob))
	       (decrease (exposed-space ?bd) (total-area ?ob))
	       (increase (taken-space ?bd) (total-area ?ob))))
)
