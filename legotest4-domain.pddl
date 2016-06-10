(define (domain lego4)
  (:requirements :strips)
  (:predicates
    (onboard ?x)
    (inbox ?x)
    (attached ?x)
    (inhand ?x)
    (touchSides ?x ?a ?y ?b))
  (:action pickup
    :parameters (?ob)
    :precondition (and (inbox ?ob))
    :effect (and (inhand ?ob) (not (inbox ?ob))))
  (:action placeRandom
    :parameters (?ob)
    :precondition (and (inhand ?ob))
    :effect (and (onboard ?ob) (not (inhand ?ob))))
  (:action press
    :parameters (?ob)
    :precondition (and (onboard ?ob))
    :effect (and (onboard ?ob) (connected ?ob)))
  (:action specificPlace
    :parameters (?ob ?ob2 ?side1 ?side2)
    :precondition (and (inhand ?ob2) (connected ?ob))
    :effect (and (onboard ?ob2) (not (inhand ?ob2)) (touchSides ?ob ?side1 ?ob2 ?side2)))
)
