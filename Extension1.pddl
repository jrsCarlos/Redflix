(define (domain plannerExt1)
    (:requirements :adl :typing)
    (:types
        contenido dia - object
    )

    (:predicates
        (predecesor ?pre - contenido ?post - contenido)
        (ha-visto ?c - contenido)
        (dia-anterior ?prev - dia ?next - dia)
        (asignado ?c - contenido ?d - dia)
    )

    (:action ver
        :parameters (?c - contenido ?dia - dia)
        :precondition (and
                          ; Evitamos ver contenidos ya vistos
                          (not (ha-visto ?c))
                          ; Para todos los contenidos que son predecessores de ?c
                          (forall (?pre - contenido)
                                  (imply (predecesor ?pre ?c)
                                         ; Debe existir un dia anterior en el que se haya asignado ?pre
                                         (exists (?d2 - dia)
                                             (and
                                                 (asignado ?pre ?d2)
                                                 (dia-anterior ?d2 ?dia)
                                             )
                                         )
                                  )
                          )
                      )

        ; Marcamos el contenido como visto y lo asignamos al dia correspondiente
        :effect (and (ha-visto ?c) (asignado ?c ?dia))
    )
)