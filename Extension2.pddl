(define (domain plannerExt2)
    (:requirements :adl :typing)
    (:types
        contenido dia - object
    )

    (:predicates
        (predecesor ?pre - contenido ?post - contenido)
        (ha_visto ?f - contenido)
        (quiere_ver ?f - contenido)
        (diaAnterior ?prev - dia ?next - dia)
        (asignado ?f - contenido ?d - dia)
        (paralelo ?f1 - contenido ?f2 - contenido)
    )

    (:action ver
        :parameters (?f - contenido ?dia - dia)
        :precondition (and
            (not (ha_visto ?f))
            (forall
                (?pre - contenido)
                (imply
                    (predecesor ?pre ?f)
                    (exists
                        (?d2 - dia)
                        (and
                            (asignado ?pre ?d2)
                            (diaAnterior ?d2 ?dia)
                        )
                    )
                ))
                
            (forall
                (?par - contenido)
                (imply
                    (paralelo ?f ?par)
                    (exists
                        (?d3 - dia)
                        (or
                            (asignado ?par ?dia)
                            (and (asignado ?par ?d3) (diaAnterior ?d3 ?dia))
                        )
                    )
                )))
        ;(exists (?prev - dia) (diaAnterior ?prev ?dia) (diaAsignado ?prev))  
        ;(diaAsignado (- ?dia 1)) ; no se puede hacer operaciones con boleanos
        :effect (and (ha_visto ?f) (asignado ?f ?dia))
    )
)