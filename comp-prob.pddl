(define (problem comp-prob)
  (:domain comp)
  (:objects block)
  (:init
	(= (size block) 5))
  (:goal (and
	 (rightSide block)))
  (:metric minimize (size)))
