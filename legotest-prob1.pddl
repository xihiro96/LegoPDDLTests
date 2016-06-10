(define (problem lego-prob)
  (:domain lego)
  (:objects block)
  (:init
	(inbox block))
  (:goal 
	(and (onboard block) (connected block)))
)
