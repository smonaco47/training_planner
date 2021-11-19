; https://fareskalaboud.github.io/LearnPDDL/

(define 
    (domain train_plan)
    (:requirements :typing :fluents)
    (:types
        workout - object
    )

    (:predicates
        (non_sequential ?workout1 - workout ?workout2 - workout)
    )

    (:functions
        (exertion ?workout - workout)
        (exertion_total)
    )

    (:action schedule_week
        :parameters
        (
            ?workout1 - workout
            ?workout2 - workout
            ?workout3 - workout
            ?workout4 - workout
            ?workout5 - workout
            ?workout6 - workout
            ?workout7 - workout
        )
        :precondition (and 
            (not (or  
                (non_sequential ?workout1 ?workout2)
                (non_sequential ?workout2 ?workout3)
                (non_sequential ?workout3 ?workout4)
                (non_sequential ?workout4 ?workout5)
                (non_sequential ?workout5 ?workout6)
                (non_sequential ?workout6 ?workout7)

            ))
            (< 
                (+(exertion ?workout1)
                (+(exertion ?workout2)
                (+(exertion ?workout3)
                (+(exertion ?workout4)
                (+(exertion ?workout5)
                (+(exertion ?workout6)
                (exertion ?workout7))))))
            ) 200)
            (> 
                (+(exertion ?workout1)
                (+(exertion ?workout2)
                (+(exertion ?workout3)
                (+(exertion ?workout4)
                (+(exertion ?workout5)
                (+(exertion ?workout6)
                (exertion ?workout7))))))
            ) 150)
        )
        :effect (and
            (forall (?w - workout)
                (increase (exertion_total) (exertion ?w))
            )
        )
    )
)