(define (problem lego4-prob1)
  (:domain lego4)
  (:objects white red side1 side2)
  (:init 
	(inbox white)
	(inbox red))
  (:goal 
	(and (touchSides white side1 red side2) (attached white) (attached red)))
)
