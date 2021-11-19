; https://fareskalaboud.github.io/LearnPDDL/

(define 
    (problem train_plan-simple) 
    (:domain train_plan)
    (:objects 
        run - workout
        swim - workout
        rest - workout
        strength_workout - workout
    )

    (:init
        (= (exertion run) 45)
        (= (exertion swim) 30)
        (= (exertion strength_workout) 20)
        (= (exertion rest) 0)
        (= (exertion_total) 0)
        (non_sequential run run)
        (non_sequential swim swim)
        (non_sequential rest rest)
    )

    (:goal (and
        (>= (exertion_total) 600)
    ))

    ; (:metric minimize (exertion_total))
)

