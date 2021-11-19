; https://fareskalaboud.github.io/LearnPDDL/

(define 
    (problem letseat-simple) 
    (:domain letseat)
    (:objects 
        arm - robot
        cupcake1 - cupcake
        cupcake2 - cupcake
        table - location
        plate - location
    )

    (:init
        (on arm plate)
        (on cupcake1 table)
        (on cupcake2 table)
        (arm-empty)
        (path table plate)
        (= (cupcakes-on-location table) 2)
        (= (cupcakes-on-location plate) 0)
    )

    (:goal (and
        (=(cupcakes-on-location plate) 2)
    ))

)

