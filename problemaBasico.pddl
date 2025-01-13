(define (problem juego-de-prueba-basico-1)
    (:domain planner)
    (:objects
        s1e1 s1e2 s1e3 s2e1 s2e2 s2e3 s2e4 - contenido
    )
    (:init
        (predecesor s1e1 s1e2)
        (predecesor s1e2 s1e3)
        (predecesor s1e3 s2e1)
        (predecesor s2e1 s2e2)
        (predecesor s2e2 s2e3)
        (predecesor s2e3 s2e4)

        (quiere-ver s1e2)
        (quiere-ver s2e4)
    )

    (:goal (and (forall (?c - contenido)
                        ; Si el usuario quiere ver un contenido, entonces lo ha visto
                        (imply (quiere-ver ?c) (ha-visto ?c))
                )
           )
    )
)