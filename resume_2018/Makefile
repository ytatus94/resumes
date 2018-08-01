# Author: Yu-Ting Shen
# This makefile doesn't work yet.

SHELL=/bin/bash

COVER_LETTER=cover_letter_2018
RESUME=resume_2018

TEX=pdflatex
XELATEX=XeLaTeX

all: $(RESUME).pdf $(COVER_LETTER).pdf

.PHONY: clean

clean:
	rm -f *.aux *.fdb_latexmk *.fls *.log *.out *.synctex.gz *.xdv

$(RESUME).pdf: $(RESUME).tex
	$(XELATEX) $(RESUME)

$(COVER_LETTER).pdf: $(COVER_LETTER).tex
	$(TEX) $(COVER_LETTER)

