(define (problem juego-de-prueba-ext4-1)
    (:domain plannerExt4)
    (:objects
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 - contenido
        d1 d2 d3 d4 d5 d6 d7 - dia
    )
    (:init
        ; Establecemos las relaciones entre contenidos
        (predecesor c1 c2)
        (predecesor c2 c3)
        (predecesor c3 c4)
        (predecesor c4 c5)
        (predecesor c5 c6)
        (predecesor c6 c7)

        (paralelo c1 c8)
        (paralelo c1 c9)
        (paralelo c1 c10)
        (paralelo c1 c11)

        (paralelo c7 c12)
        (paralelo c7 c13)
        (paralelo c7 c14)
        (paralelo c7 c15)

        ; Establecemos un orden entre los dias
        (dia-siguiente d2 d1)
        (dia-siguiente d3 d2)
        (dia-siguiente d4 d3)
        (dia-siguiente d5 d4)
        (dia-siguiente d6 d5)
        (dia-siguiente d7 d6)

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

        ; Inicializamos la duracion de cada contenido
        (= (duracion-contenido c1) 40)
        (= (duracion-contenido c2) 30)
        (= (duracion-contenido c3) 90)
        (= (duracion-contenido c4) 60)
        (= (duracion-contenido c5) 20)
        (= (duracion-contenido c6) 40)
        (= (duracion-contenido c7) 50)
        (= (duracion-contenido c8) 100)
        (= (duracion-contenido c9) 30)
        (= (duracion-contenido c10) 30)
        (= (duracion-contenido c11) 50)
        (= (duracion-contenido c12) 10)
        (= (duracion-contenido c13) 20)
        (= (duracion-contenido c14) 20)
        (= (duracion-contenido c15) 40)

        ; Inicializamos la duracion total de cada dia a 0
        (= (duracion-diaria d1) 0)
        (= (duracion-diaria d2) 0)
        (= (duracion-diaria d3) 0)
        (= (duracion-diaria d4) 0)
        (= (duracion-diaria d5) 0)
        (= (duracion-diaria d6) 0)
        (= (duracion-diaria d7) 0)
    )

    ; Establecemos los contenidos que el usuario habra visto tras seguir el plan.
    (:goal (ha-visto c7))
)