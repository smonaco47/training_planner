(define 
    (problem train_plan-marathon) 
    (:domain train_plan)
    (:objects 
        easy_run - workout
        long_run - incrementing_run
        intervals - workout
        cross_train - workout
        strength_workout - workout
        rest - rest
    )

    (:init
        (= (max_time) 300)
        (= (week_max_distance) 5)
        (= (increment_speed) 1)
        (incremented)
        
        (= (exertion_total) 0)

        (= (distance long_run) 3)
        (= (distance easy_run) 3)
        (= (distance intervals) 2)
        (= (distance cross_train) 0)
        (= (distance strength_workout) 0)
        (= (distance rest) 0)

        (= (exertion easy_run) 30)
        (= (exertion long_run) 60)
        (= (exertion cross_train) 45)
        (= (exertion intervals) 45)
        (= (exertion strength_workout) 10)
        (= (exertion rest) 0)

        (non_sequential long_run strength_workout)
        (non_sequential strength_workout long_run)
        (non_sequential strength_workout strength_workout)
        (non_sequential intervals strength_workout)
        (non_sequential strength_workout intervals)
        (non_sequential cross_train cross_train)
        (non_sequential long_run long_run)
        (non_sequential intervals intervals)
        

        (is_strength strength_workout)
    )

    (:goal (and
        (>= (distance long_run) 20)
        (not (incremented))
    ))
)

