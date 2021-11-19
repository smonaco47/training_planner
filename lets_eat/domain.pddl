; https://fareskalaboud.github.io/LearnPDDL/

(define 
    (domain letseat)
    (:requirements :typing :fluents)
    (:types
        location locatable - object
            bot cupcake - locatable
        robot - bot
    )

    (:predicates
        (on ?obj - locatable ?loc - location)
        (holding ?arm - locatable ?cupcake - locatable)
        (arm-empty)
        (path ?location1 - location ?location2 - location)
    )

    (:functions
        (cupcakes-on-location ?loc - location)
    )

    ; (:action bake-cupcake
    ;     :parameters (
    ;         ?cupcake - cupcake
    ;         ?arm - bot
    ;     )
    ;     :precondition (and 
    ;         (not (holding ?arm ?cupcake))
    ;     )
    ;     :effect (and 
    ;         (increase (num-cupcake ?cupcake) 1)
    ;     )
    ; )

    (:action pick-up
        :parameters
        (
            ?arm - bot
            ?cupcake - cupcake
            ?loc - location
        )
        :precondition (and 
            (on ?arm ?loc)
            (on ?cupcake ?loc)
            (arm-empty)
        )
        :effect (and 
            (not (on ?cupcake ?loc))
            (holding ?arm ?cupcake)
            (not (arm-empty))
            (decrease (cupcakes-on-location ?loc) 1)
        )
    )

    (:action drop
        :parameters 
        (
            ?arm - bot
            ?cupcake - cupcake
            ?loc - location
        )
        :precondition (and 
            (on ?arm ?loc)
            (holding ?arm ?cupcake)
        )
        :effect (and 
            (on ?cupcake ?loc)
            (not (holding ?arm ?cupcake))
            (arm-empty)
            (increase (cupcakes-on-location ?loc) 1)
        )
    )

    (:action move
        :parameters (
            ?arm - bot
            ?from - location
            ?to - location
        )
        :precondition (and 
            (on ?arm ?from)
            (or 
                (path ?from ?to)
                (path ?to ?from)
            )
        )
        :effect (and 
            (not (on ?arm ?from))
            (on ?arm ?to)
        )
    )
)