(define (domain lego3)
  (:requirements :strips)

  (:predicates
    (onboard ?x)
    (inbox ?x)
    (connected ?x)
    (inhand ?x)
    (touchleft ?x ?y)
    (touchright ?x ?y)
    (touchtop ?x ?y)
    (touchbot ?x ?y))
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
  (:action placeRight
    :parameters (?ob ?ob2)
    :precondition (and (inhand ?ob2) (connected ?ob))
    :effect (and (onboard ?ob2) (not (inhand ?ob2)) (touchright ?ob ?ob2)))
  (:action placeLeft
    :parameters (?ob ?ob2)
    :precondition (and (inhand ?ob2) (connected ?ob))
    :effect (and (onboard ?ob2) (not (inhand ?ob2)) (touchleft ?ob ?ob2)))
  (:action placeTop
        :parameters (?ob ?ob2)
        :precondition (and (inhand ?ob2) (connected ?ob))
        :effect (and (onboard ?ob2) (not (inhand ?ob2)) (touchtop ?ob ?ob2)))
  (:action placeBot
        :parameters (?ob ?ob2)
        :precondition (and (inhand ?ob2) (connected ?ob))
        :effect (and (onboard ?ob2) (not (inhand ?ob2)) (touchbot ?ob ?ob2)))
)


