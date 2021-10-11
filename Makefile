# Run “make build” by default
.DEFAULT_GOAL = build

INPUT = $(wildcard *.tex)
OUTPUT = $(subst .tex,.pdf,$(INPUT))

TEX_BUILDER ?= xelatex
LATEXMK ?= latexmk
LATEXMK_FLAGS ?= -pdf -pdflatex="$(TEX_BUILDER)"

%.pdf: %.tex
	$(LATEXMK) $(LATEXMK_FLAGS) $^ </dev/null > build.log

.PHONY: build
build: $(OUTPUT)

.PHONY: clean
clean:
	$(LATEXMK) -C
	$(RM) build.log
