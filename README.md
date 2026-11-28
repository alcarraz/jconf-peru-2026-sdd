# Lanzando un proyecto open source en vivo con Spec-Driven Development

Material de la charla en JConf Perú 2026 (28 de noviembre de 2026, Lima).

La presentación es [`presentacion/sdd-presentation.pdf`](presentacion/sdd-presentation.pdf). Durante la demo se construye en vivo con [Spec Kit](https://github.com/github/spec-kit) el plugin de IntelliJ [`speckit-jetbrains-plugin`](https://github.com/peru-jugos-project/speckit-jetbrains-plugin), el primer proyecto de Peru JUGOS.

En `demo/` se publicarán, después de la charla, los prompts y la constitución usados en la demo.

## Construir la presentación

La presentación está hecha en LaTeX con Beamer. Se necesitan `lualatex`, `bibtex` y el soporte de babel para español. En Debian o Ubuntu:

```bash
sudo apt install texlive-luatex texlive-lang-spanish texlive-bibtex-extra
```

Desde `presentacion/`:

```bash
make         # compilación completa, con las referencias
make quick   # una sola pasada, para editar
```

El contenido de cada sección está en `presentacion/sections/`, y el estilo en `presentacion/presentacion.cls`.
