(define (problem legoConditionalTestnditionalTest-prob)
  (:domain legoConditionalTest)
  (:objects red2x4 black2x2 white2x2 - lego brd - board i1 - int1 i2 - int2)
  (:init (= (total-board-space brd) 16)
         (= (total-area red2x4) 8)
         (= (total-area black2x2) 4)
         (= (total-area white2x2) 4)
         (= (taken-space brd) 0)
         (= (exposed-space brd) 16)
         (inbox red2x4)
         (inbox white2x2)
         (inbox black2x2)
         (= (e_w i1) 2)
         (= (e_h i1) 4)
         (= (l_w i2) 4)
         (= (l_h i2) 2))
  (:goal (and
                (attached red2x4)
                (attached white2x2)
                (attached black2x2)
                (= (exposed-space brd) 0)
                (= (taken-space brd) 16)))
)

