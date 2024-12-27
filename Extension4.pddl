(define (domain plannerExt4)
    (:requirements :adl :typing :fluents)
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
        (diaSiguiente ?next - dia ?prev - dia)
    )

    (:functions
        (duracionContenido ?d - contenido)
        (duracionDiaria ?dd - dia)
    )

    (:action ver
        :parameters (?f - contenido ?dia - dia)
        :precondition (and
            (not (ha_visto ?f))
            (<= (+ (duracionDiaria ?dia) (duracionContenido ?f)) 200)
            (forall
                (?pre - contenido)
                (and
                    (imply
                        (predecesor ?pre ?f)
                        (exists
                            (?d2 - dia)
                            (and
                                (asignado ?pre ?d2)
                                (diaAnterior ?d2 ?dia)
                            )
                        )
                    )
                    (imply
                        (paralelo ?f ?pre)
                        (exists
                            (?d3 - dia)
                            (or
                                (asignado ?pre ?dia)
                                (and (asignado ?pre ?d3) (or (diaSiguiente ?d3 ?dia) (diaSiguiente ?dia ?d3)))
                            )
                        )
                    )
                )
            ))
        ;(exists (?prev - dia) (diaAnterior ?prev ?dia) (diaAsignado ?prev))  
        ;(diaAsignado (- ?dia 1)) ; no se puede hacer operaciones con boleanos
        :effect (and (ha_visto ?f) (asignado ?f ?dia) (increase (duracionDiaria ?dia) (duracionContenido ?f)))
    )
)