(define (domain planner)
    (:requirements :adl :typing)
    (:types
        contenido - object
    )

    (:predicates
        (predecesor ?pre - contenido ?post - contenido)
        (ha-visto ?c - contenido)
        (quiere-ver ?c - contenido)
    )

    (:action ver
        :parameters (?c - contenido)
        :precondition (and 
                          ; Evitamos ver contenidos ya vistos
                          (not (ha-visto ?c))
                          ; Si existe algún contenido que es predecesor de ?c y no ha sido visto, entonces no se puede ver ?c
                          (not (exists (?pre - contenido) (and (predecesor ?pre ?c) (not (ha-visto ?pre)))))
                      )

        ; Marcamos el contenido como visto
        :effect (ha-visto ?c)
    )
)