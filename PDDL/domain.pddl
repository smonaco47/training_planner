(define 
    (domain train_plan)
    (:requirements :typing :fluents :negative-preconditions :disjunctive-preconditions)
    (:types
        workout - object
        rest - workout
        incrementing_run - workout
    )

    (:predicates
        (non_sequential ?workout1 - workout ?workout2 - workout)
        (is_strength ?workout1 - workout)
        (incremented)
    )

    (:functions
        (exertion ?workout - workout)
        (exertion_total)
        (distance ?workout - workout)
        (max_time)
        (week_max_distance)
        (increment_speed)
    )

    (:action schedule_week
        :parameters
        (
            ?workout1 - workout
            ?workout2 - workout
            ?workout3 - workout
            ?workout4 - workout
            ?workout5 - workout
            ?workout6 - incrementing_run
            ?workout7 - rest
        )
        :precondition (and 
            ; At least one strength
            (or (is_strength ?workout1)
                (is_strength ?workout2)
                (is_strength ?workout3)
                (is_strength ?workout4)
                (is_strength ?workout5)
                (is_strength ?workout6)
                (is_strength ?workout7)
            )
            ; Make sure we are allowing time to rest after hard workouts
            (not (or  
                (non_sequential ?workout1 ?workout2)
                (non_sequential ?workout2 ?workout3)
                (non_sequential ?workout3 ?workout4)
                (non_sequential ?workout4 ?workout5)
                (non_sequential ?workout5 ?workout6)
                (non_sequential ?workout6 ?workout7)
            ))
            ; Minimum workout time
            (> 
                (+(exertion ?workout1)
                (+(exertion ?workout2)
                (+(exertion ?workout3)
                (+(exertion ?workout4)
                (+(exertion ?workout5)
                (+(exertion ?workout6)
                (exertion ?workout7))))))
            ) 150)
            ; Maximum workout time
            (< 
                (+(exertion ?workout1)
                (+(exertion ?workout2)
                (+(exertion ?workout3)
                (+(exertion ?workout4)
                (+(exertion ?workout5)
                (+(exertion ?workout6)
                (exertion ?workout7))))))
            ) (max_time))
            ; Maximum distance
            (<
                (+(distance ?workout1)
                (+(distance ?workout2)
                (+(distance ?workout3)
                (+(distance ?workout4)
                (+(distance ?workout5)
                (+(distance ?workout6)
                (distance ?workout7))))))
            ) (week_max_distance))
            (incremented)
        )
        :effect (and
            (not(incremented))

            (increase (exertion_total) (exertion ?workout1))
            (increase (exertion_total) (exertion ?workout2))
            (increase (exertion_total) (exertion ?workout3))
            (increase (exertion_total) (exertion ?workout4))
            (increase (exertion_total) (exertion ?workout5))
            (increase (exertion_total) (exertion ?workout6))
            (increase (exertion_total) (exertion ?workout7))
        )
    )

    (:action increase_for_week
        :parameters (
            ?workout - incrementing_run
        )
        :precondition (and 
            (not (incremented))
        )
        :effect (and 
            ; No more than 1% increase per week
            (increase (week_max_distance) (* (week_max_distance) 0.25))
            (increase (distance ?workout) (increment_speed))
            (incremented)
        )
    )
)