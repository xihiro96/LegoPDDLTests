(define (domain legoConditionalTest)
(:requirements :strips :typing :fluents)
(:types lego board int)
(:predicates
    (onboard ?x - lego)
    (inbox ?x - lego)
    (attached ?x - lego)
    (inhand ?x - lego)
    (canPlace ?x - lego)
    (lessThan ?i - int)
    (greaterThan ?i - int))

(:functions
    (total-board-space ?c - board)
    (total-area ?x - lego)
    (taken-space ?c - board)
    (exposed-space ?c - board)
    (const1 ?i - int)
    (const2 ?i - int))

(:action switch
    :parameters (?i - int ?ob - lego)
    :precondition (and (< (const1 ?i) (const2 ?i)))
    :effect (and (canPlace ?ob)))

(:action pickup
  :parameters (?ob - lego)
  :precondition (and (inbox ?ob))
  :effect (and (inhand ?ob)
          (not (inbox ?ob))))

(:action place
  :parameters (?ob - lego ?bd - board)
  :precondition (and (inhand ?ob))
  :effect (when (canPlace ?ob) 
               (and (onboard ?ob)
               (not (inhand ?ob))
               (decrease (exposed-space ?bd) (total-area ?ob))
               (increase (taken-space ?bd) (total-area ?ob)))))

(:action press
  :parameters (?ob - lego)
  :precondition (and (onboard ?ob))
  :effect (and (onboard ?ob)
          (attached ?ob)))

)

