import random
import os
import sys

def gen_base_case():
    # Genera un caso base
    name = "base_" + str(random.randint(1, 100))
    print(name, file= sys.stdout)
    with open(name + ".pddl", "w") as f:
        # Inicializamos el domnio
        print("(define (problem "+name+")", file=f)
        print("\t(:domain planner)", file=f)
        numContenidos = random.randint(5, 10)
        
        # Cremos los contenidos
        print("\t(:objects", file=f)
        print("\t\t", file=f, end="")
        for i in range(numContenidos):
            print("C"+str(i), file=f, end=" ")
        print("- contenido", file=f)
        print("\t)", file=f)
        print(file=f)
        
        # Especificamos los predecesores
        print("\t(:init", file=f)
        numPredecesores = random.randint(1, numContenidos)
        for i in range(numPredecesores):
            if(i+1 > numContenidos-1): break
            j = random.randint(i+1, numContenidos-1)
            print("\t\t(predecesor C"+str(i)+" C"+str(j)+")", file=f)
        
        numQuierever = random.randint(1, numContenidos)
        assig = {}
        for i in range(numQuierever):
            j = str(random.randint(0, numContenidos-1))
            while assig.get(j, False):
                j = str(random.randint(0, numContenidos-1))
            assig[j] = True
            print("\t\t(quiere_ver C"+j+")", file=f) 
        print("\t)", file=f)
        print(file=f)
        print("\t(:goal (and (forall (?c - contenido) (imply (quiere_ver ?c) (ha_visto ?c)))))", file=f)
        print(")",file=f)

def gen_ext1_case():
    # Genera un caso base
    name = "Ext1_" + str(random.randint(1, 100))
    print(name, file= sys.stdout)
    with open(name + ".pddl", "w") as f:
        # Inicializamos el domnio
        print("(define (problem "+name+")", file=f)
        print("\t(:domain plannerExt1)", file=f)
        numContenidos = random.randint(5, 15)
        
        # Cremos los contenidos y días
        print("\t(:objects", file=f)
        print("\t\t", file=f, end="")
        for i in range(numContenidos):
            print("C"+str(i), file=f, end=" ")
        print("- contenido", file=f)
        print("\t\t", file=f, end="")
        for i in range(numContenidos):
            print("D"+str(i), file=f, end=" ")
        print("- dia", file=f)
        print("\t)", file=f)
        print(file=f)
        # Especificamos los predecesores
        print("\t(:init", file=f)
        numPredecesores = random.randint(1, numContenidos)
        for i in range(numPredecesores):
            if(i+1 > numContenidos-1): break
            j = random.randint(i+1, numContenidos-1)
            print("\t\t(predecesor C"+str(i)+" C"+str(j)+")", file=f)
        print(file=f)
        
        for i in range(numContenidos):
            for j in range(i+1, numContenidos):
                print("\t\t(diaAnterior D"+str(i) +" D"+str(j)+")", file=f)
            
        print("\t)", file=f)
        print(file=f)
        numQuierever = random.randint(1, numContenidos-1)
        assig = {}
        print("\t(:goal (and ", file=f)
        for i in range(numQuierever):
            j = str(random.randint(0, numContenidos-1))
            while assig.get(j, False):
                j = str(random.randint(0, numContenidos-1))
            assig[j] = True
            print("\t\t(ha_visto C"+j+")", file=f)
        print("\t\t)", file=f)
        print("\t)", file=f)
        print(")",file=f)

#def gen_ext2_case():

#def gen_ext3_case():

#def gen_ext4_case():


#gen_base_case()
gen_ext1_case()
