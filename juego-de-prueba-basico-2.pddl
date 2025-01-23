(define (problem juego-de-prueba-basico-2)
	(:domain planner)
	(:objects
		C0 C1 C2 C3 C4 C5 C6 C7 - contenido
	)

	(:init
		(predecesor C0 C2)
		(predecesor C2 C5)
		(predecesor C3 C4)
		(quiere-ver C1)
		(quiere-ver C5)
	)

	(:goal (and (forall (?c - contenido) (imply (quiere-ver ?c) (ha-visto ?c)))))
)
