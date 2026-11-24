# Guion de la demo

Interacción con Claude en español; los documentos que genera Spec Kit, en inglés (`constitucion-en.md`). Tiempos de referencia: intento 2 (tiempo del agente / tiempo total de la fase).

La demo parte de un repositorio vacío: el agente crea también el proyecto Gradle durante `implement`. Si el intento 3 muestra que suma demasiado, se vuelve a partir de `base` (el prompt de `plan` de esa variante está en `prompts.md`, historial de git).

## Antes de la charla

Laptop, usuario `demo`:

- [ ] Cargador, adaptador de video, modo no molestar activado, notificaciones apagadas.
- [ ] Repo del plugin vacío (solo `.gitignore`; la licencia y el README los crea el agente por la constitución): `git switch main && git log --oneline --decorate && ls -A`. En vivo se trabaja sobre `main`, que es la rama que sube `gh repo create`.
- [ ] Cachés calientes: Gradle y el IDE ya descargados en el usuario `demo` (un `./gradlew runIde` completo sobre `base` en otra rama o carpeta, y cerrarlo).
- [ ] `claude` con la sesión iniciada; `gh auth status` correcto.
- [ ] Tamaño de letra grande en la terminal y en IntelliJ; tema claro.
- [ ] Escritorio 1: terminal en `~/speckit-jetbrains-plugin`, sin Claude arrancado.
- [ ] Escritorio 2: navegador de archivos sobre el repo del plugin (IntelliJ con vista previa de Markdown).
- [ ] Escritorio 3: presentación en PDF y `demo/constitucion-en.md` y `demo/constitucion-es.md` abiertos para copiar.
- [ ] Segunda terminal para `runIde`, fuera de Claude.
- [ ] La constitución a pegar es la del idioma votado: `grep -n "^8\." demo/constitucion-en.md` debe decir que los artefactos van en inglés.

## Intento 3: ensayo rápido

Objetivo: medir lo mínimo posible, sin explicar en voz alta ni simular la charla. Anotar con la hora cualquier duda o demora.

Preparar la rama (una sola vez, en la laptop):

```
cd ~/speckit-jetbrains-plugin
git switch --orphan intento-3
git checkout base -- .gitignore
git commit -m "chore: initial commit" && git tag vacio
```

Reglas del ensayo:

- Pegar siempre la constitución en inglés (`constitucion-en.md`).
- No ejecutar `analyze`.
- Responder `clarify` sin debatir.
- Al abrir el IDE de prueba, mirar "Background Tasks" (barra inferior) y anotar qué hace y cuánto dura.
- Medir aparte, en `implement`, lo que tarda el agente en crear el proyecto (primera fase de `tasks.md`) y lo que tarda en la funcionalidad.

## Durante la demo

En cada fase: escribir el comando, pegar el texto y recién entonces Enter. Al terminar cada fase, commit desde Claude con `!`.

### 1. Init (~5 s)

`time specify init --here --force --integration claude`, luego `claude`.

En la charla mostrar: `.specify/` (plantillas, scripts, `memory/constitution.md` vacía) y `.claude/skills/` con los comandos.

Commit: `!git add -A && git commit -m "chore: initialize Spec Kit"`

### 2. Constitution (~18 s)

Escribir `/speckit-constitution` y pegar a continuación el archivo completo de la constitución del idioma votado (`demo/constitucion-en.md` o `demo/constitucion-es.md`), que es largo y se copia del archivo.

En la charla: explicar los principios desde el escritorio 3 mientras trabaja. Al terminar, abrir `.specify/memory/constitution.md` y mostrar cómo los reescribió con MUST/SHOULD y le puso versión.

Commit: `!git add -A && git commit -m "docs: adopt project constitution"`

### 3. Specify (~45 s)

Escribir `/speckit-specify` y pegar a continuación este texto:

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

En la charla: el prompt dice qué y para quién, no cómo. Al terminar mostrar solo en `specs/001-*/spec.md` las historias con prioridad y la lista de FR-### (lo que el plugin va a enlazar); luego `checklists/requirements.md`. Tenerla abierta antes de empezar para no buscarla.

Commit: `!git add -A && git commit -m "docs: specify FR-### navigation"`

### 4. Clarify (~15 s del agente más tus respuestas)

`/speckit-clarify`, responder sin debatir (en la charla, pidiendo opinión al público si da el tiempo).

Al terminar: la sección `## Clarifications` y cómo cada respuesta cambió FRs y supuestos.

Commit: `!git add -A && git commit -m "docs: clarify FR-### navigation"`

### 5. Plan (~4,5 min con el IDE sin descargar a mano; menos si lo encuentra)

Escribir `/speckit-plan` y pegar a continuación este texto:

```md
El proyecto todavía no existe: el repositorio está vacío. Será un plugin de
IntelliJ Platform en Java 21, para IntelliJ Platform 2026.1, construido con
Gradle y sin Kotlin.
```

En la charla: explicar que acá entra la tecnología y el chequeo contra la constitución. Al terminar: `plan.md` (Constitution Check), `research.md` (qué mecanismo eligió y qué descartó), `data-model.md`, `contracts/`.

Commit: `!git add -A && git commit -m "docs: plan FR-### navigation"`

### 6. Tasks (~50 s)

`/speckit-tasks`.

Al terminar: fases (la primera es el andamiaje del proyecto), `[P]` para lo paralelizable, etiquetas de historia y cómo cada tarea cita su FR: la trazabilidad que el plugin va a volver navegable.

Commit: `!git add -A && git commit -m "docs: break down FR-### navigation tasks"`

### 7. Implement (~4,5 min con el proyecto ya creado; sumar la creación)

Escribir `/speckit-implement` y pegar a continuación este texto:

```md
Implementa solo las tareas necesarias hasta que Ctrl+click sobre un ID FR-###
en tasks.md navegue a su definición en spec.md, y detente ahí.
```

En la charla: seguir en el escritorio 2 los archivos que va creando y cómo marca las tareas como hechas en `tasks.md`. Si pregunta algo, leerlo en voz alta: es el momento en que el agente consulta en vez de improvisar.

Commit: `!git add -A && git commit -m "feat: navigate FR-### IDs to their definition"`

### 8. Probar (~2 min)

En la segunda terminal: `./gradlew runIde`. En el IDE de prueba, abrir el propio repo del plugin, ir a `tasks.md` y hacer Ctrl+click en un FR-###: el plugin navegando su propia spec.

## Cierre

`gh repo create peru-jugos-project/speckit-jetbrains-plugin --public --source . --push`

Mostrar el repo recién creado y las tareas pendientes de `tasks.md` como punto de partida para contribuir.
