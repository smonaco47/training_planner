; https://fareskalaboud.github.io/LearnPDDL/

(define 
    (problem train_plan-simple) 
    (:domain train_plan)
    (:objects 
        easy_run - incrementing_run
        swim - workout
        rest - rest
        strength_workout - workout
        spin - workout
    )

    (:init
        (= (max_time) 200)
        (= (week_max_distance) 999)
        (= (exertion_total) 0)
        (= (increment_speed) 0)
        (= (weekly_distance) 0)
        (incremented)

        (= (exertion easy_run) 60)
        (= (exertion swim) 45)
        (= (exertion spin) 60)
        (= (exertion strength_workout) 20)
        (= (exertion rest) 0)

        (= (distance easy_run) 3)
        (= (distance swim) 0)
        (= (distance spin) 0)
        (= (distance strength_workout) 0)
        (= (distance rest) 0)

        (non_sequential easy_run easy_run)
        (non_sequential swim swim)
        (non_sequential easy_run strength_workout)
        
        (is_strength strength_workout)
    )

    (:goal (and
        (>= (exertion_total) 1000)
    ))
)

