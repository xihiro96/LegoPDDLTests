(define (domain lego7)
  (:requirements :strips :typing :fluents)
  (:types lego board lside bside)
  (:predicates
        (onboard ?x - lego)
        (inbox ?x - lego)
        (attached ?x - lego)
        (inhand ?x - lego))
  (:functions
        (total-board-space ?c - board)
        (total-area ?x - lego)
        (exposed-space ?c - board)
        (e_w ?c - bside)
        (e_h ?c - bside)
        (l_w ?x - lside)
        (l_h ?x - lside))
  (:action pickup
        :parameters (?ob - lego)
        :precondition (and (inbox ?ob))
        :effect (and (inhand ?ob)
                     (not (inbox ?ob))))
                     
  (:action horzPlace
        :parameters (?ob - lego ?sdl - lside ?sdb - bside ?bd - board)
        :precondition (and (inhand ?ob))
        :effect
            (when (and (> (e_w ?sdb) (l_w ?sdl)) (> (e_h ?sdb) (l_h ?sdl)))
                (and (onboard ?ob)
                     (not (inhand ?ob))
                     (decrease (exposed-space ?bd) (total-area ?ob))
                     (decrease (e_w ?sdb) (l_w ?sdl))
                     (decrease (e_h ?sdb) (l_h ?sdl)))))                   
  (:action vertPlace
        :parameters (?ob - lego ?sdl - lside ?sdb - bside ?bd - board)
        :precondition (and (inhand ?ob))
        :effect
            (when (and (>= (e_h ?sdb) (l_w ?sdl)) (>= (e_w ?sdb) (l_h ?sdl)))
                (and (onboard ?ob)
                     (not (inhand ?ob))
                     (decrease (exposed-space ?bd) (total-area ?ob))
                     (decrease (e_h ?sdb) (l_w ?sdl))
                     (decrease (e_w ?sdb) (l_h ?sdl)))))

  (:action press
        :parameters (?ob - lego)
        :precondition (and (onboard ?ob))
        :effect (and (onboard ?ob)
                     (attached ?ob)))
)

