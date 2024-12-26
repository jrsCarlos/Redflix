(define (problem test-01)
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
        
        (quiere_ver s1e2)
        (quiere_ver s2e4)
    )

    ; (:goal (and (forall (?c - content) (seen ?c))))
    (:goal (and (forall (?c - contenido) (imply (quiere_ver ?c) (ha_visto ?c)))))
)