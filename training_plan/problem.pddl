; https://fareskalaboud.github.io/LearnPDDL/

(define 
    (problem train_plan-simple) 
    (:domain train_plan)
    (:objects 
        run - workout
        swim - workout
        rest - workout
    )

    (:init
        (= (exertion run) 60)
        (= (exertion swim) 30)
        (= (exertion rest) 0)
        (= (exertion_total) 0)
        (non_sequential run run)
        (non_sequential swim swim)
    )

    (:goal (and
        (> (exertion_total) 150)
    ))

    (:metric minimize (exertion_total))
)

