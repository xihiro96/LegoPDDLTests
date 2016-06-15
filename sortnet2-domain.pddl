(define (domain sortnet2)
  (:model (:dynamics :non-deterministic) (:feedback :null))
  (:objects array - :array[2] :integer[1,2])

  (:action cmpswap
    :parameters ?i ?j - :integer[0,1]
    :precondition (< ?i ?j)
    :effect (:when (< array[?j] array[?i])
                   (:set array[?i] array[?j])
                   (:set array[?j] array[?i]))))

