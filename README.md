# Redflix - Planificador de Contenidos Audiovisuales

## Descripción del Proyecto

Redflix es un sistema de planificación inteligente desarrollado en **PDDL** (Planning Domain Definition Language) que permite a los usuarios organizar la visualización de contenidos audiovisuales (series y películas) considerando diversas restricciones y dependencias entre los contenidos.

## Autores

- Xinxiang Zhou
- Pablo Fondevilla  
- Carlos Rosales

**Curso**: 2024-25 - Q1

## Estructura del Proyecto

El proyecto sigue un enfoque incremental con 5 niveles de complejidad:

### 1. **Nivel Básico**
- Contenidos con 0 o 1 predecesores
- Sin contenidos paralelos
- Planificación para un solo día

### 2. **Extensión 1**
- Contenidos con 0 a N predecesores
- Sin contenidos paralelos
- Planificación multi-día con orden temporal

### 3. **Extensión 2**
- Contenidos con 0 a M contenidos paralelos
- Gestión de predecesores y paralelismo
- Los contenidos paralelos deben verse en días consecutivos

### 4. **Extensión 3**
- Límite de 3 contenidos por día
- Uso de funciones numéricas para control de asignaciones

### 5. **Extensión 4**
- Límite de 200 minutos de visualización diaria
- Duración asociada a cada contenido
- Control de tiempo acumulado por día

## Diseño Técnico

### Características Principales

- **Operador único**: `ver` - acción principal que encapsula toda la lógica de restricciones
- **Tipos definidos**:
  - `contenido`: películas y episodios
  - `dia`: días disponibles para planificación

### Predicados Clave

- `(predecesor ?pre ?post)`: relaciones de precedencia
- `(paralelo ?c1 ?c2)`: contenidos del mismo universo
- `(ha-visto ?c)`: estado de visualización
- `(asignado ?c ?d)`: asignación día-contenido
- `(dia-anterior ?prev ?next)`: orden temporal
- `(dia-siguiente ?next ?prev)`: relación consecutiva

### Funciones Numéricas

- `(num-asignados ?d)`: contador de contenidos por día
- `(duracion-contenido ?c)`: duración en minutos
- `(duracion-diaria ?d)`: tiempo acumulado por día

## Archivos del Proyecto

El proyecto incluye:
- **Dominios PDDL** para cada extensión
- **Problemas de prueba** con casos representativos
- **Generador automático** de problemas de prueba
- **Documentación** completa en PDF

## Juegos de Prueba

Cada extensión incluye al menos 2 juegos de prueba que validan:
- Cumplimiento de predecesores
- Gestión de contenidos paralelos
- Límites de contenidos por día
- Restricciones de duración
- Casos con múltiples dependencias
