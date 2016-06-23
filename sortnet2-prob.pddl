(define (problem p2)
  (:domain sortnet2)
  (:init (:set array[0] :in :integer[1,2])
         (:set array[1] :in :integer[1,2]
                            :assert (:not (= array[0] array[1]))))
(:goal (< array[0] array[1])))
