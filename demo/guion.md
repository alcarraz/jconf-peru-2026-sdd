# Guion de la demo

Interacción con Claude en español; los documentos que genera Spec Kit, en inglés. Tiempos de referencia del intento 1 (tiempo del agente / tiempo total de la fase).

## Antes de la charla

Laptop, usuario `demo`:

- [ ] Cargador, adaptador de video, modo no molestar activado, notificaciones apagadas.
- [ ] Repo del plugin en `main`, igual a `base` y sin inicializar (los intentos quedan en sus ramas): `git switch main && git status && git log -1 --decorate`. En vivo se trabaja sobre `main`, que es la rama que sube `gh repo create`.
- [ ] Precalentar el IDE de prueba: un `./gradlew runIde` completo sobre `base` y cerrarlo, para que el primer arranque en vivo no indexe desde cero.
- [ ] `claude` con la sesión iniciada; `gh auth status` correcto.
- [ ] Tamaño de letra grande en la terminal y en IntelliJ; tema claro.
- [ ] Escritorio 1: terminal en `~/speckit-jetbrains-plugin`, sin Claude arrancado.
- [ ] Escritorio 2: navegador de archivos sobre el repo del plugin (IntelliJ con vista previa de Markdown).
- [ ] Escritorio 3: presentación en PDF y `demo/constitucion-en.md`, `demo/constitucion-es.md` y `demo/prompts.md` abiertos para copiar.
- [ ] Segunda terminal para `runIde`, fuera de Claude.

## Durante la demo

En cada fase: escribir el comando, pegar el texto y recién entonces Enter. Al terminar cada fase, commit desde Claude con `!`.

### 1. Init (~6 s)

`specify init --here --force --integration claude`, luego `claude`.

Mostrar: `.specify/` (plantillas, scripts, `memory/constitution.md` vacía) y `.claude/skills/` con los comandos.

Commit: `!git add -A && git commit -m "chore: initialize Spec Kit"`

### 2. Constitution (18 s)

`/speckit-constitution` + el archivo completo de la constitución del idioma votado para los documentos (`demo/constitucion-en.md` o `demo/constitucion-es.md`).

Mientras trabaja: explicar los principios desde el escritorio 3. Al terminar: abrir `.specify/memory/constitution.md` y mostrar cómo los reescribió con MUST/SHOULD y le puso versión.

Commit: `!git add -A && git commit -m "docs: adopt project constitution"`

### 3. Specify (29 s / ~6 min)

`/speckit-specify` + prompt de `demo/prompts.md`.

Mientras trabaja: contar que el prompt dice qué y para quién, no cómo. Al terminar, en `specs/001-*/spec.md`: historias con prioridad, escenarios Given/When/Then, la lista de FR-### (lo que el plugin va a enlazar), criterios de éxito, supuestos. Mostrar `checklists/requirements.md`.

Commit: `!git add -A && git commit -m "docs: specify FR-### navigation"`

### 4. Clarify (~4 min)

`/speckit-clarify`, responder en voz alta, pidiendo opinión al público si da el tiempo.

Al terminar: la sección `## Clarifications` y cómo cada respuesta cambió FRs y supuestos.

Commit: `!git add -A && git commit -m "docs: clarify FR-### navigation"`

### 5. Plan (66 s / ~3,5 min)

`/speckit-plan` + prompt de `demo/prompts.md`.

Mientras trabaja: explicar que acá entra la tecnología y el chequeo contra la constitución. Al terminar: `plan.md` (Constitution Check), `research.md` (decisiones y alternativas descartadas), `data-model.md`, `contracts/`.

Commit: `!git add -A && git commit -m "docs: plan FR-### navigation"`

### 6. Tasks (42 s)

`/speckit-tasks`.

Al terminar: fases, `[P]` para lo paralelizable, etiquetas de historia y cómo cada tarea cita su FR: la trazabilidad que el plugin va a volver navegable.

Commit: `!git add -A && git commit -m "docs: break down FR-### navigation tasks"`

### 7. Analyze (35 s)

`/speckit-analyze`.

Al terminar: el informe de consistencia entre spec, plan y tareas; no cambia archivos.

### 8. Implement (~6 min)

`/speckit-implement` + prompt de `demo/prompts.md`.

Mientras trabaja: seguir en el escritorio 2 las clases y tests que va creando, y cómo marca las tareas como hechas en `tasks.md`. Si pregunta algo, leerlo en voz alta: es el momento en que el agente consulta en vez de improvisar.

Commit: `!git add -A && git commit -m "feat: navigate FR-### IDs to their definition"`

### 9. Probar (~2 min)

En la segunda terminal: `./gradlew runIde`. En el IDE de prueba, abrir el propio repo del plugin, ir a `tasks.md` y hacer Ctrl+click en un FR-###: el plugin navegando su propia spec.

## Cierre

`gh repo create peru-jugos-project/speckit-jetbrains-plugin --public --source . --push`

Mostrar el repo recién creado y las tareas pendientes de `tasks.md` como punto de partida para contribuir.
