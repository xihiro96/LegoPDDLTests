(define (problem lego3-prob1)
  (:domain lego3)
  (:objects white red)
  (:init
	(inbox white)
	(inbox red))
  (:goal 
	(and (touchLeft white red) (connected white) (connected red)))
)
