(define (domain planner)
    (:requirements :adl :typing)
    (:types
        contenido - object
    )

    (:predicates
        (predecessor ?pre - contenido ?post - contenido)
        (ha_visto ?f - contenido)
        (quiere_ver ?f - contenido)
    )

    (:action ver
        :parameters (?f - contenido)
        :precondition (forall
            (?pre - contenido)
            (and (imply
                    (predecessor ?pre ?f)
                    (ha_visto ?pre)) (quiere_ver ?f)))
        :effect (ha_visto ?f)
    )
)