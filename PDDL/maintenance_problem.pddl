(define 
    (problem train_plan-maintenance) 
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
        (= (week_max_distance) 9)
        (= (exertion_total) 0)
        (= (increment_speed) 0)
        (incremented)

        (= (exertion easy_run) 30)
        (= (exertion swim) 45)
        (= (exertion spin) 30)
        (= (exertion strength_workout) 10)
        (= (exertion rest) 0)

        (= (distance easy_run) 3)
        (= (distance swim) 0)
        (= (distance spin) 0)
        (= (distance strength_workout) 0)
        (= (distance rest) 0)

        (non_sequential easy_run easy_run)
        (non_sequential swim swim)
        (non_sequential strength_workout strength_workout)
        (non_sequential easy_run strength_workout)
        
        (is_strength strength_workout)
    )

    (:goal (and
        (>= (exertion_total) 300)
    ))
)

