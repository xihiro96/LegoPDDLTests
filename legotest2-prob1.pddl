(define (problem lego2-prob)
  (:domain lego2)
  (:objects white red)
  (:init
	(inbox white)
	(inbox red))
  (:goal
	(and (connected white)
	(touching white red)
	(not (inbox white))
	(not (inbox red))
	(connected red)
	(not (inbox red))))
)
