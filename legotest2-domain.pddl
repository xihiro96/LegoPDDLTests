(define (domain lego2)
  (:requirements :strips)

  (:predicates (onboard ?x)
           (inbox ?x)
           (connected ?x)
           (inhand ?x)
           (touching ?x ?y))
  (:action pickup
    :parameters (?ob)
    :precondition (and (inbox ?ob))
    :effect (and (inhand ?ob) (not (inbox ?ob))))
  (:action placeRandom
    :parameters (?ob)
    :precondition (and (inhand ?ob))
    :effect (and (onboard ?ob) (not (inhand ?ob))))
  (:action push
    :parameters (?ob)
    :precondition (and (onboard ?ob))
    :effect (and (onboard ?ob) (connected ?ob)))
  (:action placeTouch
    :parameters (?ob ?ob2)
    :precondition (and (inhand ?ob2) (onbard ?ob))
    :effect (and  (onboard ?ob2) (not (inhand ?ob2)) (touching ?ob ?ob2)))
)
