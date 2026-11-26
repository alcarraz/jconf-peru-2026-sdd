# Makefile for SDD presentation

MAIN = sdd-presentation
LATEX = lualatex
BIBTEX = bibtex
LATEX_FLAGS = -shell-escape -interaction=nonstopmode
FIGURES = img/flujo.pdf

$(MAIN).pdf: $(MAIN).tex $(FIGURES)
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	$(BIBTEX) $(MAIN)
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex

quick: $(MAIN).tex $(FIGURES)
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex

img/%.pdf: img/%.mmd img/mermaid.json
	mmdc -i $< -o $@ -c img/mermaid.json -b transparent --pdfFit

clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc *.vrb *.fls *.fdb_latexmk
	rm -f *.bbl *.blg *.bcf *.run.xml
	rm -rf _minted-$(MAIN)/

cleanall: clean
	rm -f $(MAIN).pdf

.PHONY: quick clean cleanall
