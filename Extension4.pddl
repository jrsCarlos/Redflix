(define (domain plannerExt4)
    (:requirements :adl :typing :fluents)
    (:types
        contenido dia - object
    )

    (:predicates
        (ha-visto ?c - contenido)
        (predecesor ?pre - contenido ?post - contenido)
        (paralelo ?c1 - contenido ?c2 - contenido)
        (dia-siguiente ?next - dia ?prev - dia)
        (dia-anterior ?prev - dia ?next - dia)
        (asignado ?c - contenido ?d - dia)
    )

    (:functions
        (duracion-contenido ?d - contenido)
        (duracion-diaria ?dd - dia)
    )

    (:action ver
        :parameters (?c - contenido ?dia - dia)
        :precondition (and
                          ; Evitamos ver contenidos ya vistos
                          (not (ha-visto ?c))
                          ; Evitamos asignar un contenido cuya duracion supere el limite
                          (<= (+ (duracion-diaria ?dia) (duracion-contenido ?c)) 200)
                          (forall (?pre - contenido)
                                  (and (imply (predecesor ?pre ?c)
                                              ; Debe existir un dia anterior en el que se haya asignado ?pre
                                              (exists (?d2 - dia)
                                                  (and
                                                      (asignado ?pre ?d2)
                                                      (dia-anterior ?d2 ?dia)
                                                  )
                                              )
                                       )
                                       ; Si el contenido predecesor es paralelo
                                       (imply (paralelo ?c ?pre)
                                              (exists (?d3 - dia)
                                                  (or
                                                      ; El contenido paralelo se ha asignado en el mismo dia
                                                      (asignado ?pre ?dia)
                                                      ; El contenido paralelo se ha asignado en un dia anterior o posterior
                                                      (and
                                                          (asignado ?pre ?d3)
                                                          (or (dia-siguiente ?d3 ?dia) (dia-siguiente ?dia ?d3))
                                                      )
                                                  )
                                              )
                                       )
                                  )
                          )
                      )

        ; Marcamos el contenido como visto y lo asignamos al dia correspondiente
        ; Ademas, sumamos la duracion del contenido a la duracion acumulada del dia
        :effect (and (ha-visto ?c) (asignado ?c ?dia) (increase (duracion-diaria ?dia) (duracion-contenido ?c)))
    )
)