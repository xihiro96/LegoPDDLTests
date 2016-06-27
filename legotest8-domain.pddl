(define (domain legoConditionalTest)
(:requirements :strips :typing :fluents)
(:types lego board int1 int2)
(:predicates
    (onboard ?x - lego)
    (inbox ?x - lego)
    (attached ?x - lego)
    (inhand ?x - lego)
    (vert ?x - lego)
    (horz ?x - lego))

(:functions
    (total-board-space ?c - board)
    (total-area ?x - lego)
    (taken-space ?c - board)
    (exposed-space ?c - board)
    (e_w ?i1 - int1)
    (e_h ?i1 - int1)
    (l_w ?i2 - int2)
    (l_h ?i2 - int2))

(:action switchVert
    :parameters (?i1 - int1 ?i2 - int2 ?ob - lego)
    :precondition (and (< (e_w ?i1) (l_w ?i2)) (> (e_h ?i1) (l_h ?i2)))
    :effect (and (vert ?ob)))
    
(:action switcHorz
    :parameters (?i1 - int1 ?i2 - int2 ?ob - lego)
    :precondition (and (>= (e_w ?i1) (l_w ?i2)) (<= (e_h ?i1) (l_h ?i2)))
    :effect (and (horz ?ob)))

(:action pickup
  :parameters (?ob - lego)
  :precondition (and (inbox ?ob))
  :effect (and (inhand ?ob)
          (not (inbox ?ob))))

(:action placeVert
  :parameters (?ob - lego ?bd - board)
  :precondition (and (inhand ?ob))
  :effect (when (vert ?ob)
               (and (onboard ?ob)
               (not (inhand ?ob))
               (decrease (exposed-space ?bd) (total-area ?ob))
               (increase (taken-space ?bd) (total-area ?ob)))))

(:action placeHorz
  :parameters (?ob - lego ?bd - board)
  :precondition (and (inhand ?ob))
  :effect (when (horz ?ob)
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

