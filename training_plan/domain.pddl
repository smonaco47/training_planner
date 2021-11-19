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
        :precondition (not (or  
            (non_sequential ?workout1 ?workout2)
            (non_sequential ?workout2 ?workout3)
            (non_sequential ?workout3 ?workout4)
            (non_sequential ?workout4 ?workout5)
            (non_sequential ?workout5 ?workout6)
            (non_sequential ?workout6 ?workout7)
        ))
        :effect (and 
            (increase (exertion_total) (exertion ?workout1))
            (increase (exertion_total) (exertion ?workout2))
            (increase (exertion_total) (exertion ?workout3))
            (increase (exertion_total) (exertion ?workout4))
            (increase (exertion_total) (exertion ?workout5))
            (increase (exertion_total) (exertion ?workout6))
            (increase (exertion_total) (exertion ?workout7))
        )
    )
)