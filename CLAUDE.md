# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Material for the JConf Perú 2026 talk "Lanzando un proyecto open source en vivo con Spec-Driven Development" (2026-11-28, 50 min including Q&A). The talk is a live Spec Kit demo that builds the `speckit-jetbrains-plugin` IntelliJ plugin. That plugin lives in a separate repo (`../speckit-jetbrains-plugin`), not here.

- `presentacion/`: the Beamer deck, the only public content. See `presentacion/CLAUDE.md` for the visual validation workflow.
- `demo/`: empty on purpose. Prompts and constitutions will be published here after the talk.

## Build

From `presentacion/`:

```bash
make quick      # one lualatex pass (use while editing)
make            # lualatex + bibtex + two more passes (needed for references)
./continuous-build.sh   # rebuilds on .tex/.cls changes; needs inotifywait
```

Needs `lualatex`, `bibtex` and the Spanish babel files (Debian: `texlive-luatex`, `texlive-lang-spanish`, `texlive-bibtex-extra`). The build uses `-shell-escape`.

## Structure that spans files

`sdd-presentation.tex` only sets up the deck and `\input`s `sections/01-…08-*.tex` in order, using the custom class `presentacion.cls`. The bibliography is `referencias.bib` (BibTeX through biblatex); `sdd-presentation-blx.bib` is generated. The built `sdd-presentation.pdf` is tracked; every other build artifact is gitignored.
