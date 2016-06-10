(define (domain lego)
  (:requirements :strips)

  (:predicates (onboard ?x)
           (inbox ?x)
           (connected ?x)
           (inhand ?x))
  (:action pickup
    :parameters (?ob)
    :precondition (and (inbox ?ob))
    :effect (and (inhand ?ob) (not (inbox ?ob))))
  (:action place
    :parameters (?ob)
    :precondition (and (inhand ?ob))
    :effect (and (onboard ?ob) (connected ?ob) (not (inhand ?ob)))
  )
)

