# Guion de la demo

Interacción con Claude en español; los documentos que genera Spec Kit, en inglés (constitución en inglés). Tiempos de referencia: intento 2 (tiempo del agente / tiempo total de la fase).

La demo parte de un repositorio vacío: el agente crea también el proyecto Gradle durante `implement`. Si el intento 3 muestra que suma demasiado, se vuelve a partir de `base` (el prompt de `plan` de esa variante está en el historial de git de este guion).

## Antes de la charla

Laptop, usuario `demo`:

- [ ] Cargador, adaptador de video, modo no molestar activado, notificaciones apagadas.
- [ ] Repo del plugin vacío (solo `.gitignore`; la licencia y el README los crea el agente por la constitución): `git switch main && git log --oneline --decorate && ls -A`. En vivo se trabaja sobre `main`, que es la rama que sube `gh repo create`.
- [ ] Cachés calientes: Gradle y el IDE ya descargados en el usuario `demo` (un `./gradlew runIde` completo sobre `base` en otra rama o carpeta, y cerrarlo).
- [ ] `claude` con la sesión iniciada; `gh auth status` correcto.
- [ ] Tamaño de letra grande en la terminal y en IntelliJ; tema claro.
- [ ] Escritorio 1: terminal en `~/speckit-jetbrains-plugin`, sin Claude arrancado.
- [ ] Escritorio 2: navegador de archivos sobre el repo del plugin (IntelliJ con vista previa de Markdown).
- [ ] Escritorio 3: presentación en PDF.
- [ ] Segunda terminal para `runIde`, fuera de Claude.
- [ ] La constitución a pegar es la del idioma votado: el principio 8 de cada bloque dice en qué idioma van los artefactos.

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

- Pegar siempre la constitución en inglés (el primer bloque de la fase 2).
- No ejecutar `analyze`.
- Responder `clarify` sin debatir.
- Al abrir el IDE de prueba, mirar "Background Tasks" (barra inferior) y anotar qué hace y cuánto dura.
- Medir aparte, en `implement`, lo que tarda el agente en crear el proyecto (primera fase de `tasks.md`) y lo que tarda en la funcionalidad.

## Durante la demo

En cada fase: copiar el bloque completo, pegarlo y recién entonces Enter. Cada bloque incluye el comando con su texto; así no se olvida el prompt. Al terminar cada fase, el commit desde Claude con `!`.

### 1. Init (~5 s)

```text
time specify init --here --force --integration claude
claude
```

En la charla mostrar: `.specify/` (plantillas, scripts, `memory/constitution.md` vacía) y `.claude/skills/` con los comandos.

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

En la charla: explicar los principios desde el escritorio 3 mientras trabaja. Al terminar, abrir `.specify/memory/constitution.md` y mostrar cómo los reescribió con MUST/SHOULD y le puso versión.

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

En la charla: el prompt dice qué y para quién, no cómo. Al terminar mostrar solo en `specs/001-*/spec.md` las historias con prioridad y la lista de FR-### (lo que el plugin va a enlazar); luego `checklists/requirements.md`. Tenerla abierta antes de empezar para no buscarla.

```text
!git add -A && git commit -m "docs: specify FR-### navigation"
```

### 4. Clarify (~15 s del agente más tus respuestas)

```text
/speckit-clarify
```

Responder sin debatir (en la charla, pidiendo opinión al público si da el tiempo). Al terminar: la sección `## Clarifications` y cómo cada respuesta cambió FRs y supuestos.

```text
!git add -A && git commit -m "docs: clarify FR-### navigation"
```

### 5. Plan

```text
/speckit-plan El proyecto todavía no existe: el repositorio está vacío. Será un plugin de
IntelliJ Platform en Java 21, para IntelliJ Platform 2026.1, construido con
Gradle y sin Kotlin.
```

En la charla: explicar que acá entra la tecnología y el chequeo contra la constitución. Al terminar: `plan.md` (Constitution Check), `research.md` (qué mecanismo eligió y qué descartó), `data-model.md`, `contracts/`.

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

En la charla: seguir en el escritorio 2 los archivos que va creando y cómo marca las tareas como hechas en `tasks.md`. Si pregunta algo, leerlo en voz alta: es el momento en que el agente consulta en vez de improvisar.

```text
!git add -A && git commit -m "feat: navigate FR-### IDs to their definition"
```

### 8. Probar (~2 min)

En la segunda terminal, dentro de `~/speckit-jetbrains-plugin`:

```text
./gradlew runIde
```

En el IDE de prueba, abrir el propio repo del plugin, ir a `tasks.md` y hacer Ctrl+click en un FR-###: el plugin navegando su propia spec.

## Cierre

`gh repo create peru-jugos-project/speckit-jetbrains-plugin --public --source . --push`

Mostrar el repo recién creado y las tareas pendientes de `tasks.md` como punto de partida para contribuir.
