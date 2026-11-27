# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Material for the JConf Perú 2026 talk "Lanzando un proyecto open source en vivo con Spec-Driven Development" (2026-11-28, 50 min including Q&A). The talk is a live Spec Kit demo that builds the `speckit-jetbrains-plugin` IntelliJ plugin. That plugin lives in a separate repo (`../speckit-jetbrains-plugin`), not here.

- `presentacion/`: the Beamer deck, the only public content. See `presentacion/CLAUDE.md` for the visual validation workflow.
- `demo/`: empty on purpose. Prompts and constitutions will be published here after the talk.

## Talk facts

- Event: JConf Perú 2026, 2026-11-28, Edificio SOHO Plus, Lima.
- The plugin is the first project of Peru JUGOS (Java User Group Open Source). It is published live at the end of the demo as https://github.com/peru-jugos-project/speckit-jetbrains-plugin (GitHub organization `peru-jugos-project`); that is the URL for the closing slide and its QR code. Pending tasks from its `tasks.md` are the invitation to contribute.
- This repo (slides and, after the talk, the demo material) is https://github.com/alcarraz/jconf-peru-2026-sdd.
- Plugin: Java on the IntelliJ Platform (2026.1, Java 21 toolchain), plugin ID `io.github.perujugosproject.speckit`, Apache-2.0. It makes Spec Kit requirement IDs (`FR-###`) in a feature's Markdown files navigate to their definition in that feature's `spec.md`.
- Demo tooling: Spec Kit CLI 1.4.3 with Claude Code. The interaction with the agent is in Spanish; the audience votes whether the generated documents are in Spanish or English.

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
