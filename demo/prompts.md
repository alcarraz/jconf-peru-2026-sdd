# Prompts para los comandos de Spec Kit

Se pegan a continuación de cada comando. La interacción con Claude es en español; el idioma de los documentos lo fija la constitución elegida.

## `/speckit-specify`

```md
Un plugin para IDEs de JetBrains que vuelve navegables los IDs de requisitos
en los artefactos de Spec Kit. Las features de Spec Kit viven en
specs/<feature>/ y sus documentos (plan.md, tasks.md, research.md, checklists)
mencionan requisitos funcionales por su ID, por ejemplo FR-001, que se definen
en el spec.md de la feature.

Cuando un desarrollador hace Ctrl+click (o usa Go to Declaration) sobre un ID
FR-### en cualquier archivo Markdown de una feature, el IDE salta a la línea
del spec.md de esa feature donde se define el requisito. Los IDs que no están
definidos en spec.md no son navegables.

Fuera de alcance en esta primera versión: criterios de éxito (SC-###), IDs de
tareas, referencias a research y la navegación entre features distintas.
```

## `/speckit-clarify`

Sin texto: responder en vivo las preguntas del agente.

## `/speckit-plan`

```md
Usa el proyecto Gradle que ya existe en este repositorio, creado a partir del
IntelliJ Platform Plugin Template: toolchain de Java 21, IntelliJ Platform
2026.1 y sin Kotlin.
```

## `/speckit-tasks`

Sin texto.

## `/speckit-implement`

```md
Implementa solo las tareas necesarias hasta que Ctrl+click sobre un ID FR-###
en tasks.md navegue a su definición en spec.md, y detente ahí.
```
