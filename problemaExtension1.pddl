(define (problem juego-de-prueba-ext1-1)
    (:domain plannerExt1)
    (:objects
        c1 c2 c3 c4 c5 - contenido
        d1 d2 d3 d4 d5 d6 d7 - dia
    )
    (:init
        ; Establecemos las relaciones entre contenidos.
        (predecesor c1 c2)
        (predecesor c2 c3)
        (predecesor c3 c4)
        (predecesor c3 c5)

        ; Establecemos un orden entre los dias.
        ; Para que el orden se coherente tenemos no nos basta con marcar
        ; que el dia d_j es anterior a d_i, tambien debemos marcarlo para
        ; todos los dias d_j con j < i.
        (dia-anterior d1 d2)
        (dia-anterior d1 d3)
        (dia-anterior d1 d4)
        (dia-anterior d1 d5)
        (dia-anterior d1 d6)
        (dia-anterior d1 d7)
        (dia-anterior d2 d3)
        (dia-anterior d2 d4)
        (dia-anterior d2 d4)
        (dia-anterior d2 d5)
        (dia-anterior d2 d6)
        (dia-anterior d2 d7)
        (dia-anterior d3 d4)
        (dia-anterior d3 d5)
        (dia-anterior d3 d6)
        (dia-anterior d3 d7)
        (dia-anterior d4 d5)
        (dia-anterior d4 d6)
        (dia-anterior d4 d7)
        (dia-anterior d5 d6)
        (dia-anterior d5 d7)
        (dia-anterior d6 d7)
    )

    (:goal
        ; Establecemos los contenidos que el usuario habra visto tras seguir el plan.
        (and (ha-visto c1) (ha-visto c5))
    )
)