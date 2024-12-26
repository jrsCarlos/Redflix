(define (domain planner)
    (:requirements :adl :typing)
    (:types
        contenido - object
    )

    (:predicates
        (predecesor ?pre - contenido ?post - contenido)
        (ha_visto ?f - contenido)
        (quiere_ver ?f - contenido)
    )

    (:action ver
        :parameters (?f - contenido)
        :precondition (and
            (not (ha_visto ?f))
            (not (exists
                    (?pre - contenido)
                    (and (predecesor ?pre ?f) (not (ha_visto ?pre)))))
        )
        :effect (ha_visto ?f)
    )
)