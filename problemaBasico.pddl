(define (problem juego-de-prueba-basico-1)
    (:domain planner)
    (:objects
        C1 C2 C3 C4 - contenido
    )
    (:init
        (quiere-ver C1)
        (quiere-ver C2)
        (quiere-ver C3)
        (quiere-ver C4)
    )

    (:goal (and (forall (?c - contenido)
                        ; Si el usuario quiere ver un contenido, entonces lo ha visto
                        (imply (quiere-ver ?c) (ha-visto ?c))
                )
           )
    )
)