# Guion de la demo

Interacción con Claude en español; los documentos que genera Spec Kit, en el idioma que vote el público (constitución en inglés o en español). Los tiempos entre paréntesis son referencias de los ensayos: tiempo del agente.

La demo parte de un repositorio vacío: el agente crea también el proyecto Gradle durante `implement`. Si eso suma demasiado, se vuelve a partir de `base` (el prompt de `plan` de esa variante está en el historial de git de este guion).

`N` es el contador de ensayos de la bitácora (`ignored/sesion-prueba.md`): una variable de la shell de la terminal 1 que se incrementa en cada ensayo. Si se reabre la terminal, redefinirla con el número del último ensayo hecho.

## Antes de la charla

Laptop, usuario `demo`:

- [ ] Cargador, adaptador de video, modo no molestar activado, notificaciones apagadas.
- [ ] `main` del plugin apunta a `vacio` (solo `.gitignore`; la licencia y el README los crea el agente por la constitución) y sin restos de ensayos. En vivo se trabaja sobre `main`, que es la rama que sube `gh repo create`:

  ```text
  cd ~/speckit-jetbrains-plugin && git switch main && rm -rf .specify .claude && ls -A && git log --oneline --decorate
  ```

  Debe verse solo `.git` y `.gitignore`, más las cachés ignoradas (`.gradle`, `.intellijPlatform`, `build`, `.idea`), y un único commit con la etiqueta `vacio`.
- [ ] Cachés calientes: Gradle y el IDE ya descargados en el usuario `demo` (un `./gradlew runIde` completo en cualquier rama de un ensayo, y cerrarlo).
- [ ] `claude` con la sesión iniciada; `gh auth status` correcto.
- [ ] Tamaño de letra grande en la terminal y en IntelliJ; tema claro.
- [ ] Escritorio 1: terminal en `~/speckit-jetbrains-plugin`, sin Claude arrancado.
- [ ] Escritorio 2: navegador de archivos sobre el repo del plugin (IntelliJ con vista previa de Markdown), con `spec.md` lista para abrir.
- [ ] Escritorio 3: presentación en PDF.
- [ ] Segunda terminal para `runIde`, fuera de Claude.
- [ ] Un ensayo reciente completo en su rama `intento-*`, como respaldo.

## Ensayo

Objetivo: medir lo mínimo posible, sin explicar en voz alta ni simular la charla. Anotar con la hora cualquier duda o demora.

Preparar la rama del ensayo, desde el repo vacío y sin restos del anterior:

```text
cd ~/speckit-jetbrains-plugin && git switch -c intento-$((++N)) vacio && rm -rf .specify .claude && ls -A
```

Debe verse solo `.git` y `.gitignore`, más las cachés ignoradas. La etiqueta `vacio` se creó una sola vez, con `git switch --orphan`, `git checkout base -- .gitignore` y un commit inicial.

Reglas del ensayo:

- Pegar siempre la constitución en inglés (el primer bloque de la fase 2), salvo que el ensayo pruebe el español.
- No ejecutar `analyze`.
- Responder `clarify` sin debatir.
- Al abrir el IDE de prueba, mirar "Background Tasks" (barra inferior) y anotar qué hace y cuánto dura.
- Medir aparte, en `implement`, lo que tarda el agente en crear el proyecto (primera fase de `tasks.md`) y lo que tarda en la funcionalidad.
- Al terminar: la transcripción se copia a la máquina de desarrollo y los tiempos se anotan en la bitácora.

## Durante la demo

En cada fase: copiar el bloque completo, pegarlo y recién entonces Enter. Cada bloque incluye el comando con su texto; así no se olvida el prompt. Al terminar cada fase, el commit desde Claude con `!`.

### 1. Init (~5 s)

```text
time specify init --here --force --integration claude
claude
```

En la charla real, mostrar: `.specify/` (plantillas, scripts, `memory/constitution.md` vacía) y `.claude/skills/` con los comandos.

```text
!git add -A && git commit -m "chore: initialize Spec Kit"
```

### 2. Constitution (~25 s)

Pegar la del idioma votado. Documentos en inglés:

```text
/speckit-constitution Principles for speckit-jetbrains-plugin, an open source JetBrains IDE plugin
that makes references between Spec Kit artifacts navigable.

1. Java only: plugin sources and tests are written in Java, so that any Java
   developer can contribute. Build with the IntelliJ Platform Gradle Plugin.
2. Platform first: use IntelliJ Platform APIs before adding any third-party
   dependency.
3. Stock Spec Kit: work with the files Spec Kit generates as they are; never
   require users to change the format of their artifacts.
4. Every IDE: depend only on the platform and bundled plugins, so it runs on
   any IntelliJ-based IDE, not only IntelliJ IDEA.
5. Tested: every reference type has platform tests (BasePlatformTestCase with
   test data files) covering resolution and missing targets.
6. Responsive: reference resolution never blocks the UI thread and scales to
   projects with many features.
7. Traceable: each change traces to a requirement or task in the feature's
   specification.
8. Language: code, comments, commits and specification artifacts are written
   in English, whatever language the conversation is held in.
9. Open source: the project is licensed under Apache-2.0 and includes a README
   that explains how to build, run and contribute.
```

Documentos en español:

```text
/speckit-constitution Principles for speckit-jetbrains-plugin, an open source JetBrains IDE plugin
that makes references between Spec Kit artifacts navigable.

1. Java only: plugin sources and tests are written in Java, so that any Java
   developer can contribute. Build with the IntelliJ Platform Gradle Plugin.
2. Platform first: use IntelliJ Platform APIs before adding any third-party
   dependency.
3. Stock Spec Kit: work with the files Spec Kit generates as they are; never
   require users to change the format of their artifacts.
4. Every IDE: depend only on the platform and bundled plugins, so it runs on
   any IntelliJ-based IDE, not only IntelliJ IDEA.
5. Tested: every reference type has platform tests (BasePlatformTestCase with
   test data files) covering resolution and missing targets.
6. Responsive: reference resolution never blocks the UI thread and scales to
   projects with many features.
7. Traceable: each change traces to a requirement or task in the feature's
   specification.
8. Language: code, comments and commits are written in English. Specification
   artifacts are written in Spanish.
9. Open source: the project is licensed under Apache-2.0 and includes a README
   that explains how to build, run and contribute.
```

En la charla real: explicar los principios desde el escritorio 3 mientras trabaja. Al terminar, abrir `.specify/memory/constitution.md` y mostrar cómo los reescribió con MUST/SHOULD y le puso versión.

```text
!git add -A && git commit -m "docs: adopt project constitution"
```

### 3. Specify (~35 s)

```text
/speckit-specify Un plugin para IDEs de JetBrains que vuelve navegables los IDs de requisitos
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

En la charla real: el prompt dice qué y para quién, no cómo. Al terminar mostrar solo en `specs/001-*/spec.md` las historias con prioridad y la lista de FR-### (lo que el plugin va a enlazar); luego `checklists/requirements.md`. Tenerla abierta antes de empezar para no buscarla.

```text
!git add -A && git commit -m "docs: specify FR-### navigation"
```

### 4. Clarify (~15 s del agente más tus respuestas)

```text
/speckit-clarify
```

Responder sin debatir (en la charla real, pidiendo opinión al público si da el tiempo). Al terminar: la sección `## Clarifications` y cómo cada respuesta cambió FRs y supuestos.

```text
!git add -A && git commit -m "docs: clarify FR-### navigation"
```

### 5. Plan

```text
/speckit-plan El proyecto todavía no existe: el repositorio está vacío. Será un plugin de
IntelliJ Platform en Java 21, para IntelliJ Platform 2026.1, construido con
Gradle y sin Kotlin.
```

En la charla real: explicar que acá entra la tecnología y el chequeo contra la constitución. Al terminar: `plan.md` (Constitution Check), `research.md` (qué mecanismo eligió y qué descartó), `data-model.md`, `contracts/`.

```text
!git add -A && git commit -m "docs: plan FR-### navigation"
```

### 6. Tasks (~45 s)

```text
/speckit-tasks
```

Al terminar: fases (la primera es el andamiaje del proyecto), `[P]` para lo paralelizable, etiquetas de historia y cómo cada tarea cita su FR: la trazabilidad que el plugin va a volver navegable. No ejecutar `analyze` en el ensayo ni en la charla.

```text
!git add -A && git commit -m "docs: break down FR-### navigation tasks"
```

### 7. Implement

```text
/speckit-implement Implementa solo las tareas necesarias hasta que Ctrl+click sobre un ID FR-###
en tasks.md navegue a su definición en spec.md, y detente ahí.
```

En la charla real: seguir en el escritorio 2 los archivos que va creando y cómo marca las tareas como hechas en `tasks.md`. Si pregunta algo, leerlo en voz alta: es el momento en que el agente consulta en vez de improvisar.

```text
!git add -A && git commit -m "feat: navigate FR-### IDs to their definition"
```

### 8. Probar (~2 min)

En la segunda terminal, dentro de `~/speckit-jetbrains-plugin`:

```text
./gradlew runIde
```

En el IDE de prueba, abrir el propio repo del plugin, ir a `tasks.md` y hacer Ctrl+click en un FR-###: el plugin navegando su propia spec.

## La charla real

Lo que cambia respecto al ensayo:

- **Sin medición.** Se escribe `specify init --here --force --integration claude` sin `time`, y no se anota nada.
- **Se trabaja sobre `main`**, que ya apunta a `vacio`, no sobre una rama de ensayo.
- **El público vota el idioma de los documentos** antes de la fase 2: se muestran las dos constituciones del escritorio y se pega el bloque de la que gane. La interacción sigue en español.
- **Se explica en voz alta** mientras el agente trabaja, siguiendo las notas "En la charla real" de cada fase. Es lo que justifica el tiempo: el agente tarda minutos y el resto es contenido.
- **`analyze` es opcional**: solo si sobra tiempo, para mostrar el informe de consistencia.

Minutos de la charla (50 min en total; las diapositivas de presentación, Peru JUGOS y SDD ocupan los primeros 7). Son una referencia para ir con calma, no cortes: se avanza con naturalidad todo lo que se pueda.

| Fase | Empieza (min) | Dura |
|---|---|---|
| Constitución (con `init`) | 7 | 2 |
| `specify` | 9 | 7 |
| `clarify` | 16 | 4 |
| `plan` | 20 | 6 |
| `tasks` | 26 | 3 |
| `implement` | 29 | 8 |
| `runIde` y Ctrl+click | 37 | 5 |
| Cierre | 42 | 3 |
| Preguntas | 45 | 5 |

El respaldo se usa solo si se ve que no se llega al final. Mostrar el resultado del respaldo (abrir el worktree y `runIde`) toma unos 5 min, estimados sin probar: decidirlo a más tardar hacia el minuto 37. Los minutos no se han probado con público: recalibrarlos tras el primer ensayo que los siga.

El respaldo es la rama vigente de la sección "Respaldo vigente" de la bitácora (una por idioma de los documentos).

Si se ve que no se llega al final, mostrar el resultado del respaldo sin tocar `main`. En otra terminal, con `<M>` el número de la rama de respaldo vigente:

```text
cd ~/speckit-jetbrains-plugin && git worktree add ../respaldo intento-<M> && cd ../respaldo && ./gradlew runIde
```

Mostrar el escritorio 2 sobre `../respaldo` y hacer Ctrl+click en un FR-### de su `tasks.md`. Los documentos de las fases que faltan ya están en esa rama, uno por commit (`git log --oneline`).

## Cierre

```text
gh repo create peru-jugos-project/speckit-jetbrains-plugin --public --source . --push
```

Mostrar el repo recién creado y las tareas pendientes de `tasks.md` como punto de partida para contribuir. Convertir esas tareas en issues con la extensión `github` (`specify extension add github`, luego `/speckit-taskstoissues`) no está ensayado: probarlo antes de la charla y, en la charla, solo si hay tiempo.
